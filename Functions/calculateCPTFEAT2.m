% For the features.
% CHange the ones to zeros in the calculateCPTCOOC
%it should only have 1 entry in false inthe co-occurances and 1 entry in truth for the co-occurance; for each character.
%BS = reshape(BlackHairSadLookingCPT,[14,8]) To obtain the truth and false
%for the blackhairSadlooking..such that there indeed 1 false 1 true entry
%for each character.
%Then multiply by the probabilities for the characters >?
function [BlackHair, BrownHair,BlondeHair, RedHair, ShortHair, Male, BrownEyes, FacialHair, Hat,Glasses, BigNose, StraightHair, WavyHair, CurlyHair, ThickEyebrow...
    RedCheek, BigMouth, SadLooking] = calculateCPTFEAT2() %calculateCPTFEAT(fsize, cooc_names, cooc_prob, character_table)
%incl table for which character are still true? -> character_table
d = load('Data/board.mat');
featlist = d.gameboard;

character_table = ones(1,14)* (1/14);
probabilities_features = [0.2857142857	0.2142857143	0.2857142857	...
    0.2142857143	0.8571428571	0.7142857143	0.6428571429	0.3571428571...
    0.2857142857	0.1428571429	0.2857142857	0.5	0.1428571429	0.3571428571...
    0.1428571429	0.2142857143	0.4285714286	0.2142857143; 0.7142857143...
    0.7857142857	0.7142857143	0.7857142857	0.1428571429	0.2857142857...
    0.3571428571	0.6428571429	0.7142857143	0.8571428571	0.7142857143...
    0.5	0.8571428571	0.6428571429	0.8571428571	0.7857142857...
    0.5714285714	0.7857142857];
[BlackHairSadLookingCPT,BrownHairBigMouthCPT,BlondeHairRedCheekCPT, ...
    ThickEyebrowRedHairCPT,CurlyHairShortHairCPT,MaleWavyHairCPT, ...
    BrownEyesStraightHairCPT, FacialHairBigNoseCPT, HatGlassesCPT, ...
    BrownEyesFacialHairCPT] = calculateCPTCOOC(1)

BlackHairSadLookingCPT = reshape(BlackHairSadLookingCPT, [14,8]);
BrownHairBigMouthCPT = reshape(BrownHairBigMouthCPT, [14,8]);
BlondeHairRedCheekCPT = reshape(BlondeHairRedCheekCPT, [14,8]);
ThickEyebrowRedHairCPT = reshape(ThickEyebrowRedHairCPT, [14,8]);
CurlyHairShortHairCPT = reshape(CurlyHairShortHairCPT, [14,8]);
MaleWavyHairCPT = reshape(MaleWavyHairCPT, [14,8]);
BrownEyesStraightHairCPT = reshape(BrownEyesStraightHairCPT, [14,8]);
FacialHairBigNoseCPT = reshape(FacialHairBigNoseCPT, [14,8]);
HatGlassesCPT = reshape(HatGlassesCPT, [14,8]);
BrownEyesFacialHairCPT = reshape(BrownEyesFacialHairCPT, [14,8]);

%Obtaining Blackhair. -> check cooc for second and fourth entry. check
%character_table for the probabilities of each of the characters.

BlackHair = zeros(28,2);
BrownHair = zeros(28,2);
BlondeHair = zeros(28,2);
RedHair = zeros(28,2);
ShortHair = zeros(28,2);
Male = zeros(28,2);
BrownEyes = zeros(28,2);
FacialHair = zeros(28,2);
Hat = zeros(28,2);
Glasses = zeros(28,2);
BigNose = zeros(28,2);
StraightHair = zeros(28,2);
WavyHair = zeros(28,2);
CurlyHair = zeros(28,2);
ThickEyebrow = zeros(28,2);
RedCheek = zeros(28,2);
BigMouth = zeros(28,2);
SadLooking = zeros(28,2);


for i=1:28
    if i ~=14 && i ~=28
        char_idx = mod(i,14); %which character are we looking at
    else
        char_idx=14;
    end
    %character * co-occurance * feature . 1/14 * F * F
    if i <15
        BlackHair(i,1) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,2) .* probabilities_features(2,1) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,4) .* probabilities_features(2,1);
        BlackHair(i,2) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,2) .* probabilities_features(1,1) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,4) .* probabilities_features(1,1);
        BrownHair(i,1) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,2) .* probabilities_features(2,2) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,4) .* probabilities_features(2,2);
        BrownHair(i,2) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,2) .* probabilities_features(1,2) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,4) .* probabilities_features(1,2);
        BlondeHair(i,1) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,2) .* probabilities_features(2,3) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,4) .* probabilities_features(2,3); %BLONDEHAIR => feat column 3.
        BlondeHair(i,2) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,2) .* probabilities_features(1,3) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,4) .* probabilities_features(1,3);
        RedHair(i,1) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,2) .* probabilities_features(2,4) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,4) .* probabilities_features(2,4); %BLONDEHAIR => feat column 3.
        RedHair(i,2) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,2) .* probabilities_features(1,4) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,4) .* probabilities_features(1,4);
        ShortHair(i,1) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,2) .* probabilities_features(2,5) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,4) .* probabilities_features(2,5);
        ShortHair(i,2) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,2) .* probabilities_features(1,5) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,4) .* probabilities_features(1,5);
        Male(i,1) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,2) .* probabilities_features(2,6) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,4) .* probabilities_features(2,6);
        Male(i,2) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,2) .* probabilities_features(1,6) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,4) .* probabilities_features(1,6);
        BrownEyes(i,1) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,2) .* probabilities_features(2,7) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,4) .* probabilities_features(2,7) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,2) .* probabilities_features(2,7) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,4) .* probabilities_features(2,7)  ;
        BrownEyes(i,2) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,2) .* probabilities_features(1,7) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,4) .* probabilities_features(1,7) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,2) .* probabilities_features(1,7) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,4) .* probabilities_features(1,7);
        FacialHair(i,1) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,2) .* probabilities_features(2,8) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,4) .* probabilities_features(2,8) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,3) .* probabilities_features(2,8) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,4) .* probabilities_features(2,8)  ;
        FacialHair(i,2) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,2) .* probabilities_features(1,8) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,4) .* probabilities_features(1,8) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,3) .* probabilities_features(1,8) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,4) .* probabilities_features(1,8);
        Hat(i,1) = character_table(char_idx) .* HatGlassesCPT(char_idx,2) .* probabilities_features(2,9) +  character_table(char_idx) .* HatGlassesCPT(char_idx,4) .* probabilities_features(2,9);
        Hat(i,2) = character_table(char_idx) .* HatGlassesCPT(char_idx,2) .* probabilities_features(1,9) +  character_table(char_idx) .* HatGlassesCPT(char_idx,4) .* probabilities_features(1,9);
        Glasses(i,1) = character_table(char_idx) .* HatGlassesCPT(char_idx,3) .* probabilities_features(2,10) +  character_table(char_idx) .* HatGlassesCPT(char_idx,4) .* probabilities_features(2,10);
        Glasses(i,2) = character_table(char_idx) .* HatGlassesCPT(char_idx,3) .* probabilities_features(1,10) +  character_table(char_idx) .* HatGlassesCPT(char_idx,4) .* probabilities_features(1,10);
        BigNose(i,1) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,3) .* probabilities_features(2,11) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,4) .* probabilities_features(2,11);
        BigNose(i,2) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,3) .* probabilities_features(1,11) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,4) .* probabilities_features(1,11);
        StraightHair(i,1) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,3) .* probabilities_features(2,12) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,4) .* probabilities_features(2,12);
        StraightHair(i,2) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,3) .* probabilities_features(1,12) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,4) .* probabilities_features(1,12);
        WavyHair(i,1) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,3) .* probabilities_features(2,13) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,4) .* probabilities_features(2,13);
        WavyHair(i,2) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,3) .* probabilities_features(1,13) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,4) .* probabilities_features(1,13);
        CurlyHair(i,1) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,3) .* probabilities_features(2,14) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,4) .* probabilities_features(2,14);
        CurlyHair(i,2) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,3) .* probabilities_features(1,14) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,4) .* probabilities_features(1,14);
        ThickEyebrow(i,1) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,3) .* probabilities_features(2,15) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,4) .* probabilities_features(2,15);
        ThickEyebrow(i,2) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,3) .* probabilities_features(1,15) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,4) .* probabilities_features(1,15);
        RedCheek(i,1) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,3) .* probabilities_features(2,16) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,4) .* probabilities_features(2,16);
        RedCheek(i,2) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,3) .* probabilities_features(1,16) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,4) .* probabilities_features(1,16);
        BigMouth(i,1) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,3) .* probabilities_features(2,17) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,4) .* probabilities_features(2,17);
        BigMouth(i,2) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,3) .* probabilities_features(1,17) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,4) .* probabilities_features(1,17);
        SadLooking(i,1) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,3) .* probabilities_features(2,18) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,4) .* probabilities_features(2,18);
        SadLooking(i,2) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,3) .* probabilities_features(1,18) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,4) .* probabilities_features(1,18);
        
    else
        BlackHair(i,1) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,6) .* probabilities_features(2,1) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,8) .* probabilities_features(2,1);
        BlackHair(i,2) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,6) .* probabilities_features(1,1) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,8) .* probabilities_features(1,1);
        BrownHair(i,1) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,6) .* probabilities_features(2,2) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,8) .* probabilities_features(2,2);
        BrownHair(i,2) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,6) .* probabilities_features(1,2) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,8) .* probabilities_features(1,2);
        BlondeHair(i,1) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,6) .* probabilities_features(2,3) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,8) .* probabilities_features(2,3); %BLONDEHAIR => feat column 3.
        BlondeHair(i,2) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,6) .* probabilities_features(1,3) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,8) .* probabilities_features(1,3);
        RedHair(i,1) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,6) .* probabilities_features(2,4) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,8) .* probabilities_features(2,4); %BLONDEHAIR => feat column 3.
        RedHair(i,2) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,6) .* probabilities_features(1,4) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,8) .* probabilities_features(1,4);
        ShortHair(i,1) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,6) .* probabilities_features(2,5) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,8) .* probabilities_features(2,5);
        ShortHair(i,2) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,6) .* probabilities_features(1,5) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,8) .* probabilities_features(1,5);
        Male(i,1) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,6) .* probabilities_features(2,6) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,8) .* probabilities_features(2,6);
        Male(i,2) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,6) .* probabilities_features(1,6) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,8) .* probabilities_features(1,6);
        BrownEyes(i,1) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,6) .* probabilities_features(2,7) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,8) .* probabilities_features(2,7) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,2) .* probabilities_features(2,7) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,8) .* probabilities_features(2,7)  ;
        BrownEyes(i,2) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,6) .* probabilities_features(1,7) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,8) .* probabilities_features(1,7) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,6) .* probabilities_features(1,7) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,8) .* probabilities_features(1,7);
        FacialHair(i,1) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,6) .* probabilities_features(2,8) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,8) .* probabilities_features(2,8) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,7) .* probabilities_features(2,8) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,8) .* probabilities_features(2,8)  ;
        FacialHair(i,2) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,6) .* probabilities_features(1,8) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,8) .* probabilities_features(1,8) + ...
            character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,7) .* probabilities_features(1,8) +  character_table(char_idx) .* BrownEyesFacialHairCPT(char_idx,8) .* probabilities_features(1,8);
        Hat(i,1) = character_table(char_idx) .* HatGlassesCPT(char_idx,6) .* probabilities_features(2,9) +  character_table(char_idx) .* HatGlassesCPT(char_idx,8) .* probabilities_features(2,9);
        Hat(i,2) = character_table(char_idx) .* HatGlassesCPT(char_idx,6) .* probabilities_features(1,9) +  character_table(char_idx) .* HatGlassesCPT(char_idx,8) .* probabilities_features(1,9);
        Glasses(i,1) = character_table(char_idx) .* HatGlassesCPT(char_idx,7) .* probabilities_features(2,10) +  character_table(char_idx) .* HatGlassesCPT(char_idx,8) .* probabilities_features(2,10);
        Glasses(i,2) = character_table(char_idx) .* HatGlassesCPT(char_idx,7) .* probabilities_features(1,10) +  character_table(char_idx) .* HatGlassesCPT(char_idx,8) .* probabilities_features(1,10);
        BigNose(i,1) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,7) .* probabilities_features(2,11) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,8) .* probabilities_features(2,11);
        BigNose(i,2) = character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,7) .* probabilities_features(1,11) +  character_table(char_idx) .* FacialHairBigNoseCPT(char_idx,8) .* probabilities_features(1,11);
        StraightHair(i,1) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,7) .* probabilities_features(2,12) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,8) .* probabilities_features(2,12);
        StraightHair(i,2) = character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,7) .* probabilities_features(1,12) +  character_table(char_idx) .* BrownEyesStraightHairCPT(char_idx,8) .* probabilities_features(1,12);
        WavyHair(i,1) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,7) .* probabilities_features(2,13) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,8) .* probabilities_features(2,13);
        WavyHair(i,2) = character_table(char_idx) .* MaleWavyHairCPT(char_idx,7) .* probabilities_features(1,13) +  character_table(char_idx) .* MaleWavyHairCPT(char_idx,8) .* probabilities_features(1,13);
        CurlyHair(i,1) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,7) .* probabilities_features(2,14) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,8) .* probabilities_features(2,14);
        CurlyHair(i,2) = character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,7) .* probabilities_features(1,14) +  character_table(char_idx) .* CurlyHairShortHairCPT(char_idx,8) .* probabilities_features(1,14);
        ThickEyebrow(i,1) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,7) .* probabilities_features(2,15) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,8) .* probabilities_features(2,15);
        ThickEyebrow(i,2) = character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,7) .* probabilities_features(1,15) +  character_table(char_idx) .* ThickEyebrowRedHairCPT(char_idx,8) .* probabilities_features(1,15);
        RedCheek(i,1) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,7) .* probabilities_features(2,16) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,8) .* probabilities_features(2,16);
        RedCheek(i,2) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,7) .* probabilities_features(1,16) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,8) .* probabilities_features(1,16);
        BigMouth(i,1) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,7) .* probabilities_features(2,17) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,8) .* probabilities_features(2,17);
        BigMouth(i,2) = character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,7) .* probabilities_features(1,17) +  character_table(char_idx) .* BrownHairBigMouthCPT(char_idx,8) .* probabilities_features(1,17);
        SadLooking(i,1) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,7) .* probabilities_features(2,18) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,8) .* probabilities_features(2,18);
        SadLooking(i,2) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,7) .* probabilities_features(1,18) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,8) .* probabilities_features(1,18);
    end
