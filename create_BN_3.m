function [featcoocureNames,count, dag]= create_BN_3()

%character node
charac_N=1; %Nodesize is 14

%past selected features
%Should have each specific feature like BrownHair e.g. 
%Is not mutually exclusive!
%Should have a decay parameter that decays the values over time. this can
%actually be done in the update part of the code
% load('./Data/initialGameboard.mat')
% 
% PastFeat= initialGameboard(1,2:end);
% nPastFeatures = length(PastFeat);
% features_past = [2:nPastFeatures+1];
% PastSelectedFeatures = containers.Map(strcat('Past',PastFeat),features_past);

%Past feature creation
PastBrownHair=2;
PastRedHair=3;
PastLongHair=4;
PastFemale=5;
PastBrownEyes=6;
PastMustache=7;
PastBeard=8;
PastMustacheBeard=9;
PastGlasses=10;
PastBigNose=11;
PastSmallNose=12;
PastCurlyHair=13;
PastRedCheek=14;
PastBigMouth=15;
PastSadLooking=16;

%feature coocurrences
MustacheBigMouth=17;
LongHairCurlyHair=18;
GlassesRedCheek=19;
SmallNoseSadLooking=20;
BeardBigMouth=21;
RedHairSadLooking=22;
MustacheBeardSadLooking=23;
BrownHairSadLooking=24;
FemaleGlasses=25;
BrownEyesBigNose=26;

% FeatCoocur={};
% for i = 1:nPastFeatures
%     for j = 1:nPastFeatures
%         if ((i < j) && (strcmp(PastFeat(i),PastFeat(j)) == 0)) && (ugly_strcomp_bools(PastFeat(i),PastFeat(j)))
%             
%             FeatCoocur{end+1} = strcat(char(PastFeat(i)),char(PastFeat(j)));
%             %FeatCoocur{end+1} = ugly_strcomp(PastSelectedFeatures(i),PastSelectedFeatures(j));
%         end
%     end
% end
% featcoocureNames=FeatCoocur;
% %feature cooccurence nodes 
% count = [nPastFeatures+2:length(FeatCoocur)+nPastFeatures+1];
% FeatCoocur=containers.Map(FeatCoocur, count);



%feature nodes
HairColor = 27;%(nPastFeatures+length(FeatCoocur)+2); % 4 => 130 
HairStyle = 28;%(nPastFeatures+length(FeatCoocur)+3); % 2 => 
Sex = 29;%(nPastFeatures+length(FeatCoocur)+4); % 2
EyeColor = 30;%(nPastFeatures+length(FeatCoocur)+5); % 2
FacialHair = 31;%(nPastFeatures+length(FeatCoocur)+6); % 4
MouthSize = 32;%(nPastFeatures+length(FeatCoocur)+7); % 2
Hat = 33;%(nPastFeatures+length(FeatCoocur)+8); % 2
Glasses = 34;%(nPastFeatures+length(FeatCoocur)+9);% 2
%Age = (nPastFeatures+length(FeatCoocur)+10); % 2
NoseSize = 35;%(nPastFeatures+length(FeatCoocur)+10); % 2
HairTexture = 36;%(nPastFeatures+length(FeatCoocur)+11); % 3
EyebrowThickness = 37;%(nPastFeatures+length(FeatCoocur)+12); % 2
%EarRings = 37; % 2
RedCheek = 38;%(nPastFeatures+length(FeatCoocur)+13); % 2
SadLooking = 39;%(nPastFeatures+length(FeatCoocur)+14);% 2 

allNames=['Characters','PastBrownHair','PastRedHair','PastLongHair','PastFemale','PastBrownEyes','PastMustache','PastBeard',...
    'PastMustacheBeard','PastGlasses','PastBigNose','PastSmallNose','PastCurlyHair','PastRedCheek','PastBigMouth',...
    'PastSadLooking','MustacheBigMouth','LongHairCurlyHair','GlassesRedCheek','SmallNoseSadLooking','BeardBigMouth',...
'RedHairSadLooking','MustacheBeardSadLooking','BrownHairSadLooking','FemaleGlasses','BrownEyesBigNose', 'HairColor', 'HairStyle', 'Sex',...
'EyeColor', 'FacialHair','MouthSize','Hat', 'Glasses', 'NoseSize', 'HairTexture', 'EyebrowThickness','RedCheek', 'SadLooking' ] 

