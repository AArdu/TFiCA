function FeatCoocur = create_BN()

%character node
charac_N=1;

%past selected features
%Should have each specific feature like BrownHair e.g. 
%Is not mutually exclusive!
%Should have a decay parameter that decays the values over time. this can
%actually be done in the update part of the code
load('./Data/initialGameboard.mat')

PastFeat= initialGameboard(1,2:end);
nPastFeatures = length(PastFeat);
features_past = [2:nPastFeatures+1];
PastSelectedFeatures = containers.Map(strcat('Past',PastFeat),features_past);

%Past feature creation
% PastBlackHair
% PastBrownHair
% PastBlondeHair
% PastRedHair
% PastGrayHair
% PastShortHair
% PastLongHair
% PastBald
% PastMale
% PastFemale
% PastBlueEyes
% PastBrownEyes
% PastNoFacialHair
% PastMustache
% PastBeard
% PastMustacheBeard
% PastGoatee
% PastYoung
% PastOld
% PastHat
% PastGlasses
% PastBigNose
% PastSmallNose
% PastStraightHair
% PastWavyHair
% PastCurlyHair
% PastThickEyebrow
% PastRedCheek
% PastBigMouth
% PastSmallMouth
% PastSadLooking




%feature coocurrences
FeatCoocur={};
for i = 1:nPastFeatures
    for j = 1:nPastFeatures
        if ((i < j) && (strcmp(PastFeat(i),PastFeat(j)) == 0)) && (ugly_strcomp_bools(PastFeat(i),PastFeat(j)))
            
            FeatCoocur{end+1} = strcat(char(PastFeat(i)),char(PastFeat(j)));
            %FeatCoocur{end+1} = ugly_strcomp(PastSelectedFeatures(i),PastSelectedFeatures(j));
        end
    end
end

%feature cooccurence nodes 
count = [nPastFeatures+2:length(FeatCoocur)+nPastFeatures+1];
FeatCoocur=containers.Map(FeatCoocur, count);
% BlackHairShortHair
% BlackHairLongHair
% BlackHairBald
% BlackHairMale
% BlackHairFemale
% BlackHairBlueEyes
% BlackHairBrownEyes



%feature nodes
HairColor = (nPastFeatures+length(FeatCoocur)+2); % 5
HairStyle = (nPastFeatures+length(FeatCoocur)+3); % 3
Sex = (nPastFeatures+length(FeatCoocur)+4); % 2
EyeColor =(nPastFeatures+length(FeatCoocur)+5); % 2
FacialHair = (nPastFeatures+length(FeatCoocur)+6); % 5
MouthSize = (nPastFeatures+length(FeatCoocur)+7); % 2
Hat = (nPastFeatures+length(FeatCoocur)+8); % 2
Glasses = (nPastFeatures+length(FeatCoocur)+9);% 2
Age = (nPastFeatures+length(FeatCoocur)+10); % 2
NoseSize = (nPastFeatures+length(FeatCoocur)+11); % 2
HairTexture = (nPastFeatures+length(FeatCoocur)+12); % 3
EyebrowThickness = (nPastFeatures+length(FeatCoocur)+13); % 2
%EarRings = 37; % 2
RedCheek = (nPastFeatures+length(FeatCoocur)+14); % 2
SadLooking = (nPastFeatures+length(FeatCoocur)+15);% 2 

%Make BN
numbertotalnodes = (nPastFeatures+length(FeatCoocur)+15);
dag = zeros(numbertotalnodes,numbertotalnodes);
keys_in_past= keys(PastSelectedFeatures);
keys_in_cooccur= keys(FeatCoocur);
for i=1:length(keys_in_past)
    dag(charac_N, keys_in_cooccur(i))=1;
end
dag(charac_N, FeatCoocur)=1
dag(charac_N, EyeColor)=1
dag(charac_N,keys_in_past{1,:})=1

%  %because the characters are mutually exclusive they might actually belong to 1 node. 
%     N = 39;
%     dag = zeros(N,N);
% 
% % define connections from characters to features
%     dag(1:24, 25:39) = 1;
    
    % define sizes of nodes