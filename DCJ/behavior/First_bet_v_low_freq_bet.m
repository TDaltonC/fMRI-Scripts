
% From pervious stat tests we know taht there is no significant difference
% between the first bet in the high frequency feed back condition and the bet
% in the low frequency condition.
% This scrip was designed to give an informal look at the data to see if this
% is true accross all combinations of 'up' and 'down' or if there is some pattern
% from 'good' loteries to 'bad' loteries or from low risk to high risk lotteries.
% *****There doesn't apear to be any pattern.*****

[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);

%This is to get both the Up and Down vectors in to a form that we can work
%with for using them to specify a cell in an array
Up = (Up/20) - 2;
Down = (Down/10) - 4;

for i = 1:6 %Up
    for j = 1:6 %Down

        r1 = (Up == i) & (Down == j) & strcmp(Event, 'evaluation_123');  %bet in low feedback condition
        r2 = (Up == i) & (Down == j) & strcmp(Event, 'evaluation_1'); %first bet in high feedback condition
        resultssd{i,j} = std(Bet1(r1) - Bet1(r2));  %Rows (top to bottom) are 'Up', columns (left to right) are 'Down'
        
    end
end

% %For doing subjects 1 at a time
% for i = 1:6 %Up
%     for j = 1:6 %Down
% 
%         r1 = (Subject == 2) & (Up == i) & (Down == j) & strcmp(Event, 'evaluation_123');  %bet in low feedback condition
%         r2 = (Subject == 2) & (Up == i) & (Down == j) & strcmp(Event, 'evaluation_1'); %first bet in high feedback condition
%         results{i,j} = Bet1(r1) - Bet1(r2);  %Rows (top to bottom) are 'Up', columns (left to right) are 'Down'
%         
%     end
% end