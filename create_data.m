%% Open CSV file and import Data from initial board
initialGameboard = csvimport('./Data/gameboard.csv');

%% Get initial probabilities of the features (Features layer in BN)
initialProbs = mean(cell2mat(initialGameboard(2:end, 2:end)), 1);

% initialGameboard(end+1, 2:end) = num2cell(initialProbs);
% initialGameboard(end, 1) = cellstr("initialProbs");

% Sort the board by the probabilities of features
[~, i] = sort(initialProbs, 'descend');
sortedBoard = [initialGameboard(:, 1), initialGameboard(:, i+1)];

%% Save workspace
save("Data/initialGameboard.mat", 'initialGameboard', 'sortedBoard')