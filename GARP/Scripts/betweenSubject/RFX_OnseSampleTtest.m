clear all

statdir  = '/Users/Dalton/Documents/MATLAB/GARP/fMRI/GARP/stat/Model_0004';
contrast = 'con_0001';

% Load template
%--------------------------------------------------------------------------
load('RFX_OnseSampleTtest.mat');

% Make jobs
%--------------------------------------------------------------------------
dSPM  = fullfile(statdir, 'RFX', contrast);
dFX   = fullfile(statdir, 'FFX');

% Create SPM directory if it doesn't exist
if ~exist(dSPM, 'dir')
    mkdir(dSPM);
end

% Read Con files
fCon = spm_select('FPListRec', dFX, sprintf('^%s.*\\.img$', contrast));

matlabbatch{1}.spm.stats.factorial_design.dir{1} = dSPM;
matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = cellstr(strcat(fCon, ',1'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = contrast;

% Save batch
%--------------------------------------------------------------------------
fbs = fullfile(dSPM, 'batch_RFX');
save(fbs', 'matlabbatch');

% Launch batch
%--------------------------------------------------------------------------
spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);

