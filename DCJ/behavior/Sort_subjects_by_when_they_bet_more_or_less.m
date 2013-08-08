clear
%Just importing all fo the behavioral data from txt TSV
[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);
for Subj = unique(Subject)'
    
%Filtering the winout data so that it only contains the data from the low
%feed back condition and the only one line for each of them (I arbitrarity
%chose outcome_3 but many things could have worked here.

W1 = ((Subject == Subj) & (Winout1 == 1) & strcmp(Event, 'outcome_3')); 
W2 = ((Subject == Subj) & (Winout2 == 1) & strcmp(Event, 'outcome_3'));
W3 = (Subject == Subj) & (Winout3 == 1) & strcmp(Event, 'outcome_3');

%This creates the loss condition.

L1 = ((Subject == Subj) & (Winout1 == 0) & strcmp(Event, 'outcome_3')); 
L2 = ((Subject == Subj) & (Winout2 == 0) & strcmp(Event, 'outcome_3'));
L3 = ((Subject == Subj) & (Winout3 == 0) & strcmp(Event, 'outcome_3'));

% First we calculate the number of times that someone increase or decrease
% thier bet after they either win or lose the first bet.
Win_in1 = ((W1) & ((Bet2 - Bet1) > 0));
Win_de1 = ((W1) & ((Bet2 - Bet1) < 0));
Lose_in1 = ((L1) & ((Bet2 - Bet1) > 0));
Lose_de1 = ((L1) & ((Bet2 - Bet1) < 0));

% Then we do the same thing for after the second bet.
Win_in2 = ((W2) & ((Bet3 - Bet2) > 0));
Win_de2 = ((W2) & ((Bet3 - Bet2) < 0));
Lose_in2 = ((L2) & ((Bet3 - Bet2) > 0));
Lose_de2 = ((L2) & ((Bet3 - Bet2) < 0));

% Then we add them together to see if indevidual subjects are more likely
% to increase or decrease a bet after a win or a lose.  The magnitude of
% the bet and the magnitude of the change in the bet are ignored. 
Wi1 = sum(str2num(num2str(Win_in1)));
Wi2 = sum(str2num(num2str(Win_in2)));
Wd1 = sum(str2num(num2str(Win_de1)));
Wd2 = sum(str2num(num2str(Win_de2)));
Li1 = sum(str2num(num2str(Lose_in1)));
Li2 = sum(str2num(num2str(Lose_in2)));
Ld1 = sum(str2num(num2str(Lose_de1)));
Ld2 = sum(str2num(num2str(Lose_de2)));

Results(Subj,1) = (Wi1+Wi2)-(Wd1+Wd2);
Results(Subj,2) = (Li1+Li2)-(Ld1+Ld2);

clear W1 W2 W3 L1 L2 L3 Win_in Win_de Lose_in Win_de Wi Wd Li Ld

end
% This creates the pairwise compairisons.
% Change1 = Bet2(W1|L1) - Bet1(W1|L1); %<---For example this one creates a pairwise compairison
% Change2 = Bet3(W2|L2) - Bet2(W2|L2);     %by subtracting all of the first bets from all of the 
% Change1w = Bet2(W1) - Bet1(W1);          %second bets (Win or Lose).
% Change1l = Bet2(L1) - Bet1(L1);
% Change2xw = Bet3(W2) - Bet2(W2);
% Change2ww = Bet3(W1&W2) - Bet2(W1&W2);
% Change2lw = Bet3(L1&W2) - Bet2(L1&W2);
% Change2xl = Bet3(L2) - Bet2(L2);
% Change2wl = Bet3(W1&L2) - Bet2(W1&L2);
% Change2ll = Bet3(L1&L2) - Bet2(L1&L2);
% 
% %This builds the cell array v so that during the for loop I can call each
% %of the different elements in turn.
% 
% v(1,:) = {'Change1' 'Change2' 'Change1w' 'Change1l' ...
%           'Change2xw' 'Change2ww' 'Change2lw' ...
%           'Change2xl' 'Change2wl' 'Change2ll'}
% v(2,:) = {[Change1] [Change2] [Change1w] [Change1l] ...
%           [Change2xw] [Change2ww] [Change2lw] ...
%           [Change2xl] [Change2wl] [Change2ll]}
% 
% %This tests each of the vectors in v one at a time. If there is a decrease
% %in bet size on average, then it tests if its a significant decrese. If
% %it's an increase on average it tests if it's a significant increase.  All
% %results are recorded in the table "results."
%       
% results = {3,length(v)};
% for i = 1:length(v);
% results{1,i} = v{1,i};
% results{2,i} = mean(v{2,i});
% % if results{2,i}<0,
% % [results{3,i}] = ttest(v{2,i},0,0.05,'left');
% % else
% [~,results{3,i}] = ttest(v{2,i},0,0.05);
% % end
% end