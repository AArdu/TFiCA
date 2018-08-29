    %Number of characters node
    Alex = 1;
    Alfred = 2;
    Anita = 3;
    Anne = 4;
    Bernard = 5;
    Charles = 6;
    Claire = 7;
    Eric = 8;
    Frans = 9;
    Joe = 10;
    Maria = 11;
    Max = 12;
    Philip = 13;
    Robert = 14;

    % Past feature nodes
    PastBlackHair = 15;
    PastBrownHair = 16;
    PastBlondeHair = 17;
    PastRedHair = 18;
    PastShortHair = 19;
    PastMale = 20;
    PastBrownEyes = 21;
    PastFacialHair = 22;
    PastHat = 23;
    PastGlasses = 24;
    PastBigNose = 25;
    PastStraightHair = 26;
    PastWavyHair = 27;
    PastCurlyHair = 28;
    PastThickEyebrow = 29;
    PastRedCheek = 30;
    PastBigMouth = 31;
    PastSadLooking = 32;

    % Feature co-ocurrences nodes % intersections
    BlackHairSadLooking = 33; % 1
    BrownHairBigMouth = 34; % 1
    BlondeHairRedCheek = 35 ; % 1
    ThickEyebrowRedHair = 36; % 1
    CurlyHairShortHair = 37; % 5
    HatWavyHair = 38; % 2
    BrownEyesStraightHair = 39; % 4
    FaciaHairBigNose = 40; % 1
    HatGlasses = 41; % 1
    BrownEyesFacialHair = 42; % 3

    % Current features nodes
    BlackHair = 43;
    BrownHair = 44;
    BlondeHair = 45;
    RedHair = 46;
    ShortHair = 47;
    Male = 48;
    BrownEyes = 49;
    FacialHair = 50;
    Hat = 51;
    Glasses = 52;
    BigNose = 53;
    StraightHair = 54;
    WavyHair = 55;
    CurlyHair = 56;
    ThickEyebrow = 57;
    RedCheek = 58;
    BigMouth = 59;
    SadLooking = 60;

    % Probabilities of characters


    % Names of all the nodes
    allNames = {'Alex' ; 'Alfred' ; 'Anita' ; 'Anne' ; ...
    'Bernard' ; 'Charles' ; 'Claire' ; 'Eric' ; 'Frans' ; 'Joe' ;...
    'Maria' ; 'Max' ; 'Philip'; 'Robert'; 'PastBlackHair' ; 'PastBrownHair' ; 'PastBlondeHair' ;...
    'PastRedHair' ; 'PastShortHair' ; 'PastMale' ; 'PastBrownEyes' ; 'PastFacialHair' ;...
    'PastHat' ; 'PastGlasses' ; 'PastBigNose' ; 'PastStraightHair' ; 'PastWavyHair' ;...
    'PastCurlyHair' ; 'PastThickEyebrow' ; 'PastRedCheek' ; 'PastBigMouth' ;...
    'PastSadLooking'; 'BlackHairSadLooking'; 'BrownHairBigMouth';...
    'BlondeHairRedCheek'; 'ThickEyebrowRedHair'; 'CurlyHairShortHair';...
    'HatWavyHair'; 'BrownEyesStraightHair'; 'FaciaHairBigNose'; 'HatGlasses'; 'BrownEyesFacialHair';...
    'BlackHair' ; 'BrownHair' ; 'BlondeHair' ; 'RedHair' ; 'ShortHair' ;...
    'Male' ; 'BrownEyes' ; 'FacialHair' ; 'Hat' ; 'Glasses' ; 'BigNose' ; ...
    'StraightHair' ; 'WavyHair' ; 'CurlyHair' ; 'ThickEyebrow' ; 'RedCheek' ;...
    'BigMouth' ; 'SadLooking'};

    % Make BN
    NumTotalNodes = length(allNames);
    dag = zeros(NumTotalNodes, NumTotalNodes);

    % Define connections
    %dag(charac_N, Alex:Robert) = 1;

    dag(Alex:Robert, BlackHair:SadLooking) = 1;
 
    % connect co-occurrencies
    % NOTE probability of character board does not inflience the co-occurences
    % dag(Alex:Robert, BlackHairSadLooking:BrownEyesFacialHair) = 1;
    dag(BlackHairSadLooking:BrownEyesFacialHair, BlackHair:SadLooking) = 1;

    dag([PastBlackHair PastSadLooking], BlackHairSadLooking) = 1;
    dag([PastBrownHair PastBigMouth], BrownHairBigMouth) = 1;
    dag([PastBlondeHair PastRedCheek], BlondeHairRedCheek) = 1 ;
    dag([PastThickEyebrow PastRedHair], ThickEyebrowRedHair) = 1;
    dag([PastCurlyHair PastShortHair], CurlyHairShortHair) = 1 ;
    dag([PastHat PastWavyHair], HatWavyHair) = 1 ;
    dag([PastBrownEyes PastStraightHair], BrownEyesStraightHair) = 1 ;
    dag([PastFacialHair PastBigNose], FaciaHairBigNose) = 1 ;
    dag([PastHat PastGlasses], HatGlasses) = 1 ;
    dag([PastBrownEyes PastFacialHair], BrownEyesFacialHair) = 1 ;

    % Node sizes,
    discrete_nodes = PastBlackHair:NumTotalNodes;
    node_sizes = [1, ones(1, PastSadLooking - PastBlackHair), ...
        2 * ones(1, BrownEyesFacialHair - BlackHairSadLooking), ones(1, Robert - BlackHair)];

    % Observed nodes
    onodes = [PastBlackHair PastSadLooking, Alex:Robert];
    bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes, ...
        'observed', onodes);
    node_names = allNames;