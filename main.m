%% load gameborads and get headers 
clear all, clc
addpath('./Functions')
load('./Data/initialGameboard.mat')

%% start simulation
num_simulations = 1;

for i = 1:num_simulations
    turn = 0;
    winner = "nobody";
    
    % reset players to initial values before starting a game
    [agent, opponent] = initializePlayers(initialGameboard);

    while turn < 31
        % insert code for the BN here
        %###################
        agn_ques = [2, randi([2, 10])];
        %###################
        
        opp_ans = opponent.ask_opponent(agn_ques(1), agn_ques(2));
        if ~isempty(opponent.winner)
            winner = opponent.winner; 
            break
        end
        
%         agent.updateBoard(agn_ques, opp_ans)
        
        opp_ques = opponent.formulate_question;
        
        agent_ans = true;
        
        opponent.updateHypotheses(opp_ques(2), agent_ans)
        turn = turn + 1;
    end
    sprintf("The game is over: %s won.", winner)
end