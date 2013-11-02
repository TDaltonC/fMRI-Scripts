clear all

datadir = '/Users/Dalton/Documents/MATLAB/GARP/fMRI/GARP/Data';
statdir = '/Users/Dalton/Documents/MATLAB/GARP/fMRI/GARP/stat/Model_0004_5_1/FFX';

Subj = [1:2];

% Load template
%--------------------------------------------------------------------------
load('FFXmodel.mat');

% Make jobs
%--------------------------------------------------------------------------
for cSubj = Subj
    dSPM  = fullfile(statdir, sprintf('Subject%02d', cSubj), 'SPM');
    dLog  = fullfile(statdir, sprintf('Subject%02d', cSubj), 'LOG');
    dRun1 = fullfile(datadir, sprintf('Subject%02d', cSubj), 'Run1');

    % Create SPM directory if it doesn't exist
    if ~exist(dSPM, 'dir')
        mkdir(dSPM);
    end

    % Read .img files
    fRun1 = spm_select('FPList', dRun1, '^swaf.*\.img$');

    % Read realigment parameters files
    fRP1 = spm_select('FPList', dRun1, '^rp_.*\.txt$');
    
    matlabbatch{1}.spm.stats.fmri_spec.dir{1} = dSPM;
    
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = cellstr(strcat(fRun1, ',1'));
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi{1} = fullfile(dLog, 'logRun1.mat');
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg{1} = fRP1;

    % Save batch
    %--------------------------------------------------------------------------
    fbs = fullfile(statdir, sprintf('Subject%02d', cSubj), 'batch_FFX');
    save(fbs', 'matlabbatch');

    % Launch batch
    %--------------------------------------------------------------------------
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end

