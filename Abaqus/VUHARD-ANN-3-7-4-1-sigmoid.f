C **********************************************************************
C Function to compute the ANN : 3-7-4-1-sigmoid yield stress
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
C xa = np.exp(-w1.dot(x)  -  b1)
      xa0 = exp(-0.119231261313*xepsp - 0.173828095198*xdepsp +
     +  1.827572464943*xtemp - 1.533527970314)
      xa1 = exp(-0.428523629904*xepsp - 0.572129368782*xdepsp +
     +  1.296182870865*xtemp + 1.823030114174)
      xa2 = exp(132.502944946289*xepsp - 0.074804469943*xdepsp +
     +  0.372308045626*xtemp + 1.611178278923)
      xa3 = exp(-0.238687828183*xepsp - 0.654297590256*xdepsp -
     +  1.221466302872*xtemp - 0.612167119980)
      xa4 = exp(-0.216847836971*xepsp - 0.142032980919*xdepsp +
     +  3.807989597321*xtemp - 0.042427442968)
      xa5 = exp(16.061351776123*xepsp - 0.115588687360*xdepsp +
     +  0.412052661180*xtemp + 1.614393234253)
      xa6 = exp(3.105705261230*xepsp - 0.138235300779*xdepsp +
     +  0.773996531963*xtemp + 1.072145581245)
C xb = 1 + xa
      xb0 = 1.0 + xa0
      xb1 = 1.0 + xa1
      xb2 = 1.0 + xa2
      xb3 = 1.0 + xa3
      xb4 = 1.0 + xa4
      xb5 = 1.0 + xa5
      xb6 = 1.0 + xa6
C xc = w2.dot(xb) + b2
      xc0 = exp(1.296875834465/xb0 +
     +  1.162090778351/xb1 +
     +  10.487031936646/xb2 +
     +  0.098825834692/xb3 +
     +  0.730871379375/xb4 -
     +  4.092911243439/xb5 +
     +  1.342621445656/xb6 +
     +  0.492944657803)
      xc1 = exp(-0.416251301765/xb0 +
     +  1.612317681313/xb1 -
     +  1.245551109314/xb2 +
     +  0.976023316383/xb3 +
     +  0.005203731358/xb4 -
     +  1.697751402855/xb5 -
     +  0.834678351879/xb6 -
     +  0.692925989628)
      xc2 = exp(-1.942471027374/xb0 -
     +  0.364910364151/xb1 +
     +  10.365681648254/xb2 -
     +  0.165790036321/xb3 -
     +  0.691674530506/xb4 -
     +  5.159326076508/xb5 +
     +  2.959228277206/xb6 -
     +  0.345911204815)
      xc3 = exp(-1.463814258575/xb0 -
     +  0.175867184997/xb1 +
     +  0.670381665230/xb2 -
     +  0.306437820196/xb3 -
     +  0.191420003772/xb4 +
     +  2.523961305618/xb5 +
     +  0.034361626953/xb6 +
     +  0.274670749903)
C xsig = w3.dot(xd) + b3
      xsig =-1.342184662819/(1.0 + xc0) -
     +  1.402877211571/(1.0 + xc1) +
     +  1.547661781311/(1.0 + xc2) +
     +  0.745113432407/(1.0 + xc3) -
     +  0.319332510233
C ya = w3v*(xd / (1 + xc)**2)
      ya0 =-1.342184662819*(xc0/(1.0 + xc0)**2)
      ya1 =-1.402877211571*(xc1/(1.0 + xc1)**2)
      ya2 = 1.547661781311*(xc2/(1.0 + xc2)**2)
      ya3 = 0.745113432407*(xc3/(1.0 + xc3)**2)
C yb = xa / (1 + xa)**2
      yb0 = xa0 / xb0**2
      yb1 = xa1 / xb1**2
      yb2 = xa2 / xb2**2
      yb3 = xa3 / xb3**2
      yb4 = xa4 / xb4**2
      yb5 = xa5 / xb5**2
      yb6 = xa6 / xb6**2
C yc = (w2.T).dot(ya) * xd
      yc0 = (-1.296875834465*ya0 +
     +  0.416251301765*ya1 +
     +  1.942471027374*ya2 +
     +  1.463814258575*ya3)*yb0
      yc1 = (-1.162090778351*ya0 -
     +  1.612317681313*ya1 +
     +  0.364910364151*ya2 +
     +  0.175867184997*ya3)*yb1
      yc2 = (-10.487031936646*ya0 +
     +  1.245551109314*ya1 -
     +  10.365681648254*ya2 -
     +  0.670381665230*ya3)*yb2
      yc3 = (-0.098825834692*ya0 -
     +  0.976023316383*ya1 +
     +  0.165790036321*ya2 +
     +  0.306437820196*ya3)*yb3
      yc4 = (-0.730871379375*ya0 -
     +  0.005203731358*ya1 +
     +  0.691674530506*ya2 +
     +  0.191420003772*ya3)*yb4
      yc5 = (4.092911243439*ya0 +
     +  1.697751402855*ya1 +
     +  5.159326076508*ya2 -
     +  2.523961305618*ya3)*yb5
      yc6 = (-1.342621445656*ya0 +
     +  0.834678351879*ya1 -
     +  2.959228277206*ya2 -
     +  0.034361626953*ya3)*yb6
C yd = (w1.T).dot(yc)
      yd0 = 0.119231261313*yc0 +
     +  0.428523629904*yc1 -
     +  132.502944946289*yc2 +
     +  0.238687828183*yc3 +
     +  0.216847836971*yc4 -
     +  16.061351776123*yc5 -
     +  3.105705261230*yc6
      yd1 = 0.173828095198*yc0 +
     +  0.572129368782*yc1 +
     +  0.074804469943*yc2 +
     +  0.654297590256*yc3 +
     +  0.142032980919*yc4 +
     +  0.115588687360*yc5 +
     +  0.138235300779*yc6
      yd2 =-1.827572464943*yc0 -
     +  1.296182870865*yc1 -
     +  0.372308045626*yc2 +
     +  1.221466302872*yc3 -
     +  3.807989597321*yc4 -
     +  0.412052661180*yc5 -
     +  0.773996531963*yc6
      Yield(k) = 977.555715042962*xsig + 579.184642915415
      dyieldDeqps(k,1) = 977.555715042962*yd0
      dyieldDeqps(k,2) = 90.348959964501*yd1 / eqpsRate(k)
      dyieldDtemp(k) = 2.036574406340*yd2
      end do
C
      return
      end
