% clear all

statdir  = 'C:\fMRI data\DCJ\SPM\stat\Model_0008.1';


for Contrasts = 1:6;
contrast = sprintf('con_%04d', Contrasts);
% Load template
%--------------------------------------------------------------------------
load('template_stat_RFX_OnseSampleTtest8');

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
end