%Make BN
%uncomment later
numbertotalnodes = 39;
dag = zeros(numbertotalnodes,numbertotalnodes);
dag(1, 17:39)=1;
dag(2, 24)=1;
dag(3, 22)=1;
dag(4, 18)=1;
dag(5, 25)=1;
dag(6, 26)=1;
dag(7, 17)=1;
dag(8, 21)=1;
dag(9, 23)=1;
dag(10, [19,25])=1;
dag(11, 26)=1;
dag(12, 20)=1;
dag(13, 18)=1;
dag(14, 19)=1;
dag(15, [17,21])=1;
dag(16, [20,22,23,24])=1;
% dag(2, 33:58)=1;
% dag(3, 59:84)=1;
% dag(4, 85:110)=1;
% dag(5, 111:136)=1;
% dag(6, 137:162)=1;
% dag(7, [33,59,85,111,137,163:185])=1;
% dag(8, [34,60,86,112,138,186:208])=1;
% dag(9, [35,61,87,113,139,209:231])=1;
% dag(10, [36,62,88,114,140,163,186,209,232:252])=1;
% dag(11, [37,63,89,115,141,164,187,210,253:273]) = 1;
% dag(12, [38,64,90,116,142,165,188,211,232,253,274:292]) =1;
% dag(13, [39,65,91,117,143,166,189,212,233,254,293:311]) =1;
% dag(14, [40,66,92,118,144,167,190,213,234,255,274,293,312:325])=1;
% dag(15, [41,67,93,119,145,168,191,214,235,256,275,294,326:339])=1;
% dag(16, [42,68,94,120,146,169,192,215,236,257,276,295,340:353])=1;
% dag(17, [43,69,95,121,147,170,193,216,237,258,277,296,354:367])=1;
% dag(18, [44,70,96,122,148,171,194,217,238,259,278,297,368:381])=1;
% dag(19, [45,71,97,123,149,172,195,218,239,260,279,298,354,368,382:394])=1;
% dag(20, [46,72,98,124,150,173,196,219,240,261,280,299,355,369,382,395:406])=1;
% dag(21, [47,73,99,125,151,174,197,220,241,262,281,300,356,370,383,395,407:416])=1;
% dag(22, [48,74,100,126,152,175,198,221,242,263,282,301,357,371,384,396,417:426])=1;
% dag(23, [49,75,101,127,153,176,199,222,243,264,283,302,358,372,385,397,407,417,427:434])=1;
% dag(24, [50,76,102,128,154,177,200,223,244,265,284,303,359,373,386,398,408,418,435:442]) =1;
% dag(25, [51,77,103,129,155,178,201,224,245,266,285,304,360,374,387,399,409,419,427,435,443:447])=1;
% dag(26, [52,78,104,130,157,179,202,225,246,267,286,305,361,375,388,400,410,420,428,436,448:452])=1;
% dag(27, [53,79,105,131,158,180,203,226,247,268,287,306,362,376,389,401,411,421,429,437,453:457])=1;
% dag(28, [54,80,106,132,159,181,204,227,248,269,288,307,363,377,390,402,412,422,430,438,443,448,453,458:461])=1;
% dag(29, [55,81,107,133,160,182,205,228,249,270,289,308,364,378,391,403,413,423,431,439,444,449,454,458,462:464])=1;
% dag(30, [56,82,108,134,161,183,206,229,250,271,290,309,365,379,392,404,414,424,432,440,445,450,455,459,462,465])=1;
% dag(31, [57,83,109,135,162,184,207,230,251,272,291,310,366,380,393,405,415,425,433,441,446,451,456,460,463,466])=1;
% dag(32, [58,84,110,136,163,185,208,231,252,273,292,311,367,381,394,406,416,426,434,442,447,452,457,461,464,466])=1;
% dag(33, [HairColor, HairStyle])=1;
% dag(34, [HairColor, HairStyle])=1;
% %Setting connections for characters to feature layer
% dag(charac_N, HairColor)=1;
% dag(charac_N, HairStyle)=1;
% dag(charac_N, Sex)=1;
% dag(charac_N, EyeColor)=1;
% dag(charac_N, FacialHair)=1;
% dag(charac_N, MouthSize)=1;
% dag(charac_N, Hat)=1;
% dag(charac_N, Age)=1;
% dag(charac_N, NoseSize)=1;
% dag(charac_N, HairTexture)=1;
% dag(charac_N, EyebrowThickness)=1;
% dag(charac_N, RedCheek)=1;
% dag(charac_N, SadLooking)=1;



% uncomment these things at a later stage:
% character_size=14;
% ns_PastFeat = 2*ones(1, nPastFeatures);
% ns_FeatCooccur = 2*ones(1, length(featcoocureNames));
% ns_features = [5, 3, 2,  2,  5, 2,  2,  2,  2, 2, 3, 2, 2, 2, 2];
% node_sizes = [character_size, ns_PastFeat, ns_FeatCooccur, ns_features];


%  %because the characters are mutually exclusive they might actually belong to 1 node. 
%     N = 39;
%     dag = zeros(N,N);
% 
% % define connections from characters to features
%     dag(1:24, 25:39) = 1;
    
    % define sizes of nodes
end