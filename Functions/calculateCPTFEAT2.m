% For the features.
% CHange the ones to zeros in the calculateCPTCOOC
%it should only have 1 entry in false inthe co-occurances and 1 entry in truth for the co-occurance; for each character.
%BS = reshape(BlackHairSadLookingCPT,[14,8]) To obtain the truth and false
%for the blackhairSadlooking..such that there indeed 1 false 1 true entry
%for each character.
%Then multiply by the probabilities for the characters >?
function feat_CPTs = calculateCPTFEAT(fsize, cooc_names, cooc_prob, character_table)
%incl table for which character are still true? -> character_table
d = load('Data/board.mat');
  featlist = d.gameboard;

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
  SadLookingTrue = zeros(14,1);
  SadLookingFalse = ones(14,1);
  RedCheekTrue = zeros(14,1);
  RedCheeckFalse= ones(14,1);
  MaleTrue=zeros(14,1);
  MaleFalse=ones(14,1);

  BigMouthTrue = zeros(14,1);
  BigMouthFalse=ones(14,1);
  ThickEyebrowTrue=zeros(14,1);
  ThickEyebrowFalse=ones(14,1);
  
%   
%   hf = HatGlassesCPT(:,1:4);
%   maxihf = max(hf,[],2);
%   HatFalse = character_table .* maxihf;
%   ht = HatGlassesCPT(:,5:8);
%   maxihf = max(ht,[],2);
%   HatTrue = character_table .* maxihf;
%   
  
  BlackHair = zeros(28,2);
  BrownHair = zeros(28,2);
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
        BlondeHair(i,1) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,2) .* probabilities_features(2,1) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,4) .* probabilities_features(2,1); %BLONDEHAIR => feat column 3.
        BlondeHair(i,2) = character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,2) .* probabilities_features(1,1) +  character_table(char_idx) .* BlondeHairRedCheekCPT(char_idx,4) .* probabilities_features(1,1);
      else
        BlackHair(i,1) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,6) .* probabilities_features(2,1) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,8) .* probabilities_features(2,1);
        BlackHair(i,2) = character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,6) .* probabilities_features(1,1) +  character_table(char_idx) .* BlackHairSadLookingCPT(char_idx,8) .* probabilities_features(1,1);   
      end
  end
  
  BrownHair = zeros(28,2);
  BlondeHair = zeros(28,2);
  RedHair = zeros(28,2);
  HatTrue = zeros(14,2);
  HatFalse = ones(14,2);
  for i = 1:length(character_table)
      HatFalse(i) = HatGlassesCPT(i,2) + HatGlassesCPT(i,4);
      if (HatFalse(i) == 0)
          HatFalse(i) = 1;
      end
  end  
  for i = 1:length(character_table)
      HatTrue(i) = HatGlassesCPT(i,6) + HatGlassesCPT(i,8);
  end  
  Hat = [HatFalse; HatTrue]
  for i=1:28
      Hat(i,2) = 1 - Hat(i,1);
  end
  %facial hair bignose
  
end
