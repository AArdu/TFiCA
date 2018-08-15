function [agent, op] = initializePlayers(inBoard) 
    
    allFeatures = inBoard(1,2:end);
    allCharacters = inBoard(2:end,1);
    
    op = Opponent;
    op.allFeatures = allFeatures;
    op.allCharacters = allCharacters;
    op.opponent_board = inBoard;
    % TODO: chose mystery character with some criteria
    op.opponent_mystery = allCharacters(randi([1, length(allCharacters)]));
    op.opp_mys_features = inBoard(inBoard(:,1) == string(cell2mat(op.opponent_mystery)), 2:end);
    op.opp_feat_hypo = inBoard(1,2:end);
    op.opp_char_hypo = inBoard(2:end,1);
    
    ag = Agent;
    ag.BNET = create_BN;
    ag.allFeatures = allFeatures;
    ag.allCharacters = allCharacters;
    ag.agent_board = inBoard;
    % decide character non randomly?
    ag.agent_mystery = allCharacters(randi([1, length(allCharacters)]));
    ag.ag_mys_features = inBoard(inBoard(:,1) == string(cell2mat(ag.agent_mystery)), 2:end);
    ag.ag_feat_hypo = inBoard(1,2:end);
    ag.ag_char_hypo = inBoard(2:end,1);
    
    agent = ag;
    opponent = op;
end
