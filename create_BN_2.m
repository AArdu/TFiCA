function FeatCoocur = create_BN()

%character node
charac_N=1;

%past selected features
%Should have each specific feature like BrownHair e.g. 
%Is not mutually exclusive!
%Should have a decay parameter that decays the values over time. this can
%actually be done in the update part of the code
load('./Data/initialGameboard.mat')

% Generate Bayesian Model
PastSelectedFeatures = initialGameboard(1,2:end);
nPastFeatures = length(PastSelectedFeatures);

%feature coocurrences
FeatCoocur={};
for i = 1:nPastFeatures
    for j = 1:nPastFeatures
        if strcmp(PastSelectedFeatures(i),PastSelectedFeatures(j)) == 0
            FeatCoocur(i,j) = strcat(PastSelectedFeatures(i),PastSelectedFeatures(j));
        end
    end
end


%feature nodes
hairColor = 2; % 5
hairStyle = 3; % 3
sex = 4; % 2
eyeColor = 5; % 2
facialHair = 6; % 5
mouthSize = 7; % 2
hat = 31; % 2
glasses = 32; % 2
age = 33; % 2
noseSize = 34; % 2
hairTexture = 35; % 3
eyebrowThickness = 36; % 2
earRings = 37; % 2
redCheek = 38; % 2
sadLooking = 39; % 2 

%  %because the characters are mutually exclusive they might actually belong to 1 node. 
%     N = 39;
%     dag = zeros(N,N);
% 
% % define connections from characters to features
%     dag(1:24, 25:39) = 1;
    
    % define sizes of nodes