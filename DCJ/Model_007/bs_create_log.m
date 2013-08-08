


[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3 EV] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);

statdir = 'C:\fMRI data\DCJ\SPM\stat\Model_0007\FFX';

% Set time in seconds, was in ms
Onset = Onset / 1000;
Duration = Duration / 1000;

%counting subjects (21)
nSubj = numel(unique(Subject));


% design: 3 runs. To define separately because counter restarts (look at
% the time restarting after trial 24, 48 etc.) 
% RUN 1 --> trial 1-24
% RUN 2 --> trial 25-48
% RUN 3 --> trial 49-72
Runs = {1:24 25:48 49:72};

% Model 1:
% BOLD = evaluation_1 UP + evaluation_1 DOWN + evaluation_2 UP +
%        evaluation_2 DOWN + evaluation_3 UP + evaluation_3 DOWN +
%        evaluation_123 UP + evaluation_123 DOWN +
%        Residual;1;1 +  Residual;1;2 + Residual;1;3 + Residual;2;1

for Subj = unique(Subject)'

    for iRuns = 1:numel(Runs)
        
        %SPM needs variables with these names to run the analysis
        names = {};
        onsets = {};
        durations = {};
        pmod = struct('name', {}, 'param', {}, 'poly', {}); % and, within, pmod (parametric modulation), you must have these variables, name, param, poly
        
        %creating container "names", the 1st element of which I call
        %"evaluation;1
        n = 1;
        names{n} = 'evaluation;1'; 
        i = (Subject == Subj) & strcmp(Event, 'evaluation_1') & ... %look for element that meets these conditions: subject=1, event=evaluation1, and period is part of run1
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i); %onset 1 is equal to the number that I just found
        durations{n} = Duration(i);%this I'm free to decide, its going to indicate the time window in which I investigate whether the regressor has any effect. 

     
        pmod(n).name{1} = 'EV';
        pmod(n).param{1} = EV(i);
        pmod(n).poly{1} = 1;
        
        n = n + 1;
        names{n} = 'evaluation;2';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_2') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = Duration(i);

        pmod(n).name{1} = 'EV';
        pmod(n).param{1} = EV(i);
        pmod(n).poly{1} = 1;

        n = n + 1;
        names{n} = 'evaluation;3';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_3') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = Duration(i);

        pmod(n).name{1} = 'EV';
        pmod(n).param{1} = EV(i);
        pmod(n).poly{1} = 1;

        n = n + 1;
        names{n} = 'evaluation;123';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_123') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = Duration(i);
         
        pmod(n).name{1} = 'EV';
        pmod(n).param{1} = EV(i);
        pmod(n).poly{1} = 1;

        

        outdir = fullfile(statdir, sprintf('Subject%02d', Subj), 'LOG'); %create an output file in statdir with the current subject's number
                         
        % Create output directory if it doesn't exist
        if ~exist(outdir, 'dir')
            mkdir(outdir);
        end
        
        fname = fullfile(outdir, sprintf('logRun%d', iRuns));
        save(fname, 'names', 'onsets', 'durations', 'pmod');
    end
end
