% clear all

datadir = 'C:\fMRI data\DCJ\SPM\data';
statdir = 'C:\fMRI data\DCJ\SPM\stat\Model_0005\FFX';

Subj = [1:21];

% Load template
%--------------------------------------------------------------------------
load('template_stat_FFX5');

% Make jobs
%--------------------------------------------------------------------------
for cSubj = Subj
    dSPM  = fullfile(statdir, sprintf('Subject%02d', cSubj), 'SPM');
    dLog  = fullfile(statdir, sprintf('Subject%02d', cSubj), 'LOG');
    dRun1 = fullfile(datadir, sprintf('Subject%02d', cSubj), 'Functional', 'Run1');
    dRun2 = fullfile(datadir, sprintf('Subject%02d', cSubj), 'Functional', 'Run2');
    dRun3 = fullfile(datadir, sprintf('Subject%02d', cSubj), 'Functional', 'Run3');

    % Create SPM directory if it doesn't exist
    if ~exist(dSPM, 'dir')
        mkdir(dSPM);
    end

    % Read .img files
    fRun1 = spm_select('FPList', dRun1, '^swaf.*\.img$');
    fRun2 = spm_select('FPList', dRun2, '^swaf.*\.img$');
    fRun3 = spm_select('FPList', dRun3, '^swaf.*\.img$');

    % Read realigment parameters files
    fRP1 = spm_select('FPList', dRun1, '^rp_.*\.txt$');
    fRP2 = spm_select('FPList', dRun2, '^rp_.*\.txt$');
    fRP3 = spm_select('FPList', dRun3, '^rp_.*\.txt$');
    
    matlabbatch{1}.spm.stats.fmri_spec.dir{1} = dSPM;
    
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = cellstr(strcat(fRun1, ',1'));
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi{1} = fullfile(dLog, 'logRun1.mat');
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg{1} = fRP1;
    
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = cellstr(strcat(fRun2, ',1'));
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi{1} = fullfile(dLog, 'logRun2.mat');
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg{1} = fRP2;

    matlabbatch{1}.spm.stats.fmri_spec.sess(3).scans = cellstr(strcat(fRun3, ',1'));
    matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi{1} = fullfile(dLog, 'logRun3.mat');
    matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi_reg{1} = fRP3;

    % Save batch
    %--------------------------------------------------------------------------
    fbs = fullfile(statdir, sprintf('Subject%02d', cSubj), 'batch_FFX');
    save(fbs', 'matlabbatch');

    % Launch batch
    %--------------------------------------------------------------------------
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end

