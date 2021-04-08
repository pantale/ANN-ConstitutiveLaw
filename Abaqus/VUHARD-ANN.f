C **********************************************************************
C Function to compute the ANN : 3-15-7-1-sigmoid yield stress
C **********************************************************************
      subroutine vuhard (
C Read only -
     1     nblock,
     2     nElement, nIntPt, nLayer, nSecPt,
     3     lAnneal, stepTime, totalTime, dt, cmname,
     4     nstatev, nfieldv, nprops,
     5     props, tempOld, tempNew, fieldOld, fieldNew,
     6     stateOld,
     7     eqps, eqpsRate,
C Write only -
     8     yield, dyieldDtemp, dyieldDeqps,
     9     stateNew )
C
      include 'vaba_param.inc'
C
      dimension nElement(nblock),
     1     props(nprops),
     2     tempOld(nblock),
     3     fieldOld(nblock,nfieldv),
     4     stateOld(nblock,nstatev),
     5     tempNew(nblock),
     6     fieldNew(nblock,nfieldv),
     7     eqps(nblock),
     8     eqpsRate(nblock),
     9     yield(nblock),
     1     dyieldDtemp(nblock),
     2     dyieldDeqps(nblock,2),
     3     stateNew(nblock,nstatev)
C
      character*80 cmname
C
      do k = 1, nblock
C xepsp = (eqps(k) - minEntries[0]) / rangeEntries[0]
      xepsp = (eqps(k) - 0.0)/1.0
C xdepsp = (log(depsp/logBase) - minEntries[1]) / rangeEntries[1]
      xdepsp = (log(eqpsRate(k)/1.0) - 0.0)/10.819778284410
C xtemp = (temp - minEntries[2]) / rangeEntries[2]
      xtemp = (tempNew(k) - 20.0)/480.0
C xa = np.exp(-w1.dot(x) - b1)
      xa0 = exp(0.171193018556*xepsp + 0.498235881329*xdepsp -
     +  1.572309255600*xtemp + 0.549710810184)
      xa1 = exp(0.182183891535*xepsp + 0.279642552137*xdepsp -
     +  1.381547451019*xtemp + 1.007667899132)
      xa2 = exp(0.121008850634*xepsp + 0.093622177839*xdepsp +
     +  1.284856081009*xtemp - 1.146428942680)
      xa3 = exp(-0.677952528000*xepsp - 0.785129725933*xdepsp +
     +  3.600407361984*xtemp + 1.056580066681)
      xa4 = exp(8.224933624268*xepsp - 0.102857425809*xdepsp +
     +  1.170001864433*xtemp + 0.834357798100)
      xa5 = exp(0.262212038040*xepsp + 0.370604902506*xdepsp -
     +  1.530593752861*xtemp + 0.557993113995)
      xa6 = exp(-0.363313168287*xepsp - 0.307944297791*xdepsp +
     +  1.739808201790*xtemp + 0.515264987946)
      xa7 = exp(0.171282619238*xepsp + 0.936020970345*xdepsp +
     +  0.700896143913*xtemp + 0.525115251541)
      xa8 = exp(2.934058904648*xepsp - 0.024969343096*xdepsp +
     +  0.818501532078*xtemp - 0.164255663753)
      xa9 = exp(0.298778355122*xepsp + 0.517931699753*xdepsp +
     +  7.580852508545*xtemp + 1.864312648773)
      xa10 = exp(-1.177027940750*xepsp + 0.308994054794*xdepsp +
     +  1.684179663658*xtemp + 0.859441757202)
      xa11 = exp(0.231339216232*xepsp + 0.290423154831*xdepsp -
     +  1.502451419830*xtemp + 1.198348641396)
      xa12 = exp(-235.784103393555*xepsp + 0.099293000996*xdepsp -
     +  0.760096788406*xtemp - 0.819592595100)
      xa13 = exp(23.344444274902*xepsp - 0.164729803801*xdepsp +
     +  0.949119210243*xtemp + 0.500462353230)
      xa14 = exp(-0.329279005527*xepsp - 0.054267201573*xdepsp +
     +  1.555212616920*xtemp + 0.580829739571)
C xb = 1 + xa
      xb0 = 1.0 + xa0
      xb1 = 1.0 + xa1
      xb2 = 1.0 + xa2
      xb3 = 1.0 + xa3
      xb4 = 1.0 + xa4
      xb5 = 1.0 + xa5
      xb6 = 1.0 + xa6
      xb7 = 1.0 + xa7
      xb8 = 1.0 + xa8
      xb9 = 1.0 + xa9
      xb10 = 1.0 + xa10
      xb11 = 1.0 + xa11
      xb12 = 1.0 + xa12
      xb13 = 1.0 + xa13
      xb14 = 1.0 + xa14
C xc = w2.dot(xb) + b2
      xc0 = 0.000755758665/xb0 +
     +  0.348879784346/xb1 -
     +  1.622294902802/xb2 -
     +  1.744126558304/xb3 +
     +  1.189603447914/xb4 +
     +  0.773437738419/xb5 -
     +  1.077992796898/xb6 +
     +  0.195966541767/xb7 +
     +  0.371459305286/xb8 -
     +  2.175866603851/xb9 +
     +  0.267415910959/xb10 +
     +  0.117423757911/xb11 -
     +  1.837396621704/xb12 -
     +  1.631284832954/xb13 -
     +  0.915312469006/xb14 -
     +  0.220450609922
      xc1 =-1.520736217499/xb0 -
     +  0.598750412464/xb1 -
     +  0.567928969860/xb2 +
     +  0.733987450600/xb3 -
     +  1.956816315651/xb4 -
     +  0.990542054176/xb5 -
     +  0.024108286947/xb6 -
     +  0.921862065792/xb7 -
     +  1.585801959038/xb8 -
     +  0.359389543533/xb9 -
     +  0.568457961082/xb10 -
     +  0.462055325508/xb11 +
     +  0.937371969223/xb12 +
     +  0.713293492794/xb13 -
     +  0.270313948393/xb14 -
     +  0.580874204636
      xc2 =-0.263961493969/xb0 +
     +  0.340663641691/xb1 -
     +  1.086898207664/xb2 -
     +  0.190290063620/xb3 +
     +  1.526942133904/xb4 +
     +  0.134074971080/xb5 -
     +  0.458628684282/xb6 -
     +  0.210141628981/xb7 +
     +  0.690639853477/xb8 -
     +  0.559289455414/xb9 -
     +  0.561830639839/xb10 +
     +  0.010643188842/xb11 -
     +  2.779141187668/xb12 +
     +  2.203900575638/xb13 -
     +  0.874182760715/xb14 -
     +  0.327307760715
      xc3 =-1.667145609856/xb0 -
     +  1.261272549629/xb1 -
     +  1.568691968918/xb2 -
     +  1.300865530968/xb3 -
     +  0.965722560883/xb4 -
     +  1.076323390007/xb5 -
     +  0.399949252605/xb6 -
     +  2.976247072220/xb7 -
     +  3.980113983154/xb8 -
     +  1.212576389313/xb9 -
     +  0.478132873774/xb10 -
     +  1.447541594505/xb11 -
     +  0.287288188934/xb12 -
     +  0.847129225731/xb13 -
     +  0.899507462978/xb14 -
     +  0.965191483498
      xc4 =-0.421280384064/xb0 -
     +  0.564329922199/xb1 +
     +  1.009604096413/xb2 +
     +  0.335408806801/xb3 -
     +  0.515781700611/xb4 -
     +  0.189889833331/xb5 +
     +  0.561685442924/xb6 -
     +  0.274590790272/xb7 -
     +  0.640589475632/xb8 -
     +  0.454831272364/xb9 +
     +  0.185221791267/xb10 -
     +  1.204036474228/xb11 +
     +  2.715961456299/xb12 -
     +  2.415366411209/xb13 +
     +  0.508277475834/xb14 +
     +  0.001537762932
      xc5 =-1.879916071892/xb0 -
     +  1.522165775299/xb1 -
     +  0.468759000301/xb2 +
     +  1.417994260788/xb3 +
     +  0.370010912418/xb4 -
     +  2.718472957611/xb5 +
     +  0.469961762428/xb6 -
     +  2.314279079437/xb7 -
     +  0.682480514050/xb8 -
     +  1.616387128830/xb9 +
     +  0.202725619078/xb10 -
     +  1.451031565666/xb11 +
     +  0.099444560707/xb12 -
     +  1.293660640717/xb13 +
     +  0.203722134233/xb14 -
     +  0.991643249989
      xc6 =-0.589749693871/xb0 -
     +  0.571380496025/xb1 +
     +  0.120540380478/xb2 +
     +  0.763658463955/xb3 -
     +  1.608781814575/xb4 -
     +  0.913990020752/xb5 +
     +  0.719076871872/xb6 -
     +  1.206779360771/xb7 -
     +  0.747950553894/xb8 -
     +  0.689776837826/xb9 -
     +  0.001232341980/xb10 -
     +  0.592846393585/xb11 +
     +  1.381900072098/xb12 +
     +  0.327141195536/xb13 +
     +  0.125081762671/xb14 -
     +  0.179510131478
