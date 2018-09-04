function [bnet, node_names] = create_BN_exclusivity()
% character node
Character_node = 1;

% Past feature nodes
PastBlackHair = 2;
PastBrownHair = 3;
PastBlondeHair = 4;
PastRedHair = 5;
PastShortHair = 6;
PastMale = 7;
PastBrownEyes = 8;
PastFacialHair = 9;
PastHat = 10;
PastGlasses = 11;
PastBigNose = 12;
PastStraightHair = 13;
PastWavyHair = 14;
PastCurlyHair = 15;
PastThickEyebrow = 16;
PastRedCheek = 17;
PastBigMouth = 18;
PastSadLooking = 19;

% Feature co-ocurrences nodes % intersections
BlackHairSadLooking = 20; % 1
BrownHairBigMouth = 21; % 1
BlondeHairRedCheek = 22 ; % 1
ThickEyebrowRedHair = 23; % 1
CurlyHairShortHair = 24; % 5
MaleWavyHair = 25; % 2
BrownEyesStraightHair = 26; % 4
FacialHairBigNose = 27; % 1
HatGlasses = 28; % 1
BrownEyesFacialHair = 29; % 3


HairColor = 30; % 5 => 130 
HairStyle = 31; % 3 => 
Sex = 32; % 2
EyeColor =33; % 2
FacialHair = 34; % 5
MouthSize = 35; % 2
Hat = 36; % 2
Glasses = 37;% 2
NoseSize = 39; % 2
HairTexture = 40; % 3
EyebrowThickness = 41; % 2
%EarRings = 37; % 2
RedCheek = 42; % 2
SadLooking = 43;% 2 


% Names of all the nodes
allNames = {'Characters'; 'PastBlackHair' ; 'PastBrownHair' ; 'PastBlondeHair' ;...
'PastRedHair' ; 'PastShortHair' ; 'PastMale' ; 'PastBrownEyes' ; 'PastFacialHair' ;...
'PastHat' ; 'PastGlasses' ; 'PastBigNose' ; 'PastStraightHair' ; 'PastWavyHair' ;...
'PastCurlyHair' ; 'PastThickEyebrow' ; 'PastRedCheek' ; 'PastBigMouth' ;...
'PastSadLooking'; 'BlackHairSadLooking'; 'BrownHairBigMouth';...
'BlondeHairRedCheek'; 'ThickEyebrowRedHair'; 'CurlyHairShortHair';...
'MaleWavyHair'; 'BrownEyesStraightHair'; 'FacialHairBigNose'; 'HatGlasses'; 'BrownEyesFacialHair';...
'Hair' ;  'HairStyle' ;...
'Sex' ; 'BrownEyes' ; 'FacialHair' ; 'Hat' ; 'Glasses' ; 'NoseSize' ; ...
'HairTexture' ; 'EyebrowThickness' ; 'RedCheek' ;...
'MouthSize' ; 'SadLooking'};

% Make BN
NumTotalNodes = length(allNames);
dag = zeros(NumTotalNodes, NumTotalNodes);
dag(Character_node, PastBlackHair:PastSadLooking) =1;
dag(Character_node, BlackHair:SadLooking) = 1;
dag([PastBlackHair PastSadLooking], BlackHairSadLooking) = 1;
dag([PastBrownHair PastBigMouth], BrownHairBigMouth) = 1;
dag([PastBlondeHair PastRedCheek], BlondeHairRedCheek) = 1 ;
dag([PastThickEyebrow PastRedHair], ThickEyebrowRedHair) = 1;
dag([PastCurlyHair PastShortHair], CurlyHairShortHair) = 1 ;
dag([PastMale PastWavyHair], MaleWavyHair) = 1 ;
dag([PastBrownEyes PastStraightHair], BrownEyesStraightHair) = 1 ;
dag([PastFacialHair PastBigNose], FacialHairBigNose) = 1 ;
dag([PastHat PastGlasses], HatGlasses) = 1 ;
dag([PastBrownEyes PastFacialHair], BrownEyesFacialHair) = 1 ;

%connecting the co-occurences to the features
dag(BlackHairSadLooking, [HairColor,SadLooking]) = 1;
dag(BrownHairBigMouth, [HairColor, MouthSize])=1;
dag(BlondeHairRedCheek, [HairColor, RedCheek])=1;
dag(ThickEyebrowRedHair, [EyebrowThickness, HairColor])=1;
dag(CurlyHairShortHair, [HairTexture, HairStyle])=1;
dag(MaleWavyHair, [Sex, HairTexture])=1;
dag(BrownEyesStraightHair, [EyeColor, HairTexture])=1;
dag(FacialHairBigNose, [FacialHair, NoseSize])=1;
dag(HatGlasses, [Hat, Glasses])=1;
dag(BrownEyesFacialHair, [EyeColor, FacialHair])=1;

discrete_nodes = Character_node:NumTotalNodes;
prefeatsz = 14 * 8; %size of the characters; size of the co-occurances
ns_features = prefeatsz * [4, 2, 2,  2,  2, 2,  2,  2,  2, 3, 2, 2, 2]; %* 14 for the characternodes.
node_sizes = [14, 2 * ones(1,18), 8 * ones(1,10),  ns_features];

% Observed nodes
onodes = [Alex:Robert]; %Since all the characters are observed right>? this changes at a later stage

bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes, ...
    'observed', onodes);
node_names = allNames;
    
end