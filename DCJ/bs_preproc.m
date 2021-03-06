% clear all

basedir = 'C:\fMRI data\DCJ\SPM\data';

Subj = [1];

% Load preproc template
%--------------------------------------------------------------------------
load('template_preproc');

% Make jobs
%--------------------------------------------------------------------------
for cSubj = Subj
    d3D   = fullfile(basedir, sprintf('Subject%02d', cSubj), 'Anatomical');
    dRun1 = fullfile(basedir, sprintf('Subject%02d', cSubj), 'Functional', 'Run1');
    dRun2 = fullfile(basedir, sprintf('Subject%02d', cSubj), 'Functional', 'Run2');
    dRun3 = fullfile(basedir, sprintf('Subject%02d', cSubj), 'Functional', 'Run3');

    % Read .img files
    f3D   = spm_select('FPList', d3D, '^s.*\.img$');
    fRun1 = spm_select('FPList', dRun1, '^f.*\.img$');
    fRun2 = spm_select('FPList', dRun2, '^f.*\.img$');
    fRun3 = spm_select('FPList', dRun3, '^f.*\.img$');

    matlabbatch{1}.spm.temporal.st.scans{1} = cellstr(strcat(fRun1, ',1'));
    matlabbatch{1}.spm.temporal.st.scans{2} = cellstr(strcat(fRun2, ',1'));
    matlabbatch{1}.spm.temporal.st.scans{3} = cellstr(strcat(fRun3, ',1'));
    matlabbatch{3}.spm.spatial.coreg.estimate.source{1} = strcat(f3D, ',1');
    
    % Save batch
    %--------------------------------------------------------------------------
    fbs = fullfile(basedir, sprintf('Subject%02d', cSubj), 'batch_preproc');
    save(fbs', 'matlabbatch');

    % Launch batch
    %--------------------------------------------------------------------------
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end

