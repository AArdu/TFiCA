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

intract = {};
for f = 1:nFeatures
    for c = 1:nCharacters
        interactions(end+1, :) = {cellstr(presentFeatures(f)), cellstr(presentCharacters(c))};
    end
end
for f = 1:nFeatures
    for c = 1:nCharacters
        interactions(end+1, :) = {cellstr(presentCharacters(c)), cellstr(presentFeatures(f))};
    end
end
for f = 1:nFeatures
    for c = 1:nFeatures
        interactions(end+1, :) = {cellstr(previousFeatures(f)), cellstr(presentFeatures(c))};
    end
end
for f = 1:nFeatures
    for c = 1:nFeatures
        interactions(end+1, :) = {cellstr(questionsAsked(f)), cellstr(presentFeatures(c))};
    end
end
for c = 1:nFeatures
    interactions(end+1, :) = {cellstr(questionsAsked(c)), cellstr(opponentsTiles)};
end
for c = 1:nCharacters
    interactions(end+1, :) = {cellstr(opponentsTiles), cellstr(presentCharacters(c))};
end
names = vertcat(presentFeatures,presentCharacters,opponentsTiles,questionsAsked,previousFeatures);
[intra, names] = mk_adj_mat(interactions, names);
%% Visualize Bayesian Net
G = bnet.dag;
draw_graph(G);

