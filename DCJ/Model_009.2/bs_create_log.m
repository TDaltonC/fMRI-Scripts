[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);

statdir = 'C:\fMRI data\DCJ\SPM\stat\Model_0009.2\FFX';

% Set time in seconds
Onset = Onset / 1000;
Duration = Duration / 1000;

nSubj = numel(unique(Subject));

% RUN 1 --> trial 1-24
% RUN 2 --> trial 25-48
% RUN 3 --> trial 49-72
Runs = {1:24 25:48 49:72};


for Subj = unique(Subject)'

    for iRuns = 1:numel(Runs)
        
        names = {};
        onsets = {};
        durations = {};
        pmod = struct('name', {}, 'param', {}, 'poly', {});
        
%Bet Increase     
        %inorder to get the paramaterization to come out right, I need to
        %make a vector that code for just the change to the second bet and
        %another that codes for the change in the second bet.
        n = 1;
        names{n} = 'increase';
        j = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_2') & (Bet2-Bet1 > 3)));            
        k = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_3') & (Bet3-Bet2 > 3)));
        i = (j|k);
        onsets{n} = Onset(i);
        durations{n} = .5;

        %this is to clear out the variables incase they change size.
        clear j k i jnum knum p 
   
        
 %Bet Decrease       
        n = n+1;
        names{n} = 'decrease';
        j = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_2') & (Bet2-Bet1 < -3)));
        k = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_3') & (Bet3-Bet2 < -3)));
        i = (j|k);
        onsets{n} = Onset(i);
        durations{n} = .5;
    
         %this is to clear out the variables incase they change size.
        clear j k i jnum knum p 
    
        
        n = n+1;
        names{n} = 'Bet;win';
        j = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_2') & (Winout1 == 1)));
        k = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_3') & (Winout2 == 1)));
        i = (j|k);
        onsets{n} = Onset(i);
        durations{n} = 0.5;

        %this is to clear out the variables incase they change size.
        clear j k i jnum knum p
        
        
        n = n + 1;
        names{n} = 'Bet;lose';
        j = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_2') & (Winout1 == 0)));
        k = ((Subject == Subj) & ismember(Period, Runs{iRuns}) & ...
            (strcmp(Event, 'evaluation_3') & (Winout2 == 0)));
        i = (j|k);
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        
        %this is to clear out the variables incase they change size.
        clear j k i jnum knum p
        
        
        
        outdir = fullfile(statdir, sprintf('Subject%02d', Subj), 'LOG');
                         
        % Create output directory if it doesn't exist
        if ~exist(outdir, 'dir')
            mkdir(outdir);
        end
        
        fname = fullfile(outdir, sprintf('logRun%d', iRuns));
        save(fname, 'names', 'onsets', 'durations', 'pmod');
    end
end