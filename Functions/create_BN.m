function [bnet, node_names] = create_BN()

    %Number of characters node
    charac_N = 1;

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

    % Feature co-ocurrences nodes
    BlackHairSadLooking = 20;
    BrownHairBigMouth = 21;
    BlondeHairRedCheek = 22 ;
    ThickEyebrowRedHair = 23;
    CurlyHairShortHair = 24;
    MaleWavyHair = 25;
    BrownEyesStraightHair = 26;
    FaciaHairBigNose = 27;
    HatGlasses = 28;
    GlassesFacialHair = 29;

    % Current features nodes
    BlackHair = 30;
    BrownHair = 31;
    BlondeHair = 32;
    RedHair = 33;
    ShortHair = 34;
    Male = 35;
    BrownEyes = 36;
    FacialHair = 37;
    Hat = 38;
    Glasses = 39;
    BigNose = 40;
    StraightHair = 41;
    WavyHair = 42;
    CurlyHair = 43;
    ThickEyebrow = 44;
    RedCheek = 45;
    BigMouth = 46;
    SadLooking = 47;

    % Probabilities of characters
    Alex = 48;
    Alfred = 49;
    Anita = 50;
    Anne = 51;
    Bernard = 52;
    Charles = 53;
    Claire = 54;
    Eric = 55;
    Frans = 56;
    Joe = 57;
    Maria = 58;
    Max = 59;
    Philip = 60;
    Robert = 61;

    % Names of all the nodes
    allNames = {'charac_N'; 'PastBlackHair' ; 'PastBrownHair' ; 'PastBlondeHair' ;...
    'PastRedHair' ; 'PastShortHair' ; 'PastMale' ; 'PastBrownEyes' ; 'PastFacialHair' ;...
    'PastHat' ; 'PastGlasses' ; 'PastBigNose' ; 'PastStraightHair' ; 'PastWavyHair' ;...
    'PastCurlyHair' ; 'PastThickEyebrow' ; 'PastRedCheek' ; 'PastBigMouth' ;...
    'PastSadLooking'; 'BlackHairSadLooking'; 'BrownHairBigMouth';...
    'BlondeHairRedCheek'; 'ThickEyebrowRedHair'; 'CurlyHairShortHair';...
    'MaleWavyHair'; 'BrownEyesStraightHair'; 'FaciaHairBigNose'; 'HatGlasses'; 'GlassesFacialHair';...
    'BlackHair' ; 'BrownHair' ; 'BlondeHair' ; 'RedHair' ; 'ShortHair' ;...
    'Male' ; 'BrownEyes' ; 'FacialHair' ; 'Hat' ; 'Glasses' ; 'BigNose' ; ...
    'StraightHair' ; 'WavyHair' ; 'CurlyHair' ; 'ThickEyebrow' ; 'RedCheek' ;...
    'BigMouth' ; 'SadLooking'; 'Alex' ; 'Alfred' ; 'Anita' ; 'Anne' ; ...
    'Bernard' ; 'Charles' ; 'Claire' ; 'Eric' ; 'Frans' ; 'Joe' ;...
    'Maria' ; 'Max' ; 'Philip';'Robert'};

    % Make BN
    NumTotalNodes = length(allNames);
    dag = zeros(NumTotalNodes, NumTotalNodes);

    % Define connections
    dag(charac_N, Alex:Robert) = 1;

    dag(Alex:Robert, BlackHair:SadLooking) = 1;

    % connect co-occurrencies
    dag(Alex:Robert, BlackHairSadLooking:GlassesFacialHair) = 1;
    dag(BlackHairSadLooking:GlassesFacialHair, BlackHair:SadLooking) = 1;

    dag([PastBlackHair PastSadLooking], BlackHairSadLooking) = 1;
    dag([PastBrownHair PastBigMouth], BrownHairBigMouth) = 1;
    dag([PastBlondeHair PastRedCheek], BlondeHairRedCheek) = 1 ;
    dag([PastThickEyebrow PastRedHair], ThickEyebrowRedHair) = 1;
    dag([PastCurlyHair PastShortHair], CurlyHairShortHair) = 1 ;
    dag([PastMale PastWavyHair], MaleWavyHair) = 1 ;
    dag([PastBrownEyes PastStraightHair], BrownEyesStraightHair) = 1 ;
    dag([PastFacialHair PastBigNose], FaciaHairBigNose) = 1 ;
    dag([PastHat PastGlasses], HatGlasses) = 1 ;
    dag([PastGlasses PastFacialHair], GlassesFacialHair) = 1 ;

    % Node sizes, 
    discrete_nodes = PastBrownHair:NumTotalNodes;
    node_sizes = [1, ones(1, PastSadLooking - PastBlackHair), ...
        2 * ones(1, GlassesFacialHair - BlackHairSadLooking), ones(1, Robert - BlackHair)];

    % Observed nodes
    onodes = [1:19 30:61];
    bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes);
    node_names = allNames;

% uncomment these things at a later stage:
% character_size=14;
% ns_PastFeat = 2*ones(1, nPastFeatures);
% ns_FeatCooccur = 2*ones(1, length(featcoocureNames));
% ns_features = [5, 3, 2,  2,  5, 2,  2,  2,  2, 2, 3, 2, 2, 2, 2];
% node_sizes = [character_size, ns_PastFeat, ns_FeatCooccur, ns_features];


%  %because the characters are mutually exclusive they might actually belong to 1 node.
%     N = 39;
%     dag = zeros(N,N);
%
% % define connections from characters to features
%     dag(1:24, 25:39) = 1;

    % define sizes of nodes
end
