
%Go and read and understand the code in "Behavior" this does the exact same
%thing except it does it independently for each subject.

[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\Users\Dalton\Documents\My Dropbox\USC\NeuroEcon\Disposition data\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);
results = {};
for Subj = unique(Subject)'
    
    W1 = (Subject == Subj) & (Winout1 == 1) & ...
        strcmp(Event, 'outcome_3') & (Up - 2*(Down) < 0);
    W2 = (Subject == Subj) & (Winout2 == 1) & ...
        strcmp(Event, 'outcome_3') & (Up - 2*(Down) < 0);
    W3 = (Subject == Subj) & (Winout3 == 1) & ...
        strcmp(Event, 'outcome_3') & (Up - 2*(Down) < 0);
    
    L1 = (Subject == Subj) & (Winout1 == 0) & ...
        strcmp(Event, 'outcome_3') & (Up - 2*(Down) < 0);
    L2 = (Subject == Subj) & (Winout2 == 0) & ...
        strcmp(Event, 'outcome_3') & (Up - 2*(Down) < 0);
    L3 = (Subject == Subj) & (Winout3 == 0) & ...
        strcmp(Event, 'outcome_3') & (Up - 2*(Down) < 0);
    
    Change1 = Bet2(W1|L1) - Bet1(W1|L1);
    Change2 = Bet3(W1|L1) - Bet2(W1|L1);
    Change1w = Bet2(W1) - Bet1(W1);
    Change1l = Bet2(L1) - Bet1(L1);
    Change2xw = Bet3(W2) - Bet2(W2);
    Change2ww = Bet3(W1&W2) - Bet2(W1&W2);
    Change2lw = Bet3(L1&W2) - Bet2(L1&W2);
    Change2xl = Bet3(L2) - Bet2(L2);
    Change2wl = Bet3(W1&L2) - Bet2(W1&L2);
    Change2ll = Bet3(L1&L2) - Bet2(L1&L2);
    
    
    %This builds the cell array v so that during the for loop I can call each
    %of the different elements in turn.
    
    v(1,:) = {'Change1' 'Change2' 'Change1w' 'Change1l' ...
        'Change2xw' 'Change2ww' 'Change2lw' ...
        'Change2xl' 'Change2wl' 'Change2ll'};
    v(2,:) = {[Change1] [Change2] [Change1w] [Change1l] ...
        [Change2xw] [Change2ww] [Change2lw] ...
        [Change2xl] [Change2wl] [Change2ll]};
    
    
    %This tests each of the vectors in v one at a time. If there is a decrease
    %in bet size on average, then it tests if its a significant decrese. If
    %it's an increase on average it tests if it's a significant increase.  All
    %results are recorded in the table "results."
    
    
    results{1,1} = 'Condition';
    results{((Subj-1)*2+2),1} = sprintf('S%d-Mean',Subj);
    results{((Subj-1)*2+3),1} = 't-test "0->null"';
    results{44,1} = 'n=';
    
    for i = 2:(length(v)+1);
        results{1,i} = v{1,i-1};
        results{((Subj-1)*2+2),i} = mean(v{2,i-1});
%         if results{((Subj-1)*2+2),i}<0,
%             [~,results{((Subj-1)*2+3),i}] = ttest(v{2,i-1},0,0.05,'left');
%         else
            [~,results{((Subj-1)*2+3),i}] = ttest(v{2,i-1},0,0.05);
%         end
        results{44,i} = length(v{2,i-1});
    end



end