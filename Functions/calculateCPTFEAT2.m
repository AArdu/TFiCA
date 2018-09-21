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