C xd = exp(-xc)
      xd0 = exp(-xc0)
      xd1 = exp(-xc1)
      xd2 = exp(-xc2)
      xd3 = exp(-xc3)
      xd4 = exp(-xc4)
      xd5 = exp(-xc5)
      xd6 = exp(-xc6)
C xsig = w3.dot(xd) + b3
      xsig =-1.147175073624/(1.0 + xd0) +
     +  0.396453082561/(1.0 + xd1) -
     +  1.731730222702/(1.0 + xd2) +
     +  0.341490298510/(1.0 + xd3) +
     +  0.917140424252/(1.0 + xd4) +
     +  0.416720062494/(1.0 + xd5) +
     +  0.469032645226/(1.0 + xd6) -
     +  0.399738907814
C ya = w3v*(xd / (1 + xd)**2)
      ya0 =-1.147175073624*(xd0/(1.0 + xd0)**2)
      ya1 = 0.396453082561*(xd1/(1.0 + xd1)**2)
      ya2 =-1.731730222702*(xd2/(1.0 + xd2)**2)
      ya3 = 0.341490298510*(xd3/(1.0 + xd3)**2)
      ya4 = 0.917140424252*(xd4/(1.0 + xd4)**2)
      ya5 = 0.416720062494*(xd5/(1.0 + xd5)**2)
      ya6 = 0.469032645226*(xd6/(1.0 + xd6)**2)
C yb = xa / (1 + xa)**2
      yb0 = xa0 / xb0**2
      yb1 = xa1 / xb1**2
      yb2 = xa2 / xb2**2
      yb3 = xa3 / xb3**2
      yb4 = xa4 / xb4**2
      yb5 = xa5 / xb5**2
      yb6 = xa6 / xb6**2
      yb7 = xa7 / xb7**2
      yb8 = xa8 / xb8**2
      yb9 = xa9 / xb9**2
      yb10 = xa10 / xb10**2
      yb11 = xa11 / xb11**2
      yb12 = xa12 / xb12**2
      yb13 = xa13 / xb13**2
      yb14 = xa14 / xb14**2
C yc = (w2.T).dot(ya) * xd
      yc0 = (0.000755758665*ya0 -
     +  1.520736217499*ya1 -
     +  0.263961493969*ya2 -
     +  1.667145609856*ya3 -
     +  0.421280384064*ya4 -
     +  1.879916071892*ya5 -
     +  0.589749693871*ya6)*yb0
      yc1 = (0.348879784346*ya0 -
     +  0.598750412464*ya1 +
     +  0.340663641691*ya2 -
     +  1.261272549629*ya3 -
     +  0.564329922199*ya4 -
     +  1.522165775299*ya5 -
     +  0.571380496025*ya6)*yb1
      yc2 = (-1.622294902802*ya0 -
     +  0.567928969860*ya1 -
     +  1.086898207664*ya2 -
     +  1.568691968918*ya3 +
     +  1.009604096413*ya4 -
     +  0.468759000301*ya5 +
     +  0.120540380478*ya6)*yb2
      yc3 = (-1.744126558304*ya0 +
     +  0.733987450600*ya1 -
     +  0.190290063620*ya2 -
     +  1.300865530968*ya3 +
     +  0.335408806801*ya4 +
     +  1.417994260788*ya5 +
     +  0.763658463955*ya6)*yb3
      yc4 = (1.189603447914*ya0 -
     +  1.956816315651*ya1 +
     +  1.526942133904*ya2 -
     +  0.965722560883*ya3 -
     +  0.515781700611*ya4 +
     +  0.370010912418*ya5 -
     +  1.608781814575*ya6)*yb4
      yc5 = (0.773437738419*ya0 -
     +  0.990542054176*ya1 +
     +  0.134074971080*ya2 -
     +  1.076323390007*ya3 -
     +  0.189889833331*ya4 -
     +  2.718472957611*ya5 -
     +  0.913990020752*ya6)*yb5
      yc6 = (-1.077992796898*ya0 -
     +  0.024108286947*ya1 -
     +  0.458628684282*ya2 -
     +  0.399949252605*ya3 +
     +  0.561685442924*ya4 +
     +  0.469961762428*ya5 +
     +  0.719076871872*ya6)*yb6
      yc7 = (0.195966541767*ya0 -
     +  0.921862065792*ya1 -
     +  0.210141628981*ya2 -
     +  2.976247072220*ya3 -
     +  0.274590790272*ya4 -
     +  2.314279079437*ya5 -
     +  1.206779360771*ya6)*yb7
      yc8 = (0.371459305286*ya0 -
     +  1.585801959038*ya1 +
     +  0.690639853477*ya2 -
     +  3.980113983154*ya3 -
     +  0.640589475632*ya4 -
     +  0.682480514050*ya5 -
     +  0.747950553894*ya6)*yb8
      yc9 = (-2.175866603851*ya0 -
     +  0.359389543533*ya1 -
     +  0.559289455414*ya2 -
     +  1.212576389313*ya3 -
     +  0.454831272364*ya4 -
     +  1.616387128830*ya5 -
     +  0.689776837826*ya6)*yb9
      yc10 = (0.267415910959*ya0 -
     +  0.568457961082*ya1 -
     +  0.561830639839*ya2 -
     +  0.478132873774*ya3 +
     +  0.185221791267*ya4 +
     +  0.202725619078*ya5 -
     +  0.001232341980*ya6)*yb10
      yc11 = (0.117423757911*ya0 -
     +  0.462055325508*ya1 +
     +  0.010643188842*ya2 -
     +  1.447541594505*ya3 -
     +  1.204036474228*ya4 -
     +  1.451031565666*ya5 -
     +  0.592846393585*ya6)*yb11
      yc12 = (-1.837396621704*ya0 +
     +  0.937371969223*ya1 -
     +  2.779141187668*ya2 -
     +  0.287288188934*ya3 +
     +  2.715961456299*ya4 +
     +  0.099444560707*ya5 +
     +  1.381900072098*ya6)*yb12
      yc13 = (-1.631284832954*ya0 +
     +  0.713293492794*ya1 +
     +  2.203900575638*ya2 -
     +  0.847129225731*ya3 -
     +  2.415366411209*ya4 -
     +  1.293660640717*ya5 +
     +  0.327141195536*ya6)*yb13
      yc14 = (-0.915312469006*ya0 -
     +  0.270313948393*ya1 -
     +  0.874182760715*ya2 -
     +  0.899507462978*ya3 +
     +  0.508277475834*ya4 +
     +  0.203722134233*ya5 +
     +  0.125081762671*ya6)*yb14
C yd = (w1.T).dot(yc)
      yd0 =-0.171193018556*yc0 -
     +  0.182183891535*yc1 -
     +  0.121008850634*yc2 +
     +  0.677952528000*yc3 -
     +  8.224933624268*yc4 -
     +  0.262212038040*yc5 +
     +  0.363313168287*yc6 -
     +  0.171282619238*yc7 -
     +  2.934058904648*yc8 -
     +  0.298778355122*yc9 +
     +  1.177027940750*yc10 -
     +  0.231339216232*yc11 +
     +  235.784103393555*yc12 -
     +  23.344444274902*yc13 +
     +  0.329279005527*yc14
      yd1 =-0.498235881329*yc0 -
     +  0.279642552137*yc1 -
     +  0.093622177839*yc2 +
     +  0.785129725933*yc3 +
     +  0.102857425809*yc4 -
     +  0.370604902506*yc5 +
     +  0.307944297791*yc6 -
     +  0.936020970345*yc7 +
     +  0.024969343096*yc8 -
     +  0.517931699753*yc9 -
     +  0.308994054794*yc10 -
     +  0.290423154831*yc11 -
     +  0.099293000996*yc12 +
     +  0.164729803801*yc13 +
     +  0.054267201573*yc14
      yd2 = 1.572309255600*yc0 +
     +  1.381547451019*yc1 -
     +  1.284856081009*yc2 -
     +  3.600407361984*yc3 -
     +  1.170001864433*yc4 +
     +  1.530593752861*yc5 -
     +  1.739808201790*yc6 -
     +  0.700896143913*yc7 -
     +  0.818501532078*yc8 -
     +  7.580852508545*yc9 -
     +  1.684179663658*yc10 +
     +  1.502451419830*yc11 +
     +  0.760096788406*yc12 -
     +  0.949119210243*yc13 -
     +  1.555212616920*yc14
      Yield(k) = 977.555715042962*xsig + 579.184642915415
      dyieldDeqps(k,1) = 977.555715042962*yd0
      dyieldDeqps(k,2) = 90.348959964501*yd1 / eqpsRate(k)
      dyieldDtemp(k) = 2.036574406340*yd2
      end do
C
      return
      end
