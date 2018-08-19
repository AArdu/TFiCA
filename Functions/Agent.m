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
                BN.CPD{C} = tabular_CPD(BN, C, [probs(i)]);
            end
            bnet = BN;
        end
        %% update gameboard probabilities
        function updateBoard(obj, ques, ans)
            
        end
        %% generate question to opponent based on the remaining characters on the board
        function question = formulate_question(obj)
            % use HBS and MFE here
            what = randi([1 2]);
            if what == 1 % ask feature
                question = [what randi([1 length(obj.allFeatures)])];
            elseif what == 2
                question = [what randi([1 length(obj.allCharacters)])];
            end
        end
        
        %%
    end
end