clear all, clc
addpath('./Functions')
load('./Data/initialGameboard.mat')

cd bnt-master
addpath(genpathKPM(pwd))
cd ../

allFeatures = initialGameboard(1,2:end);
allCharacters = initialGameboard(2:end,1);


ag = Agent;
[BN, node_names] = create_BN_exclusivity;
ag.bnet = BN;
ag.bnet.allNodes = string(node_names);
ag.allFeatures = allFeatures;
ag.allCharacters = allCharacters;
ag.agent_board = initialGameboard;
% decide character non randomly?
ag.agent_mystery = allCharacters(randi([1, length(allCharacters)]));
ag.ag_mys_features = initialGameboard(initialGameboard(:,1) == string(cell2mat(ag.agent_mystery)), 2:end);
ag.ag_feat_hypo = initialGameboard(1,2:end);
ag.ag_char_hypo = initialGameboard(2:end,1);

ag.BN_engine = jtree_inf_engine(ag.bnet);


evidence = cell(1, length(ag.bnet.node_sizes));

evidence(1) = {[]}; % Characters
evidence(2) = {[]}; % PastBlackHair
evidence(3) = {[]}; % PastBrownHair
evidence(4) = {[]}; % PastBlondeHair
evidence(5) = {[]}; % PastRedHair
evidence(6) = {[]}; % PastShortHair
evidence(7) = {[]}; % PastMale
evidence(8) = {[]}; % PastBrownEyes
evidence(9) = {[]}; % PastFacialHair
evidence(10) = {[]}; % PastHat
evidence(11) = {[]}; % PastGlasses
evidence(12) = {[]}; % PastBigNose
evidence(13) = {[]}; % PastStraightHair
evidence(14) = {[]}; % PastWavyHair
evidence(15) = {[]}; % PastCurlyHair
evidence(16) = {[]}; % PastThickEyebrow
evidence(17) = {[]}; % PastRedCheek
evidence(18) = {[]}; % PastBigMouth
evidence(19) = {[]}; % PastSadLooking
evidence(20) = {[]}; % BlackHairSadLooking
evidence(21) = {[]}; % BrownHairBigMouth
evidence(22) = {[]}; % BlondeHairRedCheek
evidence(23) = {[]}; % ThickEyebrowRedHair
evidence(24) = {[]}; % CurlyHairShortHair
evidence(25) = {[]}; % MaleWavyHair
evidence(26) = {[]}; % BrownEyesStraightHair
evidence(27) = {[]}; % FacialHairBigNose
evidence(28) = {[]}; % HatGlasses
evidence(29) = {[]}; % BrownEyesFacialHair

% Uncomment when features are ready
evidence(30) = {[]}; % Hair
evidence(31) = {[]}; % HairStyle
evidence(32) = {[]}; % Sex
evidence(33) = {[]}; % BrownEyes
evidence(34) = {[]}; % FacialHair
evidence(35) = {[]}; % Hat
evidence(36) = {[]}; % Glasses
evidence(37) = {[]}; % NoseSize
evidence(38) = {[]}; % HairTexture
evidence(39) = {[]}; % EyebrowThickness
evidence(40) = {[]}; % RedCheek
evidence(41) = {[]}; % MouthSize
evidence(42) = {[]}; % SadLooking

[engine, loglike] = enter_evidence(ag.BN_engine, evidence);
marg = marginal_nodes(engine, 1, 1);
marg.T
[max, ch] = max(marg.T);
text = sprintf('MAX: %f, %d',[max, ch])
[min, ch] = min(marg.T);
text = sprintf('MIN: %f, %d',[min, ch])
  
% text = sprintf('Alex %f \n Alfred %f \n Anita %f \n Anne %f \n Bernard %f \n Charles %f \n' ...
%                'Claire %f \n Eric %f \n Frans %f \n Joe %f \n Maria %f \n Max %f \n Philip %f \n Robert %f', marg.T)

