clear all, close all
load('./Data/initialGameboard.mat')
%% Generate Bayesian Model

FeatureNames = initialGameboard(1,2:end);
nFeatures = length(FeatureNames);
CharacterNames = initialGameboard(2:end,1);
nCharacters = length(CharacterNames);

% create arrays of names for the nodes in the BN
presentFeatures = strcat("present", FeatureNames)';
presentCharacters = strcat("present", CharacterNames);
opponentsTiles = "nOpponentTiles";
questionsAsked = strcat("asked", FeatureNames)';
previousFeatures = strcat("previous", FeatureNames)';
 

%% create interactions

intrac = {};
for f = 1:nFeatures
    for c = 1:nCharacters
        intrac(end+1, :) = {cellstr(presentFeatures(f)), cellstr(presentCharacters(c))};
    end
end
for f = 1:nFeatures
    for c = 1:nCharacters
        intrac(end+1, :) = {cellstr(presentCharacters(c)), cellstr(presentFeatures(f))};
    end
end
for f = 1:nFeatures
    for c = 1:nFeatures
        intrac(end+1, :) = {cellstr(previousFeatures(f)), cellstr(presentFeatures(c))};
    end
end
for f = 1:nFeatures
    for c = 1:nFeatures
        intrac(end+1, :) = {cellstr(questionsAsked(f)), cellstr(presentFeatures(c))};
    end
end
for c = 1:nFeatures
    intrac(end+1, :) = {cellstr(questionsAsked(c)), cellstr(opponentsTiles)};
end
for c = 1:nCharacters
    intrac(end+1, :) = {cellstr(opponentsTiles), cellstr(presentCharacters(c))};
end
names = vertcat(presentFeatures,presentCharacters,opponentsTiles,questionsAsked,previousFeatures);

% Still don't know the difference, so I keep them equal
interc = intrac;

[intra, ~] = mk_adj_mat(intrac, names);
inter = mk_adj_mat(interc, names, 0);

obs = names;
for i = 1:length(names)
    onodes(i) = strmatch(obs(i), names);
end
onodes = sort(onodes);

dnodes = 1:nCharacters;
ns = 2*ones(1, nCharacters);%binary nodes
bnet = mk_dbn(intra, inter, ns, 'iscrete', dnodes);
for i = 1:2*nCharacters
    bnet.CPD{i} = tabular(bnet, i);
end
%% Visualize Bayesian Net
G = bnet.dag;
draw_graph(G);

