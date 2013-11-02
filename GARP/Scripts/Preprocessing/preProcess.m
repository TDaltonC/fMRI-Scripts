% clear all

basedir = '/Users/Dalton/Documents/MATLAB/GARP/fMRI/GARP/Data';

Subj = [1];

% Load preproc template
%--------------------------------------------------------------------------
load('preProc.mat');

% Make jobs
%--------------------------------------------------------------------------
for cSubj = Subj
    d3D   = fullfile(basedir, sprintf('Subject%02d', cSubj), 'Anatomical');
    dRun1 = fullfile(basedir, sprintf('Subject%02d', cSubj), 'Run1');

    % Read .img files
    f3D   = spm_select('FPList', d3D, '^s.*\.img$');
    fRun1 = spm_select('FPList', dRun1, '^f.*\.img$');

    matlabbatch{1}.spm.temporal.st.scans{1} = cellstr(strcat(fRun1, ',1'));
%     matlabbatch{3}.spm.spatial.realign.estwrite.data{1} = cellstr(strcat(fRun1, ',1'));
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

