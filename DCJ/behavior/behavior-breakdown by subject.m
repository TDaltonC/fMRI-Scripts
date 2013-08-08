[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);
results = {}
% for Subj = unique(Subject)'
% 
% W1 = (Subject == Subj) & (Winout1 == 1) & strcmp(Event, 'outcome_3'); 
% W2 = (Subject == Subj) & (Winout2 == 1) & strcmp(Event, 'outcome_3');
% W3 = (Subject == Subj) & (Winout3 == 1) & strcmp(Event, 'outcome_3');
% 
% L1 = (Subject == Subj) & (Winout1 == 0) & strcmp(Event, 'outcome_3'); 
% L2 = (Subject == Subj) & (Winout2 == 0) & strcmp(Event, 'outcome_3');
% L3 = (Subject == Subj) & (Winout3 == 0) & strcmp(Event, 'outcome_3');
% 
% Change1 = Bet2(W1|L1) - Bet1(W1|L1);
% Change2 = Bet3(W1|L1) - Bet2(W1|L1);
% Change1w = Bet2(W1) - Bet1(W1);
% Change1l = Bet2(L1) - Bet1(L1);
% Change2xw = Bet3(W2) - Bet2(W2);
% Change2ww = Bet3(W1&W2) - Bet2(W1&W2);
% Change2lw = Bet3(L1&W2) - Bet2(L1&W2);
% Change2xl = Bet3(L2) - Bet2(L2);
% Change2wl = Bet3(W1&L2) - Bet2(W1&L2);
% Change2ll = Bet3(L1&L2) - Bet2(L1&L2);
% 
% 
% n=1 
% % results{1,n} = 'Condition';
% % results{((Subj-1)*2+2),n} = sprintf('S%d-Mean',Subj)
% % [h,results{((Subj-1)*2+3),n}] = 't-test "0->null"'
% % results{44,n} = 'n='
% % n=n+1
% % results{1,n} = 'Change1'
% % results{((Subj-1)*2+2),n} = mean(Change1)
% % [h,results{((Subj-1)*2+3),n}] = ttest(Change1)
% % results{44,n} = length(Change1)
% % n=n+1
% % results{1,n} = 'Change2'
% % results{((Subj-1)*2+2),n} = mean(Change2)
% % [h,results{((Subj-1)*2+3),n}] = ttest(Change2)
% % results{44,n} = length(Change2)
% % n=n+1
% % results{1,n} = 'Change1w'
% % results{((Subj-1)*2+2),n} = mean(Change1w)
% % [h,results{((Subj-1)*2+3),n}] = ttest(Change1w)
% % results{44,n} = length(Change1w)
% n=n+1
% results{1,n} = 'Change1l'
% results{((Subj-1)*2+2),n} = mean(Change1l)
% [h,results{((Subj-1)*2+3),n}] = ttest(Change1l)
% results{44,n} = length(Change1l)
% n=n+1
% results{1,n} = 'Change2xw'
% results{((Subj-1)*2+2),n} = mean(Change2xw)
% [h,results{((Subj-1)*2+3),n}] = ttest(Change2xw)
% results{44,n} = length(Change2xw)
% n=n+1
% results{1,n} = 'Change2ww'
% results{((Subj-1)*2+2),n} = mean(Change2ww) 
% [h,results{((Subj-1)*2+3),n}] = ttest(Change2ww)
% results{44,n} = length(Change2ww)
% n=n+1
% results{1,n} = 'Change2lw'
% results{((Subj-1)*2+2),n} = mean(Change2lw)
% [h,results{((Subj-1)*2+3),n}] = ttest(Change2lw)
% results{44,n} = length(Change2lw)
% n=n+1
% results{1,n} = 'Change2xl'
% results{((Subj-1)*2+2),n} = mean(Change2xl)
% [h,results{((Subj-1)*2+3),n}] = ttest(Change2xl)
% results{44,n} = length(Change2xl)
% n=n+1
% results{1,n} = 'Change2wl'
% results{((Subj-1)*2+2),n} = mean(Change2wl)
% [h,results{((Subj-1)*2+3),n}] = ttest(Change2wl)
% results{44,n} = length(Change2wl)
% n=n+1
% results{1,n} = 'Change2ll'
% results{((Subj-1)*2+2),n} = mean(Change2ll)
% [h,results{((Subj-1)*2+3),n}] = ttest(Change2ll)
% results{44,n} = length(Change2ll)
% end