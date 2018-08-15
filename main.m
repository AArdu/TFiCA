%% load gameborads and get headers 
clear all, clc
addpath('./Functions')
load('./Data/initialGameboard.mat')

cd bnt-master
addpath(genpathKPM(pwd))
cd ../

%% start simulation
BN_won = 0;
BN_lost = 0;
Dummy_won = 0;
Dummy_lost = 0;

num_simulations = 5;

prev_games = zeros(1, length(initialGameboard(1, 2:end)));

for i = 1:num_simulations
    turn = 0;
    winner = "nobody";
    
    % reset players to initial values before starting a game
    [agent, opponent] = initializePlayers(initialGameboard);

    prev_games = (prev_games + cell2mat(initialGameboard(string(initialGameboard(1:end, 1))...
        == string(opponent.opponent_mystery), 2:end))) / 2;
 
    while turn < 15
        % insert code for the BN here
        %###################
        agn_ques = [1, randi([2, 10])];
        %###################
        if agn_ques(1) == 1
            sprintf("Agent asks: Does your character have %s?", string(initialGameboard(1, agn_ques(2))))
        elseif agn_ques(1) == 2
            sprintf("Agent asks: Is your character %s?", string(initialGameboard(agn_ques(2), 1)));
        end
            
        opp_ans = opponent.ask_opponent(agn_ques(1), agn_ques(2));
        if ~isempty(opponent.winner)
            winner = opponent.winner; 
            break
        end
%         agent.updateBoard(agn_ques, opp_ans)
        
        opp_ques = opponent.formulate_question;
        if opp_ques{1} == 1
            sprintf("Opponent asks: Does your character have %s?", opp_ques{2})
        
            agent_ans = logical(cell2mat(initialGameboard(string(initialGameboard(:, 1))...
                == string(agent.agent_mystery), string(initialGameboard(1, :)) == opp_ques{2})));
        
        elseif opp_ques{1} == 2
            sprintf("Opponent asks: Is your character %s?", opp_ques{2})
            agent_ans = logical(agent.agent_mystery == string(opp_ques{2}));
        
        end
        
        if agent_ans == true
            if opp_ques{1} == 1
                sprintf("Agent replies: Yes, my character has %s", opp_ques{2})
            elseif opp_ques{1} == 2
                sprintf("Agent replies: Yes, my character is %s", opp_ques{2})
                Dummy_won = Dummy_won + 1;
                break
            end
        elseif agent_ans == false
            if opp_ques{1} == 1
                sprintf("Agent replies: No, my character does not have %s", opp_ques{2})
            elseif opp_ques{1} == 2
                sprintf("Agent replies: No, my character is not %s", opp_ques{2})
                Dummy_lost = Dummy_lost + 1;
                break
            end
        end
        
        
        [new_op_char, new_op_feat] = updateBoard(initialGameboard, ...
            opponent.opp_char_hypo, opponent.opp_feat_hypo, opp_ques, agent_ans);
        
        opponent.opp_char_hypo = new_op_char;
        opponent.opp_feat_hypo = new_op_feat;
        
        turn = turn + 1;
    end
    sprintf("The game is over: %s won.", winner)
end

sprintf("Number of games won by opponent: %i. Number of games lost by opponent: %i", Dummy_won, Dummy_lost)