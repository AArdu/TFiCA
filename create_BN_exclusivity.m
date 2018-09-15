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
NoseSize = 38; % 2
HairTexture = 39; % 3
EyebrowThickness = 40; % 2
%EarRings = 37; % 2
RedCheek = 41; % 2
SadLooking = 42;% 2


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

% NumTotalNodes = BrownEyesFacialHair; % TODO change this when engine works
dag = zeros(NumTotalNodes, NumTotalNodes);

dag(Character_node, BlackHairSadLooking:BrownEyesFacialHair) =1;
% dag(Character_node, HairColor:SadLooking) = 1;
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

% connecting the co-occurences to the features
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
ns_features = prefeatsz * [4, 2, 2,  2,  2, 2,  2,  2,  2, 3, 2, 2, 2];
node_sizes = [14, 2 * ones(1,18), 2 * ones(1,10),  ns_features];

% Observed nodes
%onodes = [Alex:Robert]; %Since all the characters are observed right>? this changes at a later stage
onodes = Character_node;
bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes, ...
    'observed', onodes);

bnet.CPD{Character_node} = tabular_CPD(bnet, Character_node, [1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14, 1/14 ]);
%%%%%% Setting the probabilities for the past features %%%%%%%%%%%%%%
%%%%%% SHould be changed to some other values
bnet.CPD{PastBlackHair} = tabular_CPD(bnet, PastBlackHair, [0.7142857143, 0.2857142857]);
bnet.CPD{PastBrownHair} = tabular_CPD(bnet, PastBrownHair, [0.7857142857, 0.2142857143 ]);
bnet.CPD{PastBlondeHair} = tabular_CPD(bnet, PastBlondeHair, [0.7142857143, 0.2857142857 ]);
bnet.CPD{PastRedHair} = tabular_CPD(bnet, PastRedHair, [0.7857142857, 0.2142857143 ]);
bnet.CPD{PastShortHair} = tabular_CPD(bnet, PastShortHair, [0.1428571429, 0.8571428571 ]);
bnet.CPD{PastMale} = tabular_CPD(bnet, PastMale, [0.2857142857, 0.7142857143]);
bnet.CPD{PastBrownEyes} = tabular_CPD(bnet, PastBrownEyes, [0.3571428571, 0.6428571429 ]);
bnet.CPD{PastFacialHair} = tabular_CPD(bnet, PastFacialHair, [0.6428571429, 0.3571428571 ]);
bnet.CPD{PastHat} = tabular_CPD(bnet, PastHat, [0.7142857143, 0.2857142857 ]);
bnet.CPD{PastGlasses} = tabular_CPD(bnet, PastGlasses, [0.8571428571, 0.1428571429 ]);
bnet.CPD{PastBigNose} = tabular_CPD(bnet, PastBigNose, [0.7142857143, 0.2857142857 ]);
bnet.CPD{PastStraightHair} = tabular_CPD(bnet, PastStraightHair, [1/2, 1/2 ]);
bnet.CPD{PastWavyHair} = tabular_CPD(bnet, PastWavyHair, [0.8571428571, 0.1428571429 ]);
bnet.CPD{PastCurlyHair} = tabular_CPD(bnet, PastCurlyHair, [0.6428571429, 0.3571428571 ]);
bnet.CPD{PastThickEyebrow} = tabular_CPD(bnet, PastThickEyebrow, [0.8571428571, 0.1428571429]);
bnet.CPD{PastRedCheek} = tabular_CPD(bnet, PastRedCheek, [0.7857142857, 0.2142857143]);
bnet.CPD{PastBigMouth} = tabular_CPD(bnet, PastBigMouth, [0.5714285714, 0.4285714286]);
bnet.CPD{PastSadLooking} = tabular_CPD(bnet, PastSadLooking, [0.7857142857, 0.2142857143]);

