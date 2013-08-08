clear all

basedir = 'C:\fMRI data\DCJ\SPM\data';

Subj = [1];
nRun  = 4;

for cSubj = Subj
    for cRun = 1:nRun
        dVolumes = fullfile(basedir, sprintf('Subject%02d', cSubj), ...
                           'Functional', sprintf('Run%d', cRun));
        
        if ~exist(dVolumes, 'dir')
            continue
        end
        
        dDummies = fullfile(dVolumes, 'dummies');
        mkdir(dDummies);
        
        fhdr = dir(fullfile(dVolumes, '*.hdr'));
        fimg = dir(fullfile(dVolumes, '*.img'));
        
        for n = 1:5
            movefile(fullfile(dVolumes, fhdr(n).name), dDummies);
            movefile(fullfile(dVolumes, fimg(n).name), dDummies);
        end
    end
end

