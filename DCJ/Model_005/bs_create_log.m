[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);

statdir = 'C:\fMRI data\DCJ\SPM\stat\Model_0005\FFX';

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
        
        n = 1;
        names{n} = 'Bet;1win';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_2') & ...
            (Winout1 == 1) & ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet1';
        pmod(n).param{1} = Bet1(i);
        pmod(n).poly{1} = 1;
        
        n = n + 1;
        names{n} = 'Bet;1lose';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_2') & ...
            (Winout1 == 0) & ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet1';
        pmod(n).param{1} = Bet1(i);
        pmod(n).poly{1} = 1;

        n = n + 1;
        names{n} = 'Bet;2win';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_3') & ...
            (Winout2 == 1) & ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet2';
        pmod(n).param{1} = Bet2(i);
        pmod(n).poly{1} = 1;

        n = n + 1;
        names{n} = 'Bet;2lose';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_3') & ...
            (Winout2 == 0) & ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet2';
        pmod(n).param{1} = Bet2(i);
        pmod(n).poly{1} = 1;
       
        n = n + 1;
        names{n} = 'Bet;3win';
        i = (Subject == Subj) & strcmp(Event, 'outcome_3') & ...
            (Winout3 == 1) & ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet3';
        pmod(n).param{1} = Bet3(i);
        pmod(n).poly{1} = 1;
        
        n = n + 1;
        names{n} = 'Bet;3lose';
        i = (Subject == Subj) & strcmp(Event, 'outcome_3') & ...
            (Winout3 == 0) & ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet3';
        pmod(n).param{1} = Bet3(i);
        pmod(n).poly{1} = 1;
          
        n = n + 1;
        names{n} = 'Bet;123win';
        i = (Subject == Subj) & strcmp(Event, 'outcome_123') & ...
            (((Winout1 == 1)&(Winout2 == 1))|((Winout1 == 1)&(Winout3 == 1))|((Winout2 == 1)&(Winout3 == 1))) & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet1';
        pmod(n).param{1} = Bet1(i);
        pmod(n).poly{1} = 1;

        n = n + 1;
        names{n} = 'Bet;123lose';
        i = (Subject == Subj) & strcmp(Event, 'outcome_123') & ...
            (((Winout1 == 0)&(Winout2 == 0))|((Winout1 == 0)&(Winout3 == 0))|((Winout2 == 0)&(Winout3 == 0))) & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;
        pmod(n).name{1} = 'Bet1';
        pmod(n).param{1} = Bet1(i);
        pmod(n).poly{1} = 1;
       
        n = n + 1;
        names{n} = 'Residual;1;1';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_2') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + .5;
        durations{n} = Duration(i) - .5;

        n = n + 1;
        names{n} = 'Residual;1;2';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_3') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + .5;
        durations{n} = Duration(i) - .5;
        
        n = n + 1;
        names{n} = 'Residual;1;3';
        i = (Subject == Subj) & strcmp(Event, 'outcome_3') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + .5;
        durations{n} = Duration(i) - .5;

        n = n + 1;
        names{n} = 'Residual;2;1';
        i = (Subject == Subj) & strcmp(Event, 'outcome_123') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + .5;
        durations{n} = Duration(i) - .5;

        outdir = fullfile(statdir, sprintf('Subject%02d', Subj), 'LOG');
                         
        % Create output directory if it doesn't exist
        if ~exist(outdir, 'dir')
            mkdir(outdir);
        end
        
        fname = fullfile(outdir, sprintf('logRun%d', iRuns));
        save(fname, 'names', 'onsets', 'durations', 'pmod');
    end
end
