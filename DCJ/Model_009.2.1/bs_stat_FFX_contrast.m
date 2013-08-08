% clear all

statdir = 'C:\fMRI data\DCJ\SPM\stat\Model_0009\FFX';

Subj = 1:21;

% Load template
%--------------------------------------------------------------------------
load('template_stat_FFX_contrast9');

% Make jobs
%--------------------------------------------------------------------------
for cSubj = Subj
    fSPM  = fullfile(statdir, sprintf('Subject%02d', cSubj), 'SPM', 'SPM.mat');

    matlabbatch{1}.spm.stats.con.spmmat{1} = fSPM;
    
    % Save batch
    %--------------------------------------------------------------------------
    fbs = fullfile(statdir, sprintf('Subject%02d', cSubj), 'batch_FFX_contrast');
    save(fbs', 'matlabbatch');

    % Launch batch
    %--------------------------------------------------------------------------
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end

