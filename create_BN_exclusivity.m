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
Age = 38; % 2
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
'Hair' ;  'ShortHair' ;...
'Male' ; 'BrownEyes' ; 'FacialHair' ; 'Hat' ; 'Glasses' ; 'BigNose' ; ...
'StraightHair' ; 'ThickEyebrow' ; 'RedCheek' ;...
'BigMouth' ; 'SadLooking'};

% Make BN
NumTotalNodes = length(allNames);
dag = zeros(NumTotalNodes, NumTotalNodes);

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
dag(BlackHairSadLooking, [BlackHair,SadLooking]) = 1;
dag(BrownHairBigMouth, [BrownHair,BigMouth])=1;
dag(ThickEyebrowRedHair, [ThickEyebrow, RedHair])=1;
dag(CurlyHairShortHair, [CurlyHair, ShortHair])=1;
dag(MaleWavyHair, [Male, WavyHair])=1;
dag(BrownEyesStraightHair, [BrownEyes, StraightHair])=1;
dag(FacialHairBigNose, [FacialHair, BigNose])=1;
dag(HatGlasses, [Hat, Glasses])=1;
dag(BrownEyesFacialHair, [BrownEyes, FacialHair])=1;

discrete_nodes = Character_node:NumTotalNodes;
ns_features = [4, 2, 2,  2,  2, 2,  2,  2,  2, 3, 2, 2, 2];
node_sizes = [14, 2 * ones(1,18), 8 * ones(1,9),  ];

    % Observed nodes
    onodes = [Alex:Robert]; %Since all the characters are observed right>? this changes at a later stage
    
    bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes, ...
        'observed', onodes);
    node_names = allNames;