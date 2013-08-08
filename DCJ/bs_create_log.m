[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);

statdir = 'C:\fMRI data\DCJ\SPM\stat\Model_0001\FFX';

% Set time in seconds
Onset = Onset / 1000;
Duration = Duration / 1000;

nSubj = numel(unique(Subject));

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
        
        names = {};
        onsets = {};
        durations = {};
        pmod = struct('name', {}, 'param', {}, 'poly', {});
        
        n = 1;
        names{n} = 'evaluation;1';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_1') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;

        pmod(n).name{1} = 'Up';
        pmod(n).param{1} = Up(i);
        pmod(n).poly{1} = 1;
        pmod(n).name{2} = 'Down';
        pmod(n).param{2} = Down(i);
        pmod(n).poly{2} = 1;
        
        n = n + 1;
        names{n} = 'evaluation;2';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_2') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;

        pmod(n).name{1} = 'Up';
        pmod(n).param{1} = Up(i);
        pmod(n).poly{1} = 1;
        pmod(n).name{2} = 'Down';
        pmod(n).param{2} = Down(i);
        pmod(n).poly{2} = 1;

        n = n + 1;
        names{n} = 'evaluation;3';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_3') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;

        pmod(n).name{1} = 'Up';
        pmod(n).param{1} = Up(i);
        pmod(n).poly{1} = 1;
        pmod(n).name{2} = 'Down';
        pmod(n).param{2} = Down(i);
        pmod(n).poly{2} = 1;

        n = n + 1;
        names{n} = 'evaluation;123';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_123') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i);
        durations{n} = 0.5;

        pmod(n).name{1} = 'Up';
        pmod(n).param{1} = Up(i);
        pmod(n).poly{1} = 1;
        pmod(n).name{2} = 'Down';
        pmod(n).param{2} = Down(i);
        pmod(n).poly{2} = 1;

        n = n + 1;
        names{n} = 'Residual;1;1';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_1') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + 0.5;
        durations{n} = Duration(i) - 0.5;

        n = n + 1;
        names{n} = 'Residual;1;2';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_2') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + 0.5;
        durations{n} = Duration(i) - 0.5;

        n = n + 1;
        names{n} = 'Residual;1;3';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_3') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + 0.5;
        durations{n} = Duration(i) - 0.5;

        n = n + 1;
        names{n} = 'Residual;2;1';
        i = (Subject == Subj) & strcmp(Event, 'evaluation_123') & ...
            ismember(Period, Runs{iRuns});
        onsets{n} = Onset(i) + 0.5;
        durations{n} = Duration(i) - 0.5;

        outdir = fullfile(statdir, sprintf('Subject%02d', Subj), 'LOG');
                         
        % Create output directory if it doesn't exist
        if ~exist(outdir, 'dir')
            mkdir(outdir);
        end
        
        fname = fullfile(outdir, sprintf('logRun%d', iRuns));
        save(fname, 'names', 'onsets', 'durations', 'pmod');
    end
end