%%%%Setting the probabilities for the combinations of past features
%Probabilities of this correspond to past occurances right? yes, combined with characters =>it is not combined with the characters here.
[BlackHairSadLookingCPT,BrownHairBigMouthCPT,BlondeHairRedCheekCPT,ThickEyebrowRedHairCPT,CurlyHairShortHairCPT,MaleWavyHairCPT,BrownEyesStraightHairCPT,FacialHairBigNoseCPT,HatGlassesTabCPT,BrownEyesFacialHairCPT] = calculateCPTCOOC(0);
bnet.CPD{BlackHairSadLooking} = tabular_CPD(bnet, BlackHairSadLooking, BlackHairSadLookingCPT);
bnet.CPD{BrownHairBigMouth} = tabular_CPD(bnet, BrownHairBigMouth, BrownHairBigMouthCPT);
bnet.CPD{BlondeHairRedCheek} = tabular_CPD(bnet, BlondeHairRedCheek, BlondeHairRedCheekCPT);
bnet.CPD{ThickEyebrowRedHair} = tabular_CPD(bnet, ThickEyebrowRedHair, ThickEyebrowRedHairCPT);
bnet.CPD{CurlyHairShortHair} = tabular_CPD(bnet, CurlyHairShortHair, CurlyHairShortHairCPT);
bnet.CPD{MaleWavyHair} = tabular_CPD(bnet, MaleWavyHair, MaleWavyHairCPT);
bnet.CPD{BrownEyesStraightHair} = tabular_CPD(bnet, BrownEyesStraightHair, BrownEyesStraightHairCPT);
bnet.CPD{FacialHairBigNose} = tabular_CPD(bnet, FacialHairBigNose, FacialHairBigNoseCPT);
bnet.CPD{HatGlasses} = tabular_CPD(bnet, HatGlasses, HatGlassesTabCPT);
bnet.CPD{BrownEyesFacialHair} = tabular_CPD(bnet, BrownEyesFacialHair, BrownEyesFacialHairCPT);

[HairCPT,  HairStyleCPT, SexCPT, EyesColorCPT, FacialHairCPT, HatCPT, ...
 GlassesCPT, NoseSizeCPT, HairTextureCPT, EyebrowThicknessCPT, RedCheekCPT, ...
MouthSizeCPT, SadLookingCPT] = calculateCPTFEAT();

bnet.CPD{HairColor} = tabular_CPD(bnet, HairColor, HairCPT); %Black-Brown-Blonde-Red
bnet.CPD{HairStyle} = tabular_CPD(bnet, HairStyle, HairStyleCPT); %LONG - SHORT
bnet.CPD{Sex} = tabular_CPD(bnet, Sex, SexCPT); %Female-Male
bnet.CPD{EyeColor} = tabular_CPD(bnet, EyeColor, BrownEyesCPT); %Blue-Brown
bnet.CPD{FacialHair} = tabular_CPD(bnet, FacialHair, FacialHairCPT); %NO-Yes
bnet.CPD{MouthSize} = tabular_CPD(bnet, MouthSize, MouthSizeCPT); %Small-Big
bnet.CPD{Hat} = tabular_CPD(bnet, Hat, HatCPT); % No-Yes
bnet.CPD{Glasses} = tabular_CPD(bnet, Glasses, GlassesCPT); % No-Yes
bnet.CPD{NoseSize} = tabular_CPD(bnet, NoseSize, NoseSizeCPT); % Small-Big
bnet.CPD{HairTexture} = tabular_CPD(bnet, HairTexture, HairTextureCPT); % Straight-Wavy-Curly
bnet.CPD{EyebrowThickness} = tabular_CPD(bnet, EyebrowThickness, EyebrowThicknessCPT);%Small-Thick
bnet.CPD{RedCheek} = tabular_CPD(bnet, RedCheek, RedCheekCPT);%No-Yes
bnet.CPD{SadLooking} = tabular_CPD(bnet, SadLooking, SadLookingCPT);%No-Yes

node_names = allNames;

end