end

%calculate Hair Feature
%only sum of values in second column?
truthblackhair = sum(BlackHair(:,2));
truthbrownhair = sum(BrownHair(:,2));
truthblondehair = sum(BlondeHair(:,2));
truthredhair = sum(RedHair(:,2));

Hair = truthblackhair + truthbrownhair + truthblondehair + truthredhair;
Hair = [1 - truthblackhair, truthblackhair; 1 - truthbrownhair, truthbrownhair; 1 - truthblondehair, truthblondehair; 1-truthredhair, truthredhair]; 
HairStyle = [1 - sum(ShortHair(:,2)), sum(ShortHair(:,2))] ;
Sex = [1-sum(Male(:,2)), sum(Male(:,2))];
Eyecolor= [1-sum(BrownEyes(:,2)), sum(BrownEyes(:,2))];
Facialhair = [1-sum(FacialHair(:,2)),sum(FacialHair(:,2))];
hasHat = [1-sum(Hat(:,2)), sum(Hat(:,2))];
hasGlasses = [1-sum(Glasses(:,2)), sum(Glasses(:,2))]; 
NoseSize = [1-sum(BigNose(:,2)), sum(BigNose(:,2))];

truthstraighthair = sum(StraightHair(:,2));
truthwavyhair = sum(WavyHair(:,2));
truthcurlyhair = sum(CurlyHair(:,2));
HairTexture = [1-truthstraighthair, truthstraighthair; 1- truthwavyhair, truthwavyhair; 1- truthcurlyhair, truthcurlyhair];
EyebrowThickness = [1-sum(ThickEyebrow(:,2)),sum(ThickEyebrow(:,2))];
RedCheeks = [1-sum(RedCheek(:,2)), sum(RedCheek(:,2))];
MouthSize = [1-sum(BigMouth(:,2)), sum(BigMouth(:,2))];
isSadLooking = [1-sum(SadLooking(:,2)), sum(SadLooking(:,2))];
% feat_CPTs= [BlackHair, BrownHair,BlondeHair, RedHair, ShortHair, Male, BrownEyes, FacialHair, Hat,Glasses, BigNose, StraightHair, WavyHair, CurlyHair, ThickEyebrow...
%     RedCheek, BigMouth, SadLooking];


end
