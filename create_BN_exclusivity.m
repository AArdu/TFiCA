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
dag = zeros(NumTotalNodes, NumTotalNodes);
dag(Character_node, BlackHairSadLooking:BrownEyesFacialHair) =1;
dag(Character_node, HairColor:SadLooking) = 1;
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
ns_features = prefeatsz * [4, 2, 2,  2,  2, 2,  2,  2,  2, 3, 2, 2, 2]; 
node_sizes = [14, 2 * ones(1,18), 8 * ones(1,10),  ns_features];

% Observed nodes
%onodes = [Alex:Robert]; %Since all the characters are observed right>? this changes at a later stage
onodes = Character_node;
bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes, ...
    'observed', onodes);
node_names = allNames;

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
BlackHairSadLookingTab = fliplr([0.5612244898	0.2244897959	0.1530612245	0.0612244898	0.4387755102	0.7755102041	0.8469387755	0.9387755102]);
chars_FB_FS_F = [1,1, BlackHairSadLookingTab(1), 1, BlackHairSadLookingTab(1), BlackHairSadLookingTab(1), BlackHairSadLookingTab(1), BlackHairSadLookingTab(1), BlackHairSadLookingTab(1), BlackHairSadLookingTab(1), BlackHairSadLookingTab(1), 1, 1, 1]*(1/14); %Perhaps also multiplied by 1/14
chars_TB_FS_F = [BlackHairSadLookingTab(2), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, BlackHairSadLookingTab(2), BlackHairSadLookingTab(2),1] * (1/14);
chars_FB_TS_F = [1, BlackHairSadLookingTab(3), 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, BlackHairSadLookingTab(3)]* (1/14);
chars_TB_TS_F = [1, 1, 1, BlackHairSadLookingTab(4), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] * (1/14);
chars_FB_FS_T = [0,0, BlackHairSadLookingTab(5), 0, BlackHairSadLookingTab(5), BlackHairSadLookingTab(5), BlackHairSadLookingTab(5), BlackHairSadLookingTab(5), BlackHairSadLookingTab(5), BlackHairSadLookingTab(5), BlackHairSadLookingTab(5), 0, 0, 0] *(1/14);%Perhaps also multiplied by 1/14
chars_TB_FS_T = [BlackHairSadLookingTab(6), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, BlackHairSadLookingTab(6), BlackHairSadLookingTab(6),0] * (1/14);
chars_FB_TS_T = [0, BlackHairSadLookingTab(7), 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, BlackHairSadLookingTab(7)] * (1/14);
chars_TB_TS_T = [0, 0, 0, BlackHairSadLookingTab(8), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] * (1/14);
bnet.CPD{BlackHairSadLooking} = tabular_CPD(bnet, BlackHairSadLooking, [chars_FB_FS_F	chars_TB_FS_F	chars_FB_TS_F	chars_TB_TS_F	chars_FB_FS_T	chars_TB_FS_T	chars_FB_TS_T	chars_TB_TS_T]);

bnet.CPD{BlackHairSadLooking} = tabular_CPD(bnet, BlackHairSadLooking, [0.5612244898	0.2244897959	0.1530612245	0.0612244898	0.4387755102	0.7755102041	0.8469387755	0.9387755102]);
bnet.CPD{BrownHairBigMouth} = tabular_CPD(bnet, BrownHairBigMouth, [0.4489795918	0.1224489796	0.3367346939	0.09183673469	0.5510204082	0.8775510204	0.6632653061	0.9081632653]);
bnet.CPD{BlondeHairRedCheek} = tabular_CPD(bnet, BlondeHairRedCheek, [0.5612244898	0.2244897959	0.1530612245	0.0612244898	0.4387755102	0.7755102041	0.8469387755	0.9387755102]);
bnet.CPD{ThickEyebrowRedHair} = tabular_CPD(bnet, ThickEyebrowRedHair, [0.4489795918	0.1224489796	0.3367346939	0.09183673469	0.5510204082	0.8775510204	0.6632653061	0.9081632653]);
bnet.CPD{CurlyHairShortHair} = tabular_CPD(bnet, CurlyHairShortHair, [0.09183673469	0.5510204082	0.05102040816	0.306122449	0.9081632653	0.4489795918	0.9489795918	0.693877551]);
bnet.CPD{MaleWavyHair} = tabular_CPD(bnet, MaleWavyHair, [0.2448979592	0.5510204082	0.05102040816	0.306122449	0.7551020408	0.4489795918	0.9489795918	0.693877551]);
bnet.CPD{BrownEyesStraightHair} = tabular_CPD(bnet, BrownEyesStraightHair, [0.1785714286	0.3214285714	0.1785714286	0.3214285714	0.8214285714	0.6785714286	0.8214285714	0.6785714286 ]);
bnet.CPD{FacialHairBigNose} = tabular_CPD(bnet, FacialHairBigNose, [0.4591836735	0.2551020408	0.1836734694	0.1020408163	0.5408163265	0.7448979592	0.8163265306	0.8979591837 ]);
bnet.CPD{HatGlasses} = tabular_CPD(bnet, HatGlasses, [0.612244898	0.2448979592	0.1020408163	0.04081632653	0.387755102	0.7551020408	0.8979591837	0.9591836735]);
bnet.CPD{BrownEyesFacialHair} = tabular_CPD(bnet, BrownEyesFacialHair, [0.2295918367	0.4132653061	0.1275510204	0.2295918367	0.7704081633	0.5867346939	0.8724489796	0.7704081633]);

bnet.CPD{HairColor} = tabular_CPD(bnet, HairColor, [0.2857142857, 0.2142857143, 0.2857142857, 0.2142857143]); %Black-Brown-Blonde-Red
bnet.CPD{HairStyle} = tabular_CPD(bnet, HairStyle, [0.1428571429, 0.8571428571]); %LONG - SHORT
bnet.CPD{Sex} = tabular_CPD(bnet, Sex, [0.2857142857,0.7142857143]); %Female-Male
bnet.CPD{EyeColor} = tabular_CPD(bnet, EyeColor, [0.3571428571, 0.6428571429]); %Blue-Brown
bnet.CPD{FacialHair} = tabular_CPD(bnet, FacialHair, [0.6428571429, 0.3571428571]); %NO-Yes
bnet.CPD{MouthSize} = tabular_CPD(bnet, MouthSize, [0.5714285714, 0.4285714286]); %Small-Big
bnet.CPD{Hat} = tabular_CPD(bnet, Hat,[0.7142857143, 0.2857142857]); % No-Yes
bnet.CPD{Glasses} = tabular_CPD(bnet, Glasses,[0.8571428571, 0.1428571429]); % No-Yes
bnet.CPD{NoseSize} = tabular_CPD(bnet, NoseSize,[0.7142857143, 0.2857142857]); % Small-Big
bnet.CPD{HairTexture} = tabular_CPD(bnet, HairTexture,[0.5, 0.1428571429, 0.3571428571]); % Straight-Wavy-Curly
bnet.CPD{EyebrowThickness} = tabular_CPD(bnet, EyebrowThickness,[0.8571428571, 0.1428571429]);%Small-Thick
bnet.CPD{RedCheek} = tabular_CPD(bnet, RedCheek,[0.7857142857, 0.2142857143]);%No-Yes
bnet.CPD{SadLooking} = tabular_CPD(bnet, SadLooking,[0.7857142857, 0.2142857143]);%No-Yes


end