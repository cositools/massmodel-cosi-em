# A single germanium detector volume
# COSI SMEX model
#These constants were used to make the detector sit nicely in the mother volume
#Constant Xshift -0.627
Constant Xshift 1.342
Constant Yshift 0.991
Constant Zshift 0.0
#Constant Zshift -0.4

Volume SingleDetector
SingleDetector.Material vacuum
#SingleDetector.Shape BRIK  5.3025  4.791  1.07
#SingleDetector.Shape BRIK  7.7025  6.791  2.17
SingleDetector.Shape BRIK  6.1225  5.791  {DetectorHalfHeight+.9+.4}
SingleDetector.Visibility 0
SingleDetector.Virtual true

#Shape BRIK GeWaferBlock
#GeWaferBlock.Parameters DetectorHalfWidth DetectorHalfWidth DetectorHalfHeight

#Shape TUBE WaferCutDisk
#WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

#Shape Intersection ActiveWafer
#ActiveWafer.Parameters GeWaferBlock WaferCutDisk

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK WaferOuterBox
WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE WaferCutDisk
WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection WholeWafer
WholeWafer.Parameters WaferOuterBox WaferCutDisk

# Create the active wafer
Shape BRIK ActiveWaferOuterBox
ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE ActiveWaferCutDisk
ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection ActiveWafer
ActiveWafer.Parameters ActiveWaferOuterBox ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction GuardRing_AlmostThere
GuardRing_AlmostThere.Parameters WholeWafer ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection GuardRing
GuardRing.Parameters WaferOuterBox GuardRing_AlmostThere

Volume D1_GeWafer
D1_GeWafer.Material active_ge_recoil
D1_GeWafer.Visibility 1
D1_GeWafer.Color 4
D1_GeWafer.Shape ActiveWafer
#Come back and check this. Need to figure out where the 0,0 point is and what we are offsetting
D1_GeWafer.Mother SingleDetector
D1_GeWafer.Position {-0.6555+Xshift} {0.0+Yshift} {Zshift}

Volume GeWaferGuardRing
GeWaferGuardRing.Material active_ge_recoil
GeWaferGuardRing.Visibility 1
GeWaferGuardRing.Color 3
GeWaferGuardRing.Shape GuardRing
GeWaferGuardRing.Position  {-0.6555+Xshift} {0.0+Yshift} {Zshift}
GeWaferGuardRing.Mother SingleDetector

# Al dead layer on top
Shape BRIK stripsAl1
stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk1
WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead1
AlDead1.Parameters stripsAl1 WaferCutDisk1

Volume stripsAl
stripsAl.Material aluminum
stripsAl.Visibility 1
stripsAl.Color 7
stripsAl.Shape AlDead1
stripsAl.Mother SingleDetector
stripsAl.Position {-0.6555+Xshift} {0.0+Yshift} {0.80025+Zshift}

Shape BRIK stripsAl2
stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk2
WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead2
AlDead2.Parameters stripsAl2 WaferCutDisk2

# Al dead layer on the bottom
Volume stripsAlbot
stripsAlbot.Material aluminum
stripsAlbot.Visibility 1
stripsAlbot.Color 7
stripsAlbot.Shape AlDead2
stripsAlbot.Mother SingleDetector
stripsAlbot.Position {-0.6555+Xshift} {0.0+Yshift} {-0.80025+Zshift}

# Handles etc.
Volume GeDead1
GeDead1.Material germanium
GeDead1.Visibility 1
GeDead1.Color 6
#GeDead1.Shape TRD1 1.21 2.88 0.076 0.39
GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

GeDead1.Copy GeDead1_01
GeDead1.Copy GeDead1_02

GeDead1_01.Mother SingleDetector
GeDead1_01.Position  {3.785+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
GeDead1_01.Rotation 90.0  0.0 -90.0

GeDead1_02.Mother SingleDetector
#GeDead1_02.Position  {-0.655+Xshift}  {-4.41+Yshift}  -0.698
GeDead1_02.Position  {-5.096+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
#GeDead1_02.Rotation 90.0  0.0  180.0
GeDead1_02.Rotation 90.0  0.0  90.0

Volume GeDead2
GeDead2.Material germanium
GeDead2.Visibility 1
GeDead2.Color 6
#GeDead2.Shape TRD1 1.21 2.54 0.30 0.287
GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

GeDead2.Copy GeDead2_01
GeDead2.Copy GeDead2_02

GeDead2_01.Mother SingleDetector
GeDead2_01.Position  {3.913+Xshift}  {0.0+Yshift}  {-0.398+Zshift}
GeDead2_01.Rotation 90.0  0.0 -90.0


GeDead2_02.Mother SingleDetector
GeDead2_02.Position  {-5.224+Xshift}   {0.0+Yshift}  {-0.398+Zshift}
GeDead2_02.Rotation 90.0  0.0  90.0


/////////////////////////////////////////////////////////
// Detector Holder
////////////////////////////////////////////////////////
// Detector holder on the side of the HV PCB Assembly

Shape BRIK HolderBlock
HolderBlock.Parameters 5.08 4.75 0.8545
Shape BRIK HolderBlockHole1
HolderBlockHole1.Parameters 3.886 4.78 0.274
Orientation HolderBlockHole1Ori
HolderBlockHole1Ori.Position -0.076 0.411 -0.5905

Shape Subtraction HolderBlockMinusHole1
HolderBlockMinusHole1.Parameters HolderBlock HolderBlockHole1 HolderBlockHole1Ori

Shape BRIK HolderBlockHole2
HolderBlockHole2.Parameters 3.9125 4.78 0.334
Orientation HolderBlockHole2Ori
HolderBlockHole2Ori.Position -0.1255 0.1825 0.5305

Shape Subtraction HolderBlockMinusHole2
HolderBlockMinusHole2.Parameters HolderBlockMinusHole1 HolderBlockHole2 HolderBlockHole2Ori

Shape BRIK HolderBlockHole3
#HolderBlockHole3.Parameters 4.223 4.2 0.565
HolderBlockHole3.Parameters 4.223 3.72 0.8545
Orientation HolderBlockHole3Ori
HolderBlockHole3Ori.Position 0.0 1.0365 0.0

Shape Subtraction HolderBlockMinusHole3
HolderBlockMinusHole3.Parameters HolderBlockMinusHole2 HolderBlockHole3 HolderBlockHole3Ori

Shape TRD1 HolderTrdHole1
HolderTrdHole1.Parameters 3.261 4.223 0.8545 0.4805
Orientation HolderTrdHole1Ori
HolderTrdHole1Ori.Position 0.0 -3.164 0.0
HolderTrdHole1Ori.Rotation -90.0 0.0 0.0

Shape Subtraction HolderBlockMinusTrdHole1
HolderBlockMinusTrdHole1.Parameters HolderBlockMinusHole3 HolderTrdHole1 HolderTrdHole1Ori

#this is the high voltage side
Shape BRIK HolderBlockHole4
HolderBlockHole4.Parameters 0.64 4.05 0.274
Orientation HolderBlockHole4Ori
HolderBlockHole4Ori.Position -4.445 0.702 -0.5905

Shape Subtraction HolderBlockMinusHole4
HolderBlockMinusHole4.Parameters HolderBlockMinusTrdHole1 HolderBlockHole4 HolderBlockHole4Ori

#This is the low voltage side opposite the HV side
Shape BRIK HolderBlockHole5
HolderBlockHole5.Parameters 0.64 3.93 0.274
Orientation HolderBlockHole5Ori
HolderBlockHole5Ori.Position 4.445 0.8255 -0.5905

Shape Subtraction HolderBlockMinusHole5
HolderBlockMinusHole5.Parameters HolderBlockMinusHole4 HolderBlockHole5 HolderBlockHole5Ori

Shape TRD1 HolderTrdHole2
HolderTrdHole2.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole2Ori
HolderTrdHole2Ori.Position -4.588 0.584 -0.192
HolderTrdHole2Ori.Rotation 90.0 0.0 90.0

Shape Subtraction HolderBlockMinusTrdHole2
HolderBlockMinusTrdHole2.Parameters HolderBlockMinusHole5 HolderTrdHole2 HolderTrdHole2Ori

Shape TRD1 HolderTrdHole3
HolderTrdHole3.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole3Ori
HolderTrdHole3Ori.Position 4.588 0.584 -0.192
HolderTrdHole3Ori.Rotation 90.0 0.0 -90.0

Shape Subtraction HolderBlockMinusTrdHole3
HolderBlockMinusTrdHole3.Parameters HolderBlockMinusTrdHole2 HolderTrdHole3 HolderTrdHole3Ori

Shape TRD1 HolderTrdHole4
HolderTrdHole4.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole4Ori
HolderTrdHole4Ori.Position 0.0 -4.0145 -0.18655
HolderTrdHole4Ori.Rotation 90.0 0.0 180.0

Shape Subtraction HolderBlockMinusTrdHole4
HolderBlockMinusTrdHole4.Parameters HolderBlockMinusTrdHole3 HolderTrdHole4 HolderTrdHole4Ori

Shape BRIK HolderBlockHole6
HolderBlockHole6.Parameters 5.1 0.1395 0.265
Orientation HolderBlockHole6Ori
HolderBlockHole6Ori.Position 0.0 -4.611 -0.5905

Shape Subtraction HolderBlockMinusBrikHole6
HolderBlockMinusBrikHole6.Parameters HolderBlockMinusTrdHole4 HolderBlockHole6 HolderBlockHole6Ori

Shape BRIK HolderBlockHole7
HolderBlockHole7.Parameters 0.4445 0.39 0.265
Orientation HolderBlockHole7Ori
HolderBlockHole7Ori.Position -4.6355 -4.36 -0.5905

Shape Subtraction HolderBlockMinusBrikHole7
HolderBlockMinusBrikHole7.Parameters HolderBlockMinusBrikHole6 HolderBlockHole7 HolderBlockHole7Ori

Shape BRIK HolderBlockHole8
HolderBlockHole8.Parameters 0.362 0.432 0.201
Orientation HolderBlockHole8Ori
HolderBlockHole8Ori.Position 4.718 -3.531 -0.654

Shape Subtraction HolderBlockMinusBrikHole8
HolderBlockMinusBrikHole8.Parameters HolderBlockMinusBrikHole7 HolderBlockHole8 HolderBlockHole8Ori

#Adding in the additional tabs on this side
Shape BRIK HolderBlockTab1
HolderBlockTab1.Parameters 0.076 0.305 0.47
Orientation HolderBlockTab1Ori
HolderBlockTab1Ori.Position -5.004 -4.445 -0.7955

Shape Union HolderBlockPlusBrikTab1
HolderBlockPlusBrikTab1.Parameters HolderBlockMinusBrikHole8 HolderBlockTab1 HolderBlockTab1Ori

Shape BRIK HolderBlockTab2
HolderBlockTab2.Parameters 0.076 0.254 0.4065
Orientation HolderBlockTab2Ori
HolderBlockTab2Ori.Position 5.004 -4.217 -0.8595

Shape Union HolderBlockPlusBrikTab2
HolderBlockPlusBrikTab2.Parameters HolderBlockPlusBrikTab1 HolderBlockTab2 HolderBlockTab2Ori

Shape BRIK HolderBlockTab3
HolderBlockTab3.Parameters 0.286 0.292 0.47
Orientation HolderBlockTab3Ori
HolderBlockTab3Ori.Position 4.508 4.458 -0.7565

Shape Union HolderBlockPlusBrikTab3
HolderBlockPlusBrikTab3.Parameters HolderBlockPlusBrikTab2 HolderBlockTab3 HolderBlockTab3Ori

Shape BRIK HolderBlockTab4
HolderBlockTab4.Parameters 0.743 0.254 0.2275
Orientation HolderBlockTab4Ori
HolderBlockTab4Ori.Position -4.337 5.004 -.226

Shape Union HolderBlockPlusBrikTab4
HolderBlockPlusBrikTab4.Parameters HolderBlockPlusBrikTab3 HolderBlockTab4 HolderBlockTab4Ori

Shape BRIK HolderBlockTab5
HolderBlockTab5.Parameters 0.3685 0.1015 0.4065
Orientation HolderBlockTab5Ori
HolderBlockTab5Ori.Position -4.7115 5.1565 -.86

Shape Union HolderBlockPlusBrikTab5
HolderBlockPlusBrikTab5.Parameters HolderBlockPlusBrikTab4 HolderBlockTab5 HolderBlockTab5Ori

Shape BRIK HolderBlockTab6
HolderBlockTab6.Parameters 0.457 0.1525 0.2415
Orientation HolderBlockTab6Ori
HolderBlockTab6Ori.Position -5.537 4.8005 0.296

Shape Union HolderBlockPlusBrikTab6
HolderBlockPlusBrikTab6.Parameters HolderBlockPlusBrikTab5 HolderBlockTab6 HolderBlockTab6Ori

#following two tabs are on the side closest to the HV board
Shape BRIK HolderBlockTab7
HolderBlockTab7.Parameters 0.457 0.216 0.2415
Orientation HolderBlockTab7Ori
HolderBlockTab7Ori.Position -5.537 -4.242 0.296

Shape Union HolderBlockPlusBrikTab7
HolderBlockPlusBrikTab7.Parameters HolderBlockPlusBrikTab6 HolderBlockTab7 HolderBlockTab7Ori

Shape BRIK HolderBlockTab8
HolderBlockTab8.Parameters 0.178 1.7465 1.27
Orientation HolderBlockTab8Ori
HolderBlockTab8Ori.Position 5.258 -3.6385 0.8165

Shape Union HolderBlockPlusBrikTab8
HolderBlockPlusBrikTab8.Parameters HolderBlockPlusBrikTab7 HolderBlockTab8 HolderBlockTab8Ori

#Following two tabs are the tabs that line up with the LV board
Shape BRIK HolderBlockTab9
HolderBlockTab9.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab9Ori
HolderBlockTab9Ori.Position -4.4325 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab9
HolderBlockPlusBrikTab9.Parameters HolderBlockPlusBrikTab8 HolderBlockTab9 HolderBlockTab9Ori

Shape BRIK HolderBlockTab10
HolderBlockTab10.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab10Ori
HolderBlockTab10Ori.Position 4.1655 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab10
HolderBlockPlusBrikTab10.Parameters HolderBlockPlusBrikTab9 HolderBlockTab10 HolderBlockTab10Ori

#Now going to the opposite side of the holder
#Like above, I will start by subtracting then move to adding mass
Shape BRIK HolderBlockHole9
HolderBlockHole9.Parameters 0.445 4.2035 0.33
Orientation HolderBlockHole9Ori
HolderBlockHole9Ori.Position 4.483 0.0385 0.5305

Shape Subtraction HolderBlockPlusBrikHole9
HolderBlockPlusBrikHole9.Parameters HolderBlockPlusBrikTab10 HolderBlockHole9 HolderBlockHole9Ori

Shape BRIK HolderBlockHole10
HolderBlockHole10.Parameters 0.3525 4.045 0.33
Orientation HolderBlockHole10Ori
HolderBlockHole10Ori.Position -4.7275 0.603 0.5305

Shape Subtraction HolderBlockPlusBrikHole10
HolderBlockPlusBrikHole10.Parameters HolderBlockPlusBrikHole9 HolderBlockHole10 HolderBlockHole10Ori

#Adding mass now
Shape BRIK HolderBlockTab11
HolderBlockTab11.Parameters 0.254 0.305 0.616
Orientation HolderBlockTab11Ori
HolderBlockTab11Ori.Position -4.674 -4.445 1.4705

Shape Union HolderBlockPlusBrikTab11
HolderBlockPlusBrikTab11.Parameters HolderBlockPlusBrikHole10 HolderBlockTab11 HolderBlockTab11Ori

Shape BRIK HolderBlockTab112
HolderBlockTab112.Parameters 0.076 0.305 0.2095
Orientation HolderBlockTab112Ori
HolderBlockTab112Ori.Position -5.004 -4.445 1.064

Shape Union HolderBlockPlusBrikTab112
HolderBlockPlusBrikTab112.Parameters HolderBlockPlusBrikTab11 HolderBlockTab112 HolderBlockTab112Ori

Shape BRIK HolderBlockTab12
HolderBlockTab12.Parameters 0.743 0.1015 0.4265
Orientation HolderBlockTab12Ori
HolderBlockTab12Ori.Position -4.337 4.8515 .428

Shape Union HolderBlockPlusBrikTab12
HolderBlockPlusBrikTab12.Parameters HolderBlockPlusBrikTab112 HolderBlockTab12 HolderBlockTab12Ori

#This tab should be 0.8045 apparentl in the z direction
Shape BRIK HolderBlockTab13
HolderBlockTab13.Parameters 0.3685 0.051 0.4045
Orientation HolderBlockTab13Ori
HolderBlockTab13Ori.Position -3.9625 5.004 1.282

Shape Union HolderBlockPlusBrikTab13
HolderBlockPlusBrikTab13.Parameters HolderBlockPlusBrikTab12 HolderBlockTab13 HolderBlockTab13Ori

Shape BRIK HolderBlockTab14
HolderBlockTab14.Parameters 0.286 0.292 .5335
Orientation HolderBlockTab14Ori
HolderBlockTab14Ori.Position 4.508 4.458 0.74

Shape Union HolderBlockPlusBrikTab14
HolderBlockPlusBrikTab14.Parameters HolderBlockPlusBrikTab13 HolderBlockTab14 HolderBlockTab14Ori

Shape BRIK HolderBlockTab15
HolderBlockTab15.Parameters 0.076 0.254 0.6415
Orientation HolderBlockTab15Ori
HolderBlockTab15Ori.Position 5.004 3.658 1.445

Shape Union HolderBlockPlusBrikTab15
HolderBlockPlusBrikTab15.Parameters HolderBlockPlusBrikTab14 HolderBlockTab15 HolderBlockTab15Ori

#Hole for the stupid skewer things
Shape TUBS HolderRodHole
HolderRodHole.Parameters 0.0 0.16 2.11 0.0 360.0
Orientation HolderRodHole_Ori
HolderRodHole_Ori.Position 4.508 4.471 0.0

Shape SUBTRACTION HolderBlockMinusRodHole
HolderBlockMinusRodHole.Parameters HolderBlockPlusBrikTab15 HolderRodHole HolderRodHole_Ori

Volume Holder
Holder.Material al6061
Holder.Visibility 1
Hrolder.Color 15
Holder.Shape HolderBlockMinusRodHole
Holder.Rotation 0.0 0.0 0.0
Holder.Position {-0.6555+Xshift} {-0.574+Yshift} {-.0005+Zshift}
Holder.Mother SingleDetector

# adding new aluminum bar that is on the far end of the holder on the opposite side of the LV interposer board
Volume AlBar
AlBar.Material al6061
AlBar.Visibility 1
AlBar.Color 20
AlBar.Shape Brik 3.9 0.0735 0.273
#AlBar.Position  {-0.582+Xshift} {4.2495+Yshift} {-0.067+Zshift}
AlBar.Position  {-.345+Xshift} {4.2345+Yshift} {-0.067+Zshift}
AlBar.Mother SingleDetector


#Aluminium parts, I believe these were captured above when I made the holder geometry a boolean shape
#Shape BRIK AlSide1_Block
#AlSide1_Block.Parameters 0.4285 4.953 0.5905
#Shape BRIK AlSide1H1
#AlSide1H1.Parameters 0.3525 4.045 0.324
#Orientation AlSide1_Ori
#AlSide1_Ori.Position -0.076 0.4 0.2665

#Shape SUBTRACTION AlSideMinusH1
#AlSideMinusH1.Parameters AlSide1_Block AlSide1H1 AlSide1_Ori

#Space for Detector Handle
#Shape TRD1 AlSideH2 
#AlSideH2.Parameters 1.569 2.948 0.1245 0.365
#Orientation AlSideH2_Ori
#AlSideH2_Ori.Position 0.0635 0.553 -0.466
#AlSideH2_Ori.Rotation 90.0 0.0 90.0

#Shape SUBTRACTION AlSideMinusH2
#AlSideMinusH2.Parameters AlSideMinusH1 AlSideH2 AlSideH2_Ori


#Volume AlSide1
#AlSide1.Material al6061
#AlSide1.Visibility 1
#AlSide1.Color 2
#AlSide1.Shape AlSideMinusH2
#AlSide1.Mother SingleDetector
#AlSide1.Position {-5.307+Xshift}  {-0.547+Yshift}  0.206

#Updating this to be a boolean shape 

Shape BRIK LV_Block
LV_Block.Parameters 4.661 1.552 0.0795
Shape TRD1 LV_TRD_Hole
LV_TRD_Hole.Parameters 3.7245 2.756 0.08 0.4295
Orientation LV_TRD_HoleOri
LV_TRD_HoleOri.Rotation 90.0 0.0 0.0
LV_TRD_HoleOri.Position 0.1445 1.1225 0.0

Shape Subtraction LVBlockMinusTRDHole
LVBlockMinusTRDHole.Parameters LV_Block LV_TRD_Hole LV_TRD_HoleOri

Shape BRIK LVL3
LVL3.Parameters .203 .3365 .08
Orientation LVL3_Ori
LVL3_Ori.Position 4.458 1.2155  0.0

Shape Subtraction LVBlockMinusLVL3
LVBlockMinusLVL3.Parameters LVBlockMinusTRDHole LVL3 LVL3_Ori

Shape BRIK LVL4
LVL4.Parameters .2795 .536 .08
Orientation LVL4_Ori
LVL4_Ori.Position -4.3815 1.016  0.0

Shape Subtraction LVBlockMinusLVL4
LVBlockMinusLVL4.Parameters LVBlockMinusLVL3 LVL4 LVL4_Ori

Shape BRIK LVL6
LVL6.Parameters .303 .5535 .08
Orientation LVL6_Ori
LVL6_Ori.Position -4.458 -0.6825  0.0

Shape Subtraction LVBlockMinusLVL6
LVBlockMinusLVL6.Parameters LVBlockMinusLVL4 LVL6 LVL6_Ori


Volume LVL1
LVL1.Material ro4003
LVL1.Visibility 1
LVL1.Color 52
LVL1.Shape LVBlockMinusLVL6
LVL1.Mother SingleDetector
#LVL1.Position {-0.1435+Xshift} {-3.691+Yshift} 0.967
# Seems like the LV board is shifted slightly off center. Having a hard time getting this measurement
# therefore, if something seems off check this shift here. Currently saying it is shifted by .178 cm
LVL1.Position {-0.8335+Xshift} {-4.417+Yshift} {-0.935+Zshift}

Volume LVL5
LVL5.Material ro4003
LVL5.Mother SingleDetector
LVL5.Shape BRIK 4.661 0.158 0.978
LVL5.Visibility 1
LVL5.Color 3
LVL5.Position {-0.8335+Xshift} {-6.127+Yshift} {-0.0365+Zshift}

//Flex Clamp Block
Volume LVFlexBlock
#LVFlexBlock.Material al6061
LVFlexBlock.Material steel_304
LVFlexBlock.Mother SingleDetector
LVFlexBlock.Visibility 1
LVFlexBlock.Color 7
LVFlexBlock.Shape BRIK 3.9155 0.2385 0.286
LVFlexBlock.Position {-0.929+Xshift} {-6.5235+Yshift} {0.4015+Zshift}

Volume LVFlexSmBlock1
#LVFlexSmBlock1.Material al6061
LVFlexSmBlock1.Material steel_304
LVFlexSmBlock1.Mother SingleDetector
LVFlexSmBlock1.Visibility 1
LVFlexSmBlock1.Color 7
LVFlexSmBlock1.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock1.Position {2.8235+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

Volume LVFlexSmBlock2
LVFlexSmBlock2.Material steel_304
LVFlexSmBlock2.Mother SingleDetector
LVFlexSmBlock2.Visibility 1
LVFlexSmBlock2.Color 7
LVFlexSmBlock2.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock2.Position {-4.6815+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

////////////////////////////////////////////////
// High voltage boards
///////////////////////////////////////////////
#Making this a Boolean shape
Shape BRIK HVBlock
HVBlock.Parameters 1.5645 4.934 0.0795
Shape BRIK HVLH1
HVLH1.Parameters 1.128 0.3225 0.08
Orientation HVLH1_Ori
HVLH1_Ori.Position .4365 -4.6115 0.0

Shape SUBTRACTION HVBlockMinusHVLH1
HVBlockMinusHVLH1.Parameters HVBlock HVLH1 HVLH1_Ori

Shape BRIK HVLH2
HVLH2.Parameters 0.32 0.292 0.08
Orientation HVLH2_Ori
HVLH2_Ori.Position 1.2445 -3.997 0.0

Shape SUBTRACTION HVBlockMinusHVLH2
HVBlockMinusHVLH2.Parameters HVBlockMinusHVLH1 HVLH2 HVLH2_Ori

Shape BRIK HVLH3
HVLH3.Parameters 1.168 0.089 0.08
Orientation HVLH3_Ori
HVLH3_Ori.Position 0.3965 4.845 0.0

Shape SUBTRACTION HVBlockMinusHVLH3
HVBlockMinusHVLH3.Parameters HVBlockMinusHVLH2 HVLH3 HVLH3_Ori

Shape BRIK HVLH4
HVLH4.Parameters 0.397 0.165 0.08
Orientation HVLH4_Ori
HVLH4_Ori.Position 1.1675 4.591 0.0

Shape SUBTRACTION HVBlockMinusHVLH4
HVBlockMinusHVLH4.Parameters HVBlockMinusHVLH3 HVLH4 HVLH4_Ori

Shape TRD1 HVLH5
HVLH5.Parameters 3.7245 2.756 0.09 0.4295
Orientation HVLH5_Ori
HVLH5_Ori.Position 1.135 0.401 0.0
HVLH5_Ori.Rotation 90.0 0.0 270.0

Shape SUBTRACTION HVBlockMinusHVLH5
HVBlockMinusHVLH5.Parameters HVBlockMinusHVLH4 HVLH5 HVLH5_Ori

Volume HVL1
HVL1.Material ro4003
HVL1.Visibility 1
HVL1.Color 94
HVL1.Shape HVBlockMinusHVLH5
HVL1.Mother SingleDetector
HVL1.Position {-5.085+Xshift} {-0.4+Yshift} {.934+Zshift}
#HVL1.Position {-5.085+Xshift} {-0.4+Yshift} .88
HVL1.Rotation 0.0 0.0 0.0

#Making the HVL5 board also a boolean shape

Shape BRIK HVL5Block
HVL5Block.Parameters 0.1585 4.934 0.978
Shape BRIK HVL5H1
HVL5H1.Parameters 0.16 0.216 0.505
Orientation HVL5H1_Ori
HVL5H1_Ori.Position 0.0 -4.718 -0.473

Shape SUBTRACTION HVL5BlockMinusH1
HVL5BlockMinusH1.Parameters HVL5Block HVL5H1 HVL5H1_Ori

Shape BRIK HVL5H2
HVL5H2.Parameters 0.16 0.216 0.2445
Orientation HVL5H2_Ori
HVL5H2_Ori.Position 0.0 -4.718 0.7335

Shape SUBTRACTION HVL5BlockMinusH2
HVL5BlockMinusH2.Parameters HVL5BlockMinusH1 HVL5H2 HVL5H2_Ori

Shape BRIK HVL5H3
HVL5H3.Parameters 0.16 0.1335 0.4365
Orientation HVL5H3_Ori
HVL5H3_Ori.Position 0.0 4.8005 -0.5415

Shape SUBTRACTION HVL5BlockMinusH3
HVL5BlockMinusH3.Parameters HVL5BlockMinusH2 HVL5H3 HVL5H3_Ori

Volume HVL5
HVL5.Material roTMM3
HVL5.Mother SingleDetector
HVL5.Visibility 1
HVL5.Color 3
HVL5.Shape HVL5BlockMinusH3
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -0.062
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -.0185
HVL5.Position {-6.808+Xshift} {-0.4+Yshift} {.0355+Zshift}

#adding a block to represent the capacitors
Volume HV_Caps
HV_Caps.Material Class1Cap
HV_Caps.Mother SingleDetector
HV_Caps.Visibility 1
HV_Caps.Color 4
HV_Caps.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)+0.5*.6401}

Volume HV_Caps2
HV_Caps2.Material Class1Cap
HV_Caps2.Mother SingleDetector
HV_Caps2.Visibility 1
HV_Caps2.Color 4
HV_Caps2.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps2.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}


#Adding in solder
Volume DetSolder
DetSolder.Material solder
DetSolder.Visibility 1
DetSolder.Color 12
DetSolder.Shape BRIK DetectorHalfWidth .3 0.1217
DetSolder.Rotation 90.0 0.0 90.0
DetSolder.Position {(-6.808+Xshift)+2*0.5*0.574+.16+.1217} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}
DetSolder.Mother SingleDetector


//Flex Clamp Block
Volume HVFlexBlock
HVFlexBlock.Material al6061
HVFlexBlock.Mother SingleDetector
HVFlexBlock.Visibility 1
HVFlexBlock.Color 7
HVFlexBlock.Shape BRIK 0.2385 3.9155 0.286
HVFlexBlock.Position {-7.2055+Xshift} {-0.1995+Yshift} {-0.3945+Zshift}

Volume HVFlexSmBlock1
HVFlexSmBlock1.Material al6061
HVFlexSmBlock1.Mother SingleDetector
HVFlexSmBlock1.Visibility 1
HVFlexSmBlock1.Color 7
HVFlexSmBlock1.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock1.Position {-7.2055+Xshift} {3.553+Yshift} {0.1895+Zshift}

Volume HVFlexSmBlock2
HVFlexSmBlock2.Material al6061
HVFlexSmBlock2.Mother SingleDetector
HVFlexSmBlock2.Visibility 1
HVFlexSmBlock2.Color 7
HVFlexSmBlock2.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock2.Position {-7.2055+Xshift} {-3.952+Yshift} {0.1895+Zshift}

// ************************************************
//     Indium - approx of thermal joints
// ************************************************


// Indium at thermal joints - 0.1mm at cold finger
#Volume In_ColdFinger
#In_ColdFinger.Material indium
#In_ColdFinger.Visibility 1
#In_ColdFinger.Color 8
#In_ColdFinger.Shape BRIK 0.005 1.746 1.27
#In_ColdFinger.Mother PEC1
#In_ColdFinger.Position -0.247 0.0 0.0

