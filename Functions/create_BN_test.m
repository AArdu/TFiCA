function [bnet, node_names] = create_BN_test()    

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
    FacialHairBigNose = 40; % 1
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
    'HatWavyHair'; 'BrownEyesStraightHair'; 'FacialHairBigNose'; 'HatGlasses'; 'BrownEyesFacialHair';...
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
    dag([PastFacialHair PastBigNose], FacialHairBigNose) = 1 ;
    dag([PastHat PastGlasses], HatGlasses) = 1 ;
    dag([PastBrownEyes PastFacialHair], BrownEyesFacialHair) = 1 ;
    
    %connecting the co-occurences to the features
    dag(BlackHairSadLooking, [BlackHair,SadLooking]) = 1;
    dag(BrownHairBigMouth, [BrownHair,BigMouth])=1;
    dag(ThickEyebrowRedHair, [ThickEyebrow, RedHair])=1;
    dag(CurlyHairShortHair, [CurlyHair, ShortHair])=1;
    dag(HatWavyHair, [Hat, WavyHair])=1;
    dag(BrownEyesStraightHair, [BrownEyes, StraightHair])=1;
    dag(FacialHairBigNose, [FacialHair, BigNose])=1;
    dag(HatGlasses, [Hat, Glasses])=1;
    dag(BrownEyesFacialHair, [BrownEyes, FacialHair])=1;
    
    
    
    % Node sizes,
    discrete_nodes = Alex:NumTotalNodes;
    node_sizes_characters = 2 * ones(1,14);
    %node_sizes = [node_sizes_characters, ones(1, PastSadLooking - PastBlackHair), ...
    %    2 * ones(1, BrownEyesFacialHair - BlackHairSadLooking), ones(1, Robert - BlackHair)];
    node_sizes = 2*ones(1,60);
    % Observed nodes
    onodes = [Alex:Robert]; %Since all the characters are observed right>? this changes at a later stage
    bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes, ...
        'observed', onodes);
    node_names = allNames;
    
    %%%%%% Setting the probabilities for the characters %%%%%%%%%%%%%%
    bnet.CPD{Alex} = tabular_CPD(bnet, Alex, [13/14, 1/14 ]);
    bnet.CPD{Alfred} = tabular_CPD(bnet, Alfred, [13/14, 1/14 ]);
    bnet.CPD{Anita} = tabular_CPD(bnet, Anita, [13/14, 1/14 ]);
    bnet.CPD{Anne} = tabular_CPD(bnet, Anne, [13/14, 1/14 ]);
    bnet.CPD{Bernard} = tabular_CPD(bnet, Bernard, [13/14, 1/14 ]);
    bnet.CPD{Charles} = tabular_CPD(bnet, Charles, [13/14, 1/14 ]);
    bnet.CPD{Claire} = tabular_CPD(bnet, Claire, [13/14, 1/14 ]);
    bnet.CPD{Eric} = tabular_CPD(bnet, Eric, [13/14, 1/14 ]);
    bnet.CPD{Frans} = tabular_CPD(bnet, Frans, [13/14, 1/14 ]);
    bnet.CPD{Joe} = tabular_CPD(bnet, Joe, [13/14, 1/14 ]);
    bnet.CPD{Maria} = tabular_CPD(bnet, Maria, [13/14, 1/14 ]);
    bnet.CPD{Max} = tabular_CPD(bnet, Max, [13/14, 1/14 ]);
    bnet.CPD{Philip} = tabular_CPD(bnet, Philip, [13/14, 1/14 ]);
    bnet.CPD{Robert} = tabular_CPD(bnet, Robert, [13/14, 1/14 ]);
    
     %%%%%% Setting the probabilities for the past features %%%%%%%%%%%%%%
     %%%%%% SHould be changed to some other values
    bnet.CPD{PastBlackHair} = tabular_CPD(bnet, PastBlackHair, [13/14, 1/14 ]);
    bnet.CPD{PastBrownHair} = tabular_CPD(bnet, PastBrownHair, [13/14, 1/14 ]);
    bnet.CPD{PastBlondeHair} = tabular_CPD(bnet, PastBlondeHair, [13/14, 1/14 ]);
    bnet.CPD{PastRedHair} = tabular_CPD(bnet, PastRedHair, [13/14, 1/14 ]);
    bnet.CPD{PastShortHair} = tabular_CPD(bnet, PastShortHair, [13/14, 1/14 ]);
    bnet.CPD{PastMale} = tabular_CPD(bnet, PastMale, [13/14, 1/14 ]);
    bnet.CPD{PastBrownEyes} = tabular_CPD(bnet, PastBrownEyes, [13/14, 1/14 ]);
    bnet.CPD{PastFacialHair} = tabular_CPD(bnet, PastFacialHair, [13/14, 1/14 ]);
    bnet.CPD{PastHat} = tabular_CPD(bnet, PastHat, [13/14, 1/14 ]);
    bnet.CPD{PastGlasses} = tabular_CPD(bnet, PastGlasses, [13/14, 1/14 ]);
    bnet.CPD{PastBigNose} = tabular_CPD(bnet, PastBigNose, [13/14, 1/14 ]);
    bnet.CPD{PastStraightHair} = tabular_CPD(bnet, PastStraightHair, [13/14, 1/14 ]);
    bnet.CPD{PastWavyHair} = tabular_CPD(bnet, PastWavyHair, [13/14, 1/14 ]);
    bnet.CPD{PastCurlyHair} = tabular_CPD(bnet, PastCurlyHair, [13/14, 1/14 ]);
    bnet.CPD{PastThickEyebrow} = tabular_CPD(bnet, PastThickEyebrow, [13/14, 1/14 ]);
    bnet.CPD{PastRedCheek} = tabular_CPD(bnet, PastRedCheek, [13/14, 1/14 ]);
    bnet.CPD{PastBigMouth} = tabular_CPD(bnet, PastBigMouth, [13/14, 1/14 ]);
    bnet.CPD{PastSadLooking} = tabular_CPD(bnet, PastSadLooking, [13/14, 1/14 ]);
        
    

end
     