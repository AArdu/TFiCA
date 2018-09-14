% For the features.
% CHange the ones to zeros in the calculateCPTCOOC
%it should only have 1 entry in false inthe co-occurances and 1 entry in truth for the co-occurance; for each character.
%BS = reshape(BlackHairSadLookingCPT,[14,8]) To obtain the truth and false
%for the blackhairSadlooking..such that there indeed 1 false 1 true entry
%for each character.
%Then multiply by the probabilities for the characters >?
function feat_CPTs = calculateCPTFEAT(fsize, cooc_names, cooc_prob)

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

end
