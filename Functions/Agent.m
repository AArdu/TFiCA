classdef Agent < handle
    properties
        bnet
        BN_engine
        allFeatures
        allCharacters
        allNodes
        agent_board
        agent_mystery
        ag_mys_features
        ag_feat_hypo
        ag_char_hypo
        winner
    end
    
    methods
        %% Update nodes with previous choices of opponent
        function bnet = updatePrev_games(obj, probs, BN)
            for i = 1:length(probs)
                C = BN.names(BN.allNodes(1 + i));
                BN.CPD{C} = tabular_CPD(BN, C, [probs(i) 1-probs(i)]);
            end
            bnet = BN;
        end
        
        %% update gameboard probabilities
        
        
        %% generate question to opponent based on the remaining characters on the board
        function question = formulate_question(obj)
            % get probs per character
            char_prob = obj.BNET.CPD(48:61);
            char_prob  = cell2mat(char_prob);
            feat_prob = obj.BNET.CPD(30:47);
            feat_prob = cell2mat(feat_prob);
            
            if max(char_prob) > max(feat_prob)
                
            end
            
        end
        
        %% generate question
        
        %%
    end
end