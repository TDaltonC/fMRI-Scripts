function MARSBAR_script_goodexemple
% MarsBaR batch script
%
% Nadege Bault April 2008, largely cannibalized from
% run_tutorial in the example marsbar data set (batch directory) by matthewbrett
% See http://marsbar.sourceforge.net

%% changed by user

% path to directory containing subjects' directories (1 directory per subject):
subjects_dir = '/home/nbault/Sujets/';
% path to directory containing subjects' models estimation results. Must be
% the same in each subjects' directories.  May contains folders with
% several model estimations.
model_path = '/results/full_model2_canonical';
% random effect path:
ROI_path = '/home/nbault/Sujets/Group_Analysis/full_model2/canonical/ROIs/choice_fact_mainsco_unc0.0005_vx10/ROIs';
ROI_names = {'inf'};           %if using all ROI contained in ROI_path, type ROI_files='inf'

% folder where to save marsbar reconfigured design
Est_path = '/results/full_model2_MarsAna/choice_fact_mainsco_unc0.0005_vx10';
% folder where to save results, time course...
Res_path = '/home/nbault/Sujets/Group_Analysis/full_model2/canonical/ROIs/choice_fact_mainsco_unc0.0005_vx10/results';

% subject list:
sub_name = {'01_CARCE' '02_LYOCH' '03_HOMIB' '04_LOTSA' '05_MUNAL' '06_LEMLA'...
    '07_COLGR' '08_MAZHE' '09_FERPH' '10_CAPAN' '11_PONBE' '12_GARMA'...
    '13_HERJE' '14_HERLU' '15_MUTBR' '16_CERBL' '17_ROCJU' '18_CHOSA'...
    '19_HORJE' '20_NIETH' '21_PORGA' '22_MALNO' '23_FAYFA' '24_MORAN'};

% Regressors for which we wants stats and stuffs, not used in the script
% for now. see line 171
% Ic = [1 3 5];

% If your events have the same name across sessions, do you want to average across the event with the same name?
together = 1;     % 0 for no, 1 for yes

event_duration = 0; % default SPM event duration
time_course = 'Fitted';      % 'FIR' or 'Fitted'

% for FIR time course only: Length of FIR in seconds
fir_length = 20;
% bin_length will be set = TR
% bin_no will be set = fir_length/bin_length

