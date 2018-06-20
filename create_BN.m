function bnet = create_BN()
    load('./Data/initialGameboard.mat')

    % Generate Bayesian Model
    FeatureNames = initialGameboard(1,2:end);
    nFeatures = length(FeatureNames);
    CharacterNames = initialGameboard(2:end,1);
    nCharacters = length(CharacterNames);

%%    
    % names of all nodes
    allNames = vertcat(CharacterNames, FeatureNames')
    
    % create character nodes
    presentAlex=1;
    presentAlfred=2;
    presentAnita=3;
    presentAnne=4;
    presentBernard=5;
    presentBill=6;
    presentCharles=7;
    presentClaire=8;
    presentDavid=9;
    presentEric=10;
    presentFrans=11;
    presentGeorge=12;
    presentHerman=13;
    presentJoe=14;
    presentMaria=15;
    presentMax=16;
    presentPaul=17;
    presentPeter=18;
    presentPhilip=19;
    presentRichard=20;
    presentRobert=21;
    presentSam=22;
    presentSusan=23;
    presentTom=24;
    
    hairColor = 25; % 5
    hairStyle = 26; % 3
    sex = 27; % 2
    eyeColor = 28; % 2
    facialHair = 29; % 5
    mouthSize = 30; % 2
    hat = 31; % 2
    glasses = 32; % 2
    age = 33; % 2
    noseSize = 34; % 2
    hairTexture = 35; % 3
    eyebrowThickness = 36; % 2
    earRings = 37; % 2
    redCheek = 38; % 2
    sadLooking = 39; % 2 
    
    allNames={'presentAlex','presentAlfred','presentAnita','presentAnne','presentBernard', 'presentBill', 'presentCharles', 'presentClaire', 'presentDavid' ...
         'presentEric', 'presentFrans', 'presentGeorge', 'presentHerman', 'presentJoe', 'presentMaria', 'presentMax', 'presentPaul', 'presentPeter', 'presentPhilip' ...
        'presentRichard', 'presentRobert', 'presentSam', 'presentSusan', 'presentTom', 'hairColor', 'hairStyle', 'sex', 'eyeColor', 'facialHair','mouthSize' ...
        'hat', 'glasses', 'age', 'noseSize', 'hairTexture', 'eyebrowThickness', 'earRings', 'redCheek', 'sadLooking'}
        
        
    N = 39;
    dag = zeros(N,N);
    
    % define connections from characters to features
    dag(1:24, 25:39) = 1;
    
    % define sizes of nodes
    ns = 2*ones(1, 24);
    ps = 2^24;
    ns = [ns  [ps *5, ps * 3, ps * 2, ps * 2, ps * 5, ps * 2, ps * 2, ps * 2, ps * 2, ps * 2, ps * 3, ps * 2, ps * 2, ps * 2, ps * 2,]];

    bnet = mk_bnet(dag, ns, 'names', allNames, 'discrete', 1:39);
    G = bnet.dag;
    draw_graph(G);