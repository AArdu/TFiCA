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
    MaleWavyHair = 38; % 2
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
    'MaleWavyHair'; 'BrownEyesStraightHair'; 'FacialHairBigNose'; 'HatGlasses'; 'BrownEyesFacialHair';...
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



    % Node sizes,
    discrete_nodes = Alex:NumTotalNodes;
    node_sizes_characters = 2 * ones(1,14);
    %node_sizes = [node_sizes_characters, ones(1, PastSadLooking - PastBlackHair), ...
    %    2 * ones(1, BrownEyesFacialHair - BlackHairSadLooking), ones(1, Robert - BlackHair)];
    node_sizes = [2*ones(1, 42), ones(1, 18) * 2^15];
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
    bnet.CPD{PastBlackHair} = tabular_CPD(bnet, PastBlackHair, [0.7142857143, 0.2857142857 ]);
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

    feature_CPTs = feature_probs;

    bnet.CPD{BlackHair} = tabular_CPD(bnet, BlackHair, [feature_CPTs{1}]);
    bnet.CPD{BrownHair} = tabular_CPD(bnet, BrownHair, [feature_CPTs{2}]);
    bnet.CPD{BlondeHair} = tabular_CPD(bnet, BlondeHair, [feature_CPTs{3}]);
    bnet.CPD{RedHair} = tabular_CPD(bnet, RedHair, [feature_CPTs{4}]);
    bnet.CPD{ShortHair} = tabular_CPD(bnet, ShortHair, [feature_CPTs{5}]);
    bnet.CPD{Male} = tabular_CPD(bnet, Male, [feature_CPTs{6}]);
    bnet.CPD{BrownEyes} = tabular_CPD(bnet, BrownEyes, [feature_CPTs{7}]);
    bnet.CPD{FacialHair} = tabular_CPD(bnet, FacialHair, [feature_CPTs{8}]);
    bnet.CPD{Hat} = tabular_CPD(bnet, Hat, [feature_CPTs{9}]);
    bnet.CPD{Glasses} = tabular_CPD(bnet, Glasses, [feature_CPTs{10}]);
    bnet.CPD{BigNose} = tabular_CPD(bnet, BigNose, [feature_CPTs{11}]);
    bnet.CPD{StraightHair} = tabular_CPD(bnet, StraightHair, [feature_CPTs{12}]);
    bnet.CPD{WavyHair} = tabular_CPD(bnet, WavyHair, [feature_CPTs{13}]);
    bnet.CPD{CurlyHair} = tabular_CPD(bnet, CurlyHair, [feature_CPTs{14}]);
    bnet.CPD{ThickEyebrow} = tabular_CPD(bnet, ThickEyebrow, [feature_CPTs{15}]);
    bnet.CPD{RedCheek} = tabular_CPD(bnet, RedCheek, [feature_CPTs{16}]);
    bnet.CPD{BigMouth} = tabular_CPD(bnet, BigMouth, [feature_CPTs{17}]);
    bnet.CPD{SadLooking} = tabular_CPD(bnet, SadLooking, [feature_CPTs{18}]);

 end
