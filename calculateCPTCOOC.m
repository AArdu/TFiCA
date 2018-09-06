function [BlackHairSadLookingCPT,BrownHairBigMouthCPT,BlondeHairRedCheekCPT, ...
          ThickEyebrowRedHairCPT,CurlyHairShortHairCPT,MaleWavyHairCPT, ...
          BrownEyesStraightHairCPT, FacialHairBigNoseCPT, HatGlassesTabCPT, ...
          BrownEyesFacialHairCPT] = calculateCPTCOOC()

  d = load('./Data/board.mat');
  featlist = d.gameboard;

  % Indices of features for T and F values
  blackhairtrue           = find(featlist(1:end, 1) == 1);
  blackhairfalse          = find(featlist(1:end, 1) == 0);
  brownhairtrue           = find(featlist(1:end, 2) == 1);
  brownhairfalse          = find(featlist(1:end, 2) == 0);
  blondehairtrue          = find(featlist(1:end, 3) == 1);
  blondehairfalse         = find(featlist(1:end, 3) == 0);
  redhairtrue             = find(featlist(1:end, 4) == 1);
  redhairfalse            = find(featlist(1:end, 4) == 0);
  shorthairtrue           = find(featlist(1:end, 5) == 1);
  shorthairfalse          = find(featlist(1:end, 5) == 0);
  sexmaletrue             = find(featlist(1:end, 6) == 1);
  sexmalefalse            = find(featlist(1:end, 6) == 0);
  browneyestrue           = find(featlist(1:end, 7) == 1);
  browneyesfalse          = find(featlist(1:end, 7) == 0);
  facialhairtrue          = find(featlist(1:end, 8) == 1);
  facialhairfalse         = find(featlist(1:end, 8) == 0);
  hattrue                 = find(featlist(1:end, 9) == 1);
  hatfalse                = find(featlist(1:end, 9) == 0);
  glassestrue             = find(featlist(1:end, 10) == 1);
  glassesfalse            = find(featlist(1:end, 10) == 0);
  bignosetrue             = find(featlist(1:end, 11) == 1);
  bignosefalse            = find(featlist(1:end, 11) == 0);
  straighthairtrue        = find(featlist(1:end, 12) == 1);
  straighthairfalse       = find(featlist(1:end, 12) == 0);
  wavyhairtrue            = find(featlist(1:end, 13) == 1);
  wavyhairfalse           = find(featlist(1:end, 13) == 0);
  curlyhairtrue           = find(featlist(1:end, 14) == 1);
  curlyhairfalse          = find(featlist(1:end, 14) == 0);
  thickeyebrowstrue       = find(featlist(1:end, 15) == 1);
  thickeyebrowsfalse      = find(featlist(1:end, 15) == 0);
  redcheektrue            = find(featlist(1:end, 16) == 1);
  redcheekfalse           = find(featlist(1:end, 16) == 0);
  bigmouthtrue            = find(featlist(1:end, 17) == 1);
  bigmouthfalse           = find(featlist(1:end, 17) == 0);
  sadlookingtrue          = find(featlist(1:end, 18) == 1);
  sadlookingfalse         = find(featlist(1:end, 18) == 0);

  % CPTs for co-occurences
  BlackHairSadLookingTab    = [0.5612244898	0.2244897959	0.1530612245	0.0612244898	0.4387755102	0.7755102041	0.8469387755	0.9387755102];
  BrownHairBigMouthTab      = [0.4489795918	0.1224489796	0.3367346939	0.09183673469	0.5510204082	0.8775510204	0.6632653061	0.9081632653];
  BlondeHairRedCheekTab     = [0.5612244898	0.2244897959	0.1530612245	0.0612244898	0.4387755102	0.7755102041	0.8469387755	0.9387755102];
  ThickEyebrowRedHairTab    = [0.4489795918	0.1224489796	0.3367346939	0.09183673469	0.5510204082	0.8775510204	0.6632653061	0.9081632653];
  CurlyHairShortHairTab     = [0.09183673469 0.5510204082	0.05102040816	0.306122449	0.9081632653	0.4489795918	0.9489795918	0.693877551];
  MaleWavyHairTab           = [0.2448979592	0.5510204082	0.05102040816	0.306122449	0.7551020408	0.4489795918	0.9489795918	0.693877551];
  BrownEyesStraightHairTab  = [0.1785714286	0.3214285714	0.1785714286	0.3214285714	0.8214285714	0.6785714286	0.8214285714	0.6785714286];
  FacialHairBigNoseTab      = [0.4591836735	0.2551020408	0.1836734694	0.1020408163	0.5408163265	0.7448979592	0.8163265306	0.8979591837];
  HatGlassesTab             = [0.612244898	0.2448979592	0.1020408163	0.04081632653	0.387755102	0.7551020408	0.8979591837	0.9591836735];
  BrownEyesFacialHairTab    = [0.2295918367	0.4132653061	0.1275510204	0.2295918367	0.7704081633	0.5867346939	0.8724489796	0.7704081633];

  AllTabs = [BlackHairSadLookingTab, BrownHairBigMouthTab, BlondeHairRedCheekTab, ...
             ThickEyebrowRedHairTab, CurlyHairShortHairTab, MaleWavyHairTab, ...
             BrownEyesStraightHairTab, FacialHairBigNoseTab, HatGlassesTab, BrownEyesFacialHairTab];

  % Obtain different CPDs
  function array = calc_cpts(a, b)
      array = [];
      for i = 1:length(a)
         for k = 1:length(b)
             if a(i) == b(k)
                 array(end+1) = a(i);
             end
         end
      end
  end

  % create empty tables
  function [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, ...
            chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty()
    chars_F_F_F = ones(1,14);
    chars_T_F_F = ones(1,14);
    chars_F_T_F = ones(1,14);
    chars_T_T_F = ones(1,14);
    chars_F_F_T = zeros(1,14);
    chars_T_F_T = zeros(1,14);
    chars_F_T_T = zeros(1,14);
    chars_T_T_T = zeros(1,14);
  end


  % BlackHairSadLookingTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(blackhairfalse, sadlookingfalse)) = BlackHairSadLookingTab(1);
  chars_T_F_F(calc_cpts(blackhairtrue, sadlookingfalse))  = BlackHairSadLookingTab(2);
  chars_F_T_F(calc_cpts(blackhairfalse, sadlookingtrue))  = BlackHairSadLookingTab(3);
  chars_T_T_F(calc_cpts(blackhairtrue, sadlookingtrue))   = BlackHairSadLookingTab(4);
  chars_F_F_T(calc_cpts(blackhairfalse, sadlookingfalse)) = BlackHairSadLookingTab(5);
  chars_T_F_T(calc_cpts(blackhairtrue, sadlookingfalse))  = BlackHairSadLookingTab(6);
  chars_F_T_T(calc_cpts(blackhairfalse, sadlookingtrue))  = BlackHairSadLookingTab(7);
  chars_T_T_T(calc_cpts(blackhairtrue, sadlookingtrue))   = BlackHairSadLookingTab(8);
  BlackHairSadLookingCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % BrownHairBigMouthTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(brownhairfalse, bigmouthfalse))    = BrownHairBigMouthTab(1);
  chars_T_F_F(calc_cpts(brownhairtrue, bigmouthfalse))     = BrownHairBigMouthTab(2);
  chars_F_T_F(calc_cpts(brownhairfalse, bigmouthtrue))     = BrownHairBigMouthTab(3);
  chars_T_T_F(calc_cpts(brownhairtrue, bigmouthtrue))      = BrownHairBigMouthTab(4);
  chars_F_F_T(calc_cpts(brownhairfalse, bigmouthfalse))    = BrownHairBigMouthTab(5);
  chars_T_F_T(calc_cpts(brownhairtrue, bigmouthfalse))     = BrownHairBigMouthTab(6);
  chars_F_T_T(calc_cpts(brownhairfalse, bigmouthtrue))     = BrownHairBigMouthTab(7);
  chars_T_T_T(calc_cpts(brownhairtrue, bigmouthtrue))      = BrownHairBigMouthTab(8);
  BrownHairBigMouthCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % BlondeHairRedCheekTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(blondehairfalse, redcheekfalse))   = BlondeHairRedCheekTab(1);
  chars_T_F_F(calc_cpts(blondehairtrue, redcheekfalse))    = BlondeHairRedCheekTab(2);
  chars_F_T_F(calc_cpts(blondehairfalse, redcheektrue))    = BlondeHairRedCheekTab(3);
  chars_T_T_F(calc_cpts(blondehairtrue, redcheektrue))     = BlondeHairRedCheekTab(4);
  chars_F_F_T(calc_cpts(blondehairfalse, redcheekfalse))   = BlondeHairRedCheekTab(5);
  chars_T_F_T(calc_cpts(blondehairtrue, redcheekfalse))    = BlondeHairRedCheekTab(6);
  chars_F_T_T(calc_cpts(blondehairfalse, redcheektrue))    = BlondeHairRedCheekTab(7);
  chars_T_T_T(calc_cpts(blondehairtrue, redcheektrue))     = BlondeHairRedCheekTab(8);
  BlondeHairRedCheekCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % ThickEyebrowRedHairTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(thickeyebrowsfalse, redhairfalse)) = ThickEyebrowRedHairTab(1);
  chars_T_F_F(calc_cpts(thickeyebrowstrue, redhairfalse))  = ThickEyebrowRedHairTab(2);
  chars_F_T_F(calc_cpts(thickeyebrowsfalse, redhairtrue))  = ThickEyebrowRedHairTab(3);
  chars_T_T_F(calc_cpts(thickeyebrowstrue, redhairtrue))   = ThickEyebrowRedHairTab(4);
  chars_F_F_T(calc_cpts(thickeyebrowsfalse, redhairfalse)) = ThickEyebrowRedHairTab(5);
  chars_T_F_T(calc_cpts(thickeyebrowstrue, redhairfalse))  = ThickEyebrowRedHairTab(6);
  chars_F_T_T(calc_cpts(thickeyebrowsfalse, redhairtrue))  = ThickEyebrowRedHairTab(7);
  chars_T_T_T(calc_cpts(thickeyebrowstrue, redhairtrue))   = ThickEyebrowRedHairTab(8);
  ThickEyebrowRedHairCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % CurlyHairShortHairTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(curlyhairfalse, shorthairfalse))   = CurlyHairShortHairTab(1);
  chars_T_F_F(calc_cpts(curlyhairtrue, shorthairfalse))    = CurlyHairShortHairTab(2);
  chars_F_T_F(calc_cpts(curlyhairfalse, shorthairtrue))    = CurlyHairShortHairTab(3);
  chars_T_T_F(calc_cpts(curlyhairtrue, shorthairtrue))     = CurlyHairShortHairTab(4);
  chars_F_F_T(calc_cpts(curlyhairfalse, shorthairfalse))   = CurlyHairShortHairTab(5);
  chars_T_F_T(calc_cpts(curlyhairtrue, shorthairfalse))    = CurlyHairShortHairTab(6);
  chars_F_T_T(calc_cpts(curlyhairfalse, shorthairtrue))    = CurlyHairShortHairTab(7);
  chars_T_T_T(calc_cpts(curlyhairtrue, shorthairtrue))     = CurlyHairShortHairTab(8);
  CurlyHairShortHairCPT =[chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % MaleWavyHairTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(sexmalefalse, wavyhairfalse))      = MaleWavyHairTab(1);
  chars_T_F_F(calc_cpts(sexmaletrue, wavyhairfalse))       = MaleWavyHairTab(2);
  chars_F_T_F(calc_cpts(sexmalefalse, wavyhairtrue))       = MaleWavyHairTab(3);
  chars_T_T_F(calc_cpts(sexmaletrue, wavyhairtrue))        = MaleWavyHairTab(4);
  chars_F_F_T(calc_cpts(sexmalefalse, wavyhairfalse))      = MaleWavyHairTab(5);
  chars_T_F_T(calc_cpts(sexmaletrue, wavyhairfalse))       = MaleWavyHairTab(6);
  chars_F_T_T(calc_cpts(sexmalefalse, wavyhairtrue))       = MaleWavyHairTab(7);
  chars_T_T_T(calc_cpts(sexmaletrue, wavyhairtrue))        = MaleWavyHairTab(8);
  MaleWavyHairCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % BrownEyesStraightHairTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(browneyesfalse, straighthairfalse))  = BrownEyesStraightHairTab(1);
  chars_T_F_F(calc_cpts(browneyestrue, straighthairfalse))   = BrownEyesStraightHairTab(2);
  chars_F_T_F(calc_cpts(browneyesfalse, straighthairtrue))   = BrownEyesStraightHairTab(3);
  chars_T_T_F(calc_cpts(browneyestrue, straighthairtrue))    = BrownEyesStraightHairTab(4);
  chars_F_F_T(calc_cpts(browneyesfalse, straighthairfalse))  = BrownEyesStraightHairTab(5);
  chars_T_F_T(calc_cpts(browneyestrue, straighthairfalse))   = BrownEyesStraightHairTab(6);
  chars_F_T_T(calc_cpts(browneyesfalse, straighthairtrue))   = BrownEyesStraightHairTab(7);
  chars_T_T_T(calc_cpts(browneyestrue, straighthairtrue))    = BrownEyesStraightHairTab(8);
  BrownEyesStraightHairCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % FacialHairBigNoseTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(facialhairfalse, bignosefalse))      = FacialHairBigNoseTab(1);
  chars_T_F_F(calc_cpts(facialhairtrue, bignosefalse))       = FacialHairBigNoseTab(2);
  chars_F_T_F(calc_cpts(facialhairfalse, bignosetrue))       = FacialHairBigNoseTab(3);
  chars_T_T_F(calc_cpts(facialhairtrue, bignosetrue))        = FacialHairBigNoseTab(4);
  chars_F_F_T(calc_cpts(facialhairfalse, bignosefalse))      = FacialHairBigNoseTab(5);
  chars_T_F_T(calc_cpts(facialhairtrue, bignosefalse))       = FacialHairBigNoseTab(6);
  chars_F_T_T(calc_cpts(facialhairfalse, bignosetrue))       = FacialHairBigNoseTab(7);
  chars_T_T_T(calc_cpts(facialhairtrue, bignosetrue))        = FacialHairBigNoseTab(8);
  FacialHairBigNoseCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % HatGlassesTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(hatfalse, glassesfalse))           = HatGlassesTab(1);
  chars_T_F_F(calc_cpts(hattrue, glassesfalse))            = HatGlassesTab(2);
  chars_F_T_F(calc_cpts(hatfalse, glassestrue))            = HatGlassesTab(3);
  chars_T_T_F(calc_cpts(hattrue, glassestrue))             = HatGlassesTab(4);
  chars_F_F_T(calc_cpts(hatfalse, glassesfalse))           = HatGlassesTab(5);
  chars_T_F_T(calc_cpts(hattrue, glassesfalse))            = HatGlassesTab(6);
  chars_F_T_T(calc_cpts(hatfalse, glassestrue))            = HatGlassesTab(7);
  chars_T_T_T(calc_cpts(hattrue, glassestrue))             = HatGlassesTab(8);
  HatGlassesTabCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T]*(1/14);

  % BrownEyesFacialHairTab
  [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] = obtainempty();

  chars_F_F_F(calc_cpts(browneyesfalse, facialhairfalse))    = BrownEyesFacialHairTab(1);
  chars_T_F_F(calc_cpts(browneyestrue, facialhairfalse))     = BrownEyesFacialHairTab(2);
  chars_F_T_F(calc_cpts(browneyesfalse, facialhairtrue))     = BrownEyesFacialHairTab(3);
  chars_T_T_F(calc_cpts(browneyestrue, facialhairtrue))      = BrownEyesFacialHairTab(4);
  chars_F_F_T(calc_cpts(browneyesfalse, facialhairfalse))    = BrownEyesFacialHairTab(5);
  chars_T_F_T(calc_cpts(browneyestrue, facialhairfalse))     = BrownEyesFacialHairTab(6);
  chars_F_T_T(calc_cpts(browneyesfalse, facialhairtrue))     = BrownEyesFacialHairTab(7);
  chars_T_T_T(calc_cpts(browneyestrue, facialhairtrue))      = BrownEyesFacialHairTab(8);
  BrownEyesFacialHairCPT = [chars_F_F_F,chars_T_F_F,chars_F_T_F, chars_T_T_F, chars_F_F_T, chars_T_F_T, chars_F_T_T, chars_T_T_T] *(1/14);

end
