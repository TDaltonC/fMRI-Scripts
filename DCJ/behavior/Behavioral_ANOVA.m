% Behavioral ANOVA
% This script is designed to test the effect of (1) expected value of a
% lottery, (2) the outcome of the pervious bet on, and (3) subject on (4)  
% how the bet changes from lot1 to lot2 and from lot2 to lot3.

[Subject Period Stage Condition Event Onset Duration ...
    Up	Down Bet1 Bet2 Bet3 Winout1 Winout2 Winout3] = ...
    textread('C:\fMRI data\DCJ\SPM\data\log\dcj_dynamic_for_matlab_abs.txt', ...
    '%d %d %d %d %s %d %d %d %d %d %d %d %d %d %d', ...
    'headerlines', 1);
% All of the variables are filtered so that only one of each observation is
% counted.  this is done by only using (event = outcome3).  The vector is
% then copied on to the end of itself.  The first copy is for the change 
% from bet1->bet2 the second copy is for the change from bet2->bet3.
Filter = strcmp(Event, 'outcome_3');

Subject = Subject(Filter);% Subject is a catigorical independent (random-effect) variable
Subj = cat(1, Subject, Subject);

Winout1 = Winout1(Filter);
Winout2 = Winout2(Filter);
Winout3 = Winout3(Filter);
Win = cat(1, Winout1, Winout2);

% Previous win/loss will be treated like a carigorical dependent (fixxed-effect)
% Variable becuase it's a within subject compairison.

% Bet change is the thing that we're trying to explain
Bet1 = Bet1(Filter);
Bet2 = Bet2(Filter);
Bet3 = Bet3(Filter);
Change1 = Bet2-Bet1;
Change2 = Bet3-Bet2;
Change = cat(1, Change1, Change2);
% There should be pairwise covariance between betchange1 and betchange2
% because they're basicaly a repeat measure.  I'm going to ignore this for
% now.


Up = Up(Filter);
Down = Down(Filter);       %EV will be treated as a continuous dependent 
ExpectedValue = Up - Down; %(fixed-effect) variable becuase it's like a 
EV = cat(1, ExpectedValue, ExpectedValue); %repreat measure. This is also 
                                           %called a covarient.               

p = anovan(Change, {Subj Win EV}, 'continuous', 3,'random', 1, 'varnames',...
           {'Subj' 'Win' 'EV'}, 'model', [1 0 0;0 1 0;0 0 1;0 1 1]);