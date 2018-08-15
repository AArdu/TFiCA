function bnet = create_BN()

    %Number of characters node
    charac_N = 1;

    % Past feature nodes
    PastBrownHair = 2;
    PastRedHair = 3;
    PastLongHair = 4;
    PastFemale = 5;
    PastBrownEyes = 6;
    PastMustache = 7;
    PastBeard = 8;
    PastMustacheBeard = 9;
    PastGlasses = 10;
    PastBigNose = 11;
    PastSmallNose = 12;
    PastCurlyHair = 13;
    PastRedCheek = 14;
    PastBigMouth = 15;
    PastSadLooking = 16;

    % Feature co-ocurrences nodes
    MustacheBigMouth = 17;
    LongHairCurlyHair = 18;
    GlassesRedCheek = 19;
    SmallNoseSadLooking = 20;
    BeardBigMouth = 21;
    RedHairSadLooking = 22;
    MustacheBeardSadLooking = 23;
    BrownHairSadLooking = 24;
    FemaleGlasses = 25;
    BrownEyesBigNose = 26;

    % Current features nodes
    BrownHair = 27;
    RedHair = 28;
    LongHair = 29;
    Female = 30;
    BrownEyes = 31;
    Mustache = 32;
    Beard = 33;
    MustacheBeard = 34;
    Glasses = 35;
    BigNose = 36;
    SmallNose = 37;
    CurlyHair = 38;
    RedCheek = 39;
    BigMouth = 40;
    SadLooking = 41;

    % Probabilities of characters
    Alex = 42;
    Alfred = 43;
    Anita = 44;
    Anne = 45;
    Bernard = 46;
    Charles = 47;
    Claire = 48;
    Eric = 49;
    Frans = 50;
    Joe = 51;
    Maria = 52;
    Max = 53;
    Philip = 54;
    Robert = 55;

    % Names of all the nodes
    allNames = {'charac_N'; 'PastBrownHair'; 'PastRedHair'; 'PastLongHair'; 'PastFemale'; ...
    'PastBrownEyes'; 'PastMustache'; 'PastBeard'; 'PastMustacheBeard'; 'PastGlasses'; ...
    'PastBigNose'; 'PastSmallNose'; 'PastCurlyHair'; 'PastRedCheek'; 'PastBigMouth'; ...
    'PastSadLooking'; 'MustacheBigMouth'; 'LongHairCurlyHair'; 'GlassesRedCheek'; ...
    'SmallNoseSadLooking'; 'BeardBigMouth'; 'RedHairSadLooking'; 'MustacheBeardSadLooking'; ...
    'BrownHairSadLooking'; 'FemaleGlasses'; 'BrownEyesBigNose'; 'BrownHair'; ...
    'RedHair'; 'LongHair'; 'Female'; 'BrownEyes'; 'Mustache'; 'Beard'; 'MustacheBeard'; ...
    'Glasses'; 'BigNose'; 'SmallNose'; 'CurlyHair'; 'RedCheek'; 'BigMouth'; 'SadLooking'; ...
    'Alex'; 'Alfred'; 'Anita'; 'Anne'; 'Bernard'; 'Charles'; 'Claire'; 'Eric'; 'Frans'; ...
    'Joe'; 'Maria'; 'Max'; 'Philip'; 'Robert'};

    % Make BN
    NumTotalNodes = length(allNames);
    dag = zeros(NumTotalNodes, NumTotalNodes);

    % Define connections
    dag(charac_N, Alex:Robert) = 1;
    dag(Alex:Robert, MustacheBigMouth:BrownEyesBigNose) = 1;
    dag(Alex:Robert, BrownHair:SadLooking) = 1;
    dag(MustacheBigMouth:BrownEyesBigNose, BrownHair:SadLooking) = 1;
    dag(PastBrownHair:PastSadLooking, MustacheBigMouth:BrownEyesBigNose) = 1;

    % Node sizes
    discrete_nodes = PastBrownHair:NumTotalNodes;
    node_sizes = 2 * ones(1, NumTotalNodes - 1);

    bnet = mk_bnet(dag, node_sizes, 'names', allNames, 'discrete', discrete_nodes);


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
