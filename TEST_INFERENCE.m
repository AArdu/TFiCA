clear all, clc
addpath('./Functions')
load('./Data/initialGameboard.mat')

cd bnt-master
addpath(genpathKPM(pwd))
cd ../

allFeatures = initialGameboard(1,2:end);
allCharacters = initialGameboard(2:end,1);


ag = Agent;
[BN, node_names] = create_BN_exclusivity;
ag.bnet = BN;
ag.bnet.allNodes = string(node_names);
ag.allFeatures = allFeatures;
ag.allCharacters = allCharacters;
ag.agent_board = initialGameboard;
% decide character non randomly?
ag.agent_mystery = allCharacters(randi([1, length(allCharacters)]));
ag.ag_mys_features = initialGameboard(initialGameboard(:,1) == string(cell2mat(ag.agent_mystery)), 2:end);
ag.ag_feat_hypo = initialGameboard(1,2:end);
ag.ag_char_hypo = initialGameboard(2:end,1);

ag.BN_engine = jtree_inf_engine(ag.bnet);


evidence = cell(1, length(ag.bnet.node_sizes));

[engine, loglike] = enter_evidence(ag.BN_engine, evidence);