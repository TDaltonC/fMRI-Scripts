
if ~exist('dRP', 'var')
    dRP = 'C:\fMRI data\DCJ\SPM\data';
end

fRP = spm_select(1, 'mat', 'Select realigment parameters file', [], ...
                 dRP, '^rp_.*\.txt$');

dRP = fileparts(fRP);
             
[x y z pitch roll yaw] = textread(fRP, '%f %f %f %f %f %f');

figure
subplot(2,1,1)
p = plot([x y z]);
xlabel('volumes');
ylabel('mm');
axis tight
legend(p, {'x' 'y' 'z'},'Location','BestOutside');

subplot(2,1,2)
p = plot([pitch roll yaw]);
xlabel('volumes');
zlabel('degrees');
axis tight
legend(p, {'pitch' 'roll' 'yaw'},'Location','BestOutside');