// Indium at thermal joints - 0.1 mm at each of passive surfacess
Volume In_PassGe
In_PassGe.Material indium
In_PassGe.Visibility 1
In_PassGe.Color 90
In_PassGe.Shape BRIK .3555 1.2445 .005

In_PassGe.Copy In_PassGe1
In_PassGe.Copy In_PassGe2
In_PassGe.Copy In_PassGe3
In_PassGe.Copy In_PassGe4


In_PassGe1.Mother SingleDetector
In_PassGe1.Position {3.785+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe2.Mother SingleDetector
In_PassGe2.Position {3.785+Xshift} {0.0+Yshift} {-0.08+Zshift}
In_PassGe3.Mother SingleDetector
In_PassGe3.Position {-5.096+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe4.Mother SingleDetector
In_PassGe4.Position {-5.096+Xshift} {0.0+Yshift} {-0.08+Zshift}

Volume In_PassAlNi
In_PassAlNi.Material indium
In_PassAlNi.Visibility 1
In_PassAlNi.Color 90
In_PassAlNi.Shape BRIK .3555 1.2445 .05

In_PassAlNi.Copy In_PassAlNi1
In_PassAlNi.Copy In_PassAlNi2

# Not sure why the same z positions are not working for In_PassGe3 and In_PassAlNi2 but this is the only way I can remove the overlap.
In_PassAlNi1.Mother SingleDetector
In_PassAlNi1.Position {3.785+Xshift} {0.0+Yshift} {-0.140+Zshift}
In_PassAlNi2.Mother SingleDetector
In_PassAlNi2.Position {-5.096+Xshift} {0.0+Yshift} {-0.140+Zshift}

# Not including the detector clamp buttons

#Dummy approximation of the detector clamps
# 4130 Steel
Shape Brik BigClamp
BigClamp.Parameters 3.041 0.3175 0.178 
Shape Brik SmallClamp1
SmallClamp1.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp1Ori
SmallClamp1Ori.Position 2.99 0.0 0.4465

Shape UNION BigClampPlusSmallClamp1
BigClampPlusSmallClamp1.Parameters BigClamp SmallClamp1 SmallClamp1Ori

Shape Brik SmallClamp2
SmallClamp2.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp2Ori
SmallClamp2Ori.Position -2.99 0.0 0.4465


Shape Union BigClampPlusSmallClamp2
BigClampPlusSmallClamp2.Parameters BigClampPlusSmallClamp1 SmallClamp2 SmallClamp2Ori

Volume DetClamp
DetClamp.Material steel_4130
DetClamp.Visibility 1
DetClamp.Color 67
DetClamp.Shape BigClampPlusSmallClamp2
DetClamp.Rotation 0.0 0.0 90.0
DetClamp.Position {3.9485+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp.Mother SingleDetector

Volume DetClamp2
DetClamp2.Material steel_4130
DetClamp2.Visibility 1
DetClamp2.Color 67
DetClamp2.Shape BigClampPlusSmallClamp2
DetClamp2.Rotation 0.0 0.0 90.0
DetClamp2.Position {-5.253+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp2.Mother SingleDetector

#Dummy approximation of the preload hardware 
# 304 Stainless Steel
Volume Preload
Preload.Material steel_304
Preload.Visibility 1
Preload.Color 71
Preload.Shape TUBE 0.0 0.255 0.3365 0.0 360.0

Preload.Copy Preload1
Preload.Copy Preload2
Preload.Copy Preload3
Preload.Copy Preload4

Preload1.Position {3.9485+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload1.Mother SingleDetector
Preload2.Position {3.9485+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload2.Mother SingleDetector
Preload3.Position {-5.253+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload3.Mother SingleDetector
Preload4.Position {-5.253+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload4.Mother SingleDetector



# Steel - very dummy approximation of the screws we need

#Volume ScrewDummy
#ScrewDummy.Material Steel_18_8
#ScrewDummy.Visibility 1
#ScrewDummy.Color 5
#ScrewDummy.Shape BRIK 0.5 0.5 0.375

#ScrewDummy.Copy ScrewDummy1
#ScrewDummy.Copy ScrewDummy2

#ScrewDummy1.Mother SingleDetector
#ScrewDummy1.Position  {4.5+Xshift}  {-3.6+Yshift}  -0.45

#ScrewDummy2.Mother SingleDetector
#ScrewDummy2.Position  {4.5+Xshift}  {3.0+Yshift}  -0.45