opts = struct('percent',1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% defaults
% MarsBaR version check
if isempty(which('marsbar'))
    error('Need MarsBaR on the path');
end
v = str2num(marsbar('ver')); %#ok<ST2NM>
if v < 0.35
    error('Batch script only works for MarsBaR >= 0.35');
end
marsbar('on');  % needed to set paths etc

% SPM version check. We need this to guess which model directory to use and
% to get the SPM configured design name.
spm_ver = spm('ver');
sdirname = [spm_ver '_ana'];     
if strcmp(spm_ver, 'SPM99')
    conf_design_name = 'SPMcfg.mat';
else
    spm_defaults;
    conf_design_name = 'SPM.mat';
end

% Set up the SPM defaults, just in case
spm('defaults', 'fmri');



%% Define ROIs to be estimated

if strcmp(ROI_names,'inf')
    roi_list = dir(fullfile(ROI_path, '*roi.mat'));
    ROI_names = {roi_list.name}';
    if size(roi_list,1)==0, disp('no roi file in roi folder'), end
end

for i=1:size(ROI_names,1);
    ROI_array{i} = maroi(fullfile(ROI_path, ROI_names{i}));
end;


%% estimate model

for subject = 1:size(sub_name, 2)           % loop for subjects
    subj_dir = fullfile(subjects_dir, sub_name{subject});
    model_dir = fullfile(subj_dir, model_path);      % reconstucts results directory's full path
    disp(model_dir)

    clear model_file
    model_file = fullfile(model_dir, 'SPM.mat');

    % creates marsbar analysis directory if doesn't exist
    if  ~exist(fullfile(subj_dir, Est_path), 'dir')
        mkdir(subj_dir, Est_path);
    end 

    for roi_no = 1:length(ROI_array)     % loop for rois
        roi = ROI_array{roi_no};

        if exist(fullfile(subj_dir, Est_path, ['mars_' label(ROI_array{roi_no}) '.mat']), 'file')
            load(fullfile(subj_dir, Est_path, ['mars_' label(ROI_array{roi_no}) '.mat']))
        else
            % Makes marsbar design object
            D = mardo(model_file);
            % D = mardo(model_file{ss});
            if ~is_spm_estimated(D)
                print('Model has not been estimated by SPM. ');
            end

            % Extract data
            Y = get_marsy(roi, D, 'mean');
            sumY = summary_data(Y);       %% get summary time course(s)

            % MarsBaR estimation
            E = estimate(D, Y);

            % import contrasts
            if has_contrasts(D)   % got contrasts?
                xCon = get_contrasts(D);          % Get contrasts from original design
                E = set_contrasts(E, xCon);        % Put contrasts from original design into design object
            end

            save_spm(E, fullfile(subj_dir, Est_path, ['SPM_' label(ROI_array{roi_no})]));
            save(fullfile(subj_dir, Est_path, ['mars_' label(ROI_array{roi_no})]), 'E', 'Y', 'sumY');

        end
        
        b = betas(E);
        
        if together == 1
            ets = event_types_named(E);
            event_spec = {ets.e_spec};
            event_names = {ets.name};
            n_event_types = length(ets);
        else
            [event_spec, event_names] = event_spects(E);
            n_event_types = size(event_spec, 2);
        end

        if subject == 1
            Data(roi_no).roi_name = ROI_names{roi_no};
            % create a table of NaNs in case of missing values
            Data(roi_no).beta = NaN(size(sub_name,2), size(b',2));
        end
        
        Data(roi_no).beta(subject,1:size(b',2)) =  b';
        if size(Data(roi_no).beta, 2) > size(b,1)
            Data(roi_no).beta(subject,size(b,1)+1:end) =  NaN;
        end
        
        Data(roi_no).summary_time_course(subject,1:size(sumY,1)) =  sumY';
        if size(Data(roi_no).summary_time_course, 2) > size(sumY,1)
            Data(roi_no).summary_time_course(subject,size(sumY,1)+1:end) =  NaN;
        end

%         % Get, store statistics
%         stat_struct = compute_contrasts(E, Ic);
%         Data(roi_no).stats(subject,:) = stat_struct;   
  
%% time course and percent signal change
        if strcmp('Fitted', time_course)
            for i = 1:n_event_types
                % And fitted time courses
                [tc{i} dt(i)] = event_fitted(E, event_spec{i}, event_duration);
                %[tc{i} dt(i)] = event_fitted(E, ets(i).e_spec, event_duration);
                % Make fitted time course into ~% signal change
                tc{i} = tc{i} / block_means(E) * 100;
                psc = event_signal(E, event_spec{i}, event_duration);
                
                % create a stuture with time course from all subjects
                if subject == 1
                    TC(roi_no, i).roi_name =label(ROI_array{roi_no});
                    TC(roi_no, i).event_name = event_names{i};
                    %TC(roi_no, i).event_name = ets(1,i).name;
                    TC(roi_no, i).values(subject,:) =  sum(tc{1,i},2);   % several columns in tc but only the first have non zeros (???)
                    TC(roi_no, i).time(subject,:) =  dt(i);
                    PSC(roi_no).roi_name = label(ROI_array{roi_no});
                    PSC(roi_no).event_name = event_names;
                    PSC(roi_no).values(subject,i) = psc;
                else
                    idx = find(strcmp(event_names{i}, {TC(1,:).event_name}));
                    if ~isempty(idx)
                        TC(roi_no, idx).values(subject,:) =  sum(tc{1,i},2);
                    else
                        TC(roi_no, size(TC,2)+1).values(subject,:) =  sum(tc{1,i},2);   % several columns in tc but only the first have non zeros (???)
                        TC(roi_no, size(TC,2)+1).time(subject,:) =  dt(i);
                    end
                    PSC(roi_no).values(subject,i) = psc;
                end
            end

        elseif strcmp('FIR', time_course)
            
            % Bin size in seconds for FIR
            bin_length = tr(E);
            % Number of FIR time bins to cover length of FIR
            bin_no = fir_length / bin_length;
            
            for i = 1:n_event_types
                % cacluate time course
                tc{i} = event_fitted_fir(E, ...
                    event_spec{i}, ... 
                    bin_length,...
                    bin_no, ...
                    opts);
                
                psc = event_signal(E, event_spec{i}, event_duration);
                
                % create a stuture with time course from all subjects
                if subject == 1
                    TC(roi_no, i).roi_name = label(ROI_array{roi_no});
                    TC(roi_no, i).event_name = event_names{i};
                    TC(roi_no, i).values =  NaN(size(sub_name,2), bin_no);
                    TC(roi_no, i).values(subject,:) =  tc{1,i};
                    PSC(roi_no, i).roi_name = label(ROI_array{roi_no});
                    PSC(roi_no, i).event_name = event_names;
                    PSC(roi_no, i).values(subject,:) = psc;
                else
                    idx = find(strcmp(ets(1,i).name, {TC(1,:).event_name}));
                    if ~isempty(idx)
                        TC(roi_no, idx).values(subject,:) =  tc{1,i};
                    else
                        TC(roi_no, size(TC,2)+1).event_name = event_names{i};          
                        TC(roi_no, size(TC,2)+1).values =  NaN(size(sub_name,2), bin_no);
                        TC(roi_no, size(TC,2)+1).values(subject,:) =  tc{1,i};
                    end
                    PSC(roi_no, i).values(subject,:) = psc;
                end
            end

            save(fullfile(Est_path, [sub_name{subject} '_' label(ROI_array{roi_no}) '_Time_course']), 'tc', 'ets');
            clear tc
        end
    end    % end loop rois
end     % end loop subjects

%% Group means and graphs

% creates marsbar analysis directory if doesn't exist
if  ~exist(Res_path, 'dir')
    mkdir(Res_path);
end 


for roi_no = 1:size(TC,1)
    for ev_t = 1:size(TC,2)
        Mean_TC{roi_no, ev_t}.roi_name = TC(roi_no, ev_t).roi_name;
        Mean_TC{roi_no, ev_t}.event_name = TC(roi_no, ev_t).event_name;
        Mean_TC{roi_no, ev_t}.values = nanmean(TC(roi_no, ev_t).values);
        Mean_PSC(roi_no).roi_name = PSC(roi_no).roi_name;
        Mean_PSC(roi_no).event_name = PSC(roi_no).event_name;
        Mean_PSC(roi_no).values = nanmean(PSC(roi_no).values);
    end
    
    
    if strcmp('Fitted', time_course)
        secs = ([1:size(Mean_TC{roi_no, ev_t}.values, 2)]-1) * dt(ev_t); %#ok<NBRAK>
    elseif strcmp('FIR', time_course)
        secs = ([1:bin_no]-1) * bin_length + bin_length/2; %#ok<NBRAK>
    end
        
%     %plot mean time course (across subjects for each event
%     figure('Name',Mean_TC{roi_no, i}.roi_name(1:end-4))
%     if n_event_types > 1, p_cols = 2; else p_cols = 1; end
%     p_rows = ceil(n_event_types / p_cols);
%     last_row_starts = (p_rows-1) * p_cols + 1;
% 
%     for i = 1:n_event_types
%         subplot(p_rows, p_cols, i);
%         plot(secs, Mean_TC{roi_no, i}.values);
%         title(Mean_TC{roi_no, i}.event_name);
%         if i >= last_row_starts, xlabel('Seconds'); end
%         if rem(i-1, p_cols)==0, ylabel('Signal change'); end
%     end
%     
%     if strcmp('Fitted', time_course)
%         legend('Event fitted time course', 'Location', 'BestOutside');
%     elseif strcmp('FIR', time_course)
%        legend('FIR time course', 'Location', 'BestOutside');
%     end
%     saveas(gcf, fullfile(Res_path, [Mean_TC{roi_no, i}.roi_name(1:end-4) '.fig']));   
end

save(fullfile(Res_path, 'Mean_time_course'), 'TC', 'Mean_TC')
save(fullfile(Res_path, 'Mean_percent_signal_change'), 'PSC', 'Mean_PSC')
save(fullfile(Res_path, 'Data&betas'), 'Data')

%% print results in txt file
fid = fopen(fullfile(Res_path, 'percent_signal_change.txt'), 'w');
fprintf(fid, 'ROI ');
e_n = char(event_names);
e_n(:, size(e_n, 2)+1) = ' ';
fprintf(fid, '%s\t\n', e_n');

for l = 1:length(Mean_PSC)
    rn = {Mean_PSC(l).roi_name};
    val = Mean_PSC(l).values;
    fprintf(fid, '%s\t', char(rn)', val);
    fprintf(fid, '\n');
end

fclose(fid);

for rn=1:length(PSC)
    fid = fopen(fullfile(Res_path, ['sig_ch_' PSC(1,rn).roi_name '.txt']), 'w');
    fprintf(fid, 'ID\t');
    fprintf(fid, '%s\t\n', e_n');
    for l=1:length(sub_name)
        sub = sub_name{l};
        val = PSC(rn).values(l,:);
        fprintf(fid, '%s\t', char(sub)', val);
        fprintf(fid, '\n');
    end
    fclose(fid);
end
