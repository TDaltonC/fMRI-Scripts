clear all

subjects = [1:2];
baseDir = '/Users/Dalton/Documents/MATLAB/GARP/fMRI/GARP';
statDir = fullfile(baseDir, 'stat/Model_0004_5_1/FFX');
Runs = {1:144};

for subj = subjects;
    
    BehaviorDir = fullfile(baseDir, '/Data/', sprintf('Subject%02d', subj), '/Behavior');
    subjectBehavior = spm_select('FPList', BehaviorDir, '^*\.mat$');
    load(subjectBehavior);

trial = settings.trialOrder;
SelectionTime = behavioral.secs - behavioral.secs(1) + 4.11532;

% Model:
% BOLD = TwoItemGARP + ThreeItemGARP + Residuals

    for iRuns = 1:numel(Runs)
        
        names = {};
        onsets = {};
        durations = {};
        pmod = struct('name', {}, 'param', {}, 'poly', {});
        
        n = 1;
        names{n} = 'Two_Item_GARP';
        i = (settings.trialOrder == 1) | (settings.trialOrder == 2) | (settings.trialOrder == 3);
        onsets{n} = SelectionTime(i);
        durations{n} = 1;

        pmod(n).name{1} = 'Up';
        pmod(n).param{1} = Up(i);
        pmod(n).poly{1} = 1;
        pmod(n).name{2} = 'Down';
        pmod(n).param{2} = Down(i);
        pmod(n).poly{2} = 1;
        

        n = n + 1;
        names{n} = 'Three_Item_GARP';
        i = (settings.trialOrder == 4) | (settings.trialOrder == 5) |(settings.trialOrder == 6);
        onsets{n} = SelectionTime(i);
        durations{n} = 1;

        pmod(n).name{1} = 'Up';
        pmod(n).param{1} = Up(i);
        pmod(n).poly{1} = 1;
        pmod(n).name{2} = 'Down';
        pmod(n).param{2} = Down(i);
        pmod(n).poly{2} = 1;
        
        outdir = fullfile(statDir, sprintf('Subject%02d', subj), 'LOG');
                         
        % Create output directory if it doesn't exist
        if ~exist(outdir, 'dir')
            mkdir(outdir);
        end
        
        fname = fullfile(outdir, sprintf('logRun%d', iRuns));
        save(fname, 'names', 'onsets', 'durations', 'pmod');
    end
    clear behavioral settings;
end
