classdef Opponent < handle
    properties
        allFeatures
        allCharacters
        opponent_board
        opponent_mystery
        opp_mys_features
        opp_feat_hypo
        opp_char_hypo
        winner
    end
    
    methods
        %% generate response to BN agent's question
        function response = ask_opponent(obj, feat_or_char, which_one)
            answer = "notihng";
            if feat_or_char == 1
                % check if feature is part of opponent's character
                if obj.opp_mys_features{which_one - 1} == 1
                    sprintf("Opponent replies: Yes, my character has %s", obj.allFeatures{which_one - 1})
                    answer = true;
                elseif obj.opp_mys_features{which_one - 1} == 0
                    sprintf("Opponent replies: No, my character does not have %s", obj.allFeatures{which_one - 1})
                    answer = false;
                end
            elseif feat_or_char == 2
                % check if character is mystery character
                if obj.opponent_mystery == string(obj.allCharacters{which_one})
                    obj.winner = "agent";
                    answer = "game over";
                else
                    obj.winner = "opponent";
                    answer = "game over";
                end
            end

            response = answer;
        end
        %% ask a question to the BN agent based on the remaining characters on the board
        function question = formulate_question(obj)
            % calculate probs per character
            char_prob = zeros(length(obj.opp_char_hypo),1);
            feat_prob = zeros(length(obj.opp_feat_hypo),1);

            for c = 1:length(obj.opp_char_hypo)
                s = 0;
                for f = 1:length(obj.opp_feat_hypo)
                    s = cell2mat(obj.opponent_board(string(obj.opponent_board(:,1)) == string(obj.opp_char_hypo(c)), ...
                        string(obj.opponent_board(1,:)) == string(obj.opp_feat_hypo(f))));
                    char_prob(c) = char_prob(c) + s; 
                    feat_prob(f) = feat_prob(f) + s;
                end
            end
            char_prob = char_prob / length(obj.opp_feat_hypo);
            feat_prob = feat_prob / length(obj.opp_char_hypo);
            
            % if character has high prob of being mystery char, ask that
            if max(char_prob) > 0.8
                [~, q] = max(char_prob);
                question = [2, obj.allCharacters(string(obj.allCharacters) == string(obj.opp_char_hypo(q)))];
                return
            else
                % ask feature with highest prob
                [~, q] = max(feat_prob);
                question = [1, obj.allFeatures(string(obj.allFeatures) == string(obj.opp_feat_hypo(q)))];
                return
            end
        end
    end
end