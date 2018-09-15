% For the features.
% CHange the ones to zeros in the calculateCPTCOOC
%it should only have 1 entry in false inthe co-occurances and 1 entry in truth for the co-occurance; for each character.
%BS = reshape(BlackHairSadLookingCPT,[14,8]) To obtain the truth and false
%for the blackhairSadlooking..such that there indeed 1 false 1 true entry
%for each character.
%Then multiply by the probabilities for the characters >?
function [HairCPT,  HairStyleCPT, SexCPT, EyesColorCPT, FacialHairCPT, HatCPT, ...
 GlassesCPT, NoseSizeCPT, HairTextureCPT, EyebrowThicknessCPT, RedCheekCPT, ...
MouthSizeCPT, SadLookingCPT] = calculateCPTFEAT(fsize, cooc_names, cooc_prob)

  d = load('Data/board.mat');
  featlist = d.gameboard;

  [BlackHairSadLookingCPT,BrownHairBigMouthCPT,BlondeHairRedCheekCPT, ...
          ThickEyebrowRedHairCPT,CurlyHairShortHairCPT,MaleWavyHairCPT, ...
          BrownEyesStraightHairCPT, FacialHairBigNoseCPT, HatGlassesCPT, ...
          BrownEyesFacialHairCPT] = calculateCPTCOOC(1);

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

    BkH = 0;
    BrH = 0;
    BlH = 0;
    RdH = 0;
    ShH = 0;
    LoH = 0;
    MaS = 0;
    FeS = 0;
    BlE = 0;
    BrE = 0;
    FH = 0;
    NoFH = 0;
    Ht = 0;
    NoHt = 0;
    Gl = 0;
    NoGl = 0;
    BiNo = 0;
    SmNo = 0;
    ThkEB = 0;
    NThkEB = 0;
    RdCh = 0;
    NRdCh = 0;
    BgMt = 0;
    SmMt = 0;
    SdLk = 0;
    NSdLk = 0;

    % Probabilities of features should be combined with the ones of the
    % features, and there should be length(cooc) * nodesize(feat) values.
    HairCPT = [BlackHairSadLookingCPT * BkH, BrownHairBigMouthCPT * BrH, ...
               BlondeHairRedCheekCPT * BlH, ThickEyebrowRedHairCPT * RdH];
    HairStyleCPT = [CurlyHairShortHairCPT * ShH, LoH];
    SexCPT = [MaleWavyHairCPT * MaS, FeS];
    EyesColorCPT = [BlE, BrownEyesStraightHairCPT * BrownEyesFacialHairCPT * BrE];
    FacialHairCPT = [FacialHairBigNoseCPT * BrownEyesFacialHairCPT * FH, NoFH];
    HatCPT = [NoHt, Ht * HatGlassesCPT];
    GlassesCPT = [NoGl, Gl * HatGlassesCPT];
    NoseSizeCPT = [BiNo * FacialHairBigNoseCPT, SmNo];
    HairTextureCPT = [BrownEyesStraightHairCPT * StH, MaleWavyHairCPT * WvH, CurlyHairShortHairCPT * CuH];
    EyebrowThicknessCPT = [ThkEB * ThickEyebrowRedHairCPT, NThkEB];
    RedCheekCPT = [RdCh * BlondeHairRedCheekCPT, NRdCh];
    MouthSizeCPT = [BgMt * BrownHairBigMouthCPT, SmMt];
SadLookingCPT = [SdLk * BlackHairSadLookingCPT, NSdLk];

end
