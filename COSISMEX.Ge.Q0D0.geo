# A single germanium detector volume
# COSI SMEX model
#These constants were used to make the detector sit nicely in the mother volume
#Constant Xshift -0.627
Constant Xshift 1.342
Constant Yshift 0.991
Constant Zshift 0.0
#Constant Zshift -0.4

Volume DetectorGeD_0
DetectorGeD_0.Material vacuum
#DetectorGeD_0.Shape BRIK  5.3025  4.791  1.07
#DetectorGeD_0.Shape BRIK  7.7025  6.791  2.17
DetectorGeD_0.Shape BRIK  6.1225  5.791  {DetectorHalfHeight+.9+.4}
DetectorGeD_0.Visibility 0
DetectorGeD_0.Virtual true

#Shape BRIK GeWaferBlock
#GeWaferBlock.Parameters DetectorHalfWidth DetectorHalfWidth DetectorHalfHeight

#Shape TUBE WaferCutDisk
#WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

#Shape Intersection ActiveWafer
#ActiveWafer.Parameters GeWaferBlock WaferCutDisk

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK WaferOuterBox_GeD_0
WaferOuterBox_GeD_0.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE WaferCutDisk_GeD_0
WaferCutDisk_GeD_0.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection WholeWafer_GeD_0
WholeWafer_GeD_0.Parameters WaferOuterBox_GeD_0 WaferCutDisk_GeD_0

# Create the active wafer
Shape BRIK ActiveWaferOuterBox_GeD_0
ActiveWaferOuterBox_GeD_0.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE ActiveWaferCutDisk_GeD_0
ActiveWaferCutDisk_GeD_0.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection ActiveWafer_GeD_0
ActiveWafer_GeD_0.Parameters ActiveWaferOuterBox_GeD_0 ActiveWaferCutDisk_GeD_0

# Create the guard ring
Shape Subtraction GuardRing_AlmostThere_GeD_0
GuardRing_AlmostThere_GeD_0.Parameters WholeWafer_GeD_0 ActiveWafer_GeD_0

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection GuardRing_GeD_0
GuardRing_GeD_0.Parameters WaferOuterBox_GeD_0 GuardRing_AlmostThere_GeD_0

Volume Q0D0
Q0D0.Material active_ge_recoil
Q0D0.Visibility 1
Q0D0.Color 4
Q0D0.Shape ActiveWafer_GeD_0
#Come back and check this. Need to figure out where the 0,0 point is and what we are offsetting
Q0D0.Mother DetectorGeD_0
Q0D0.Position {-0.6555+Xshift} {0.0+Yshift} {Zshift}

Volume GeWaferGuardRing_GeD_0
GeWaferGuardRing_GeD_0.Material active_ge_recoil
GeWaferGuardRing_GeD_0.Visibility 1
GeWaferGuardRing_GeD_0.Color 3
GeWaferGuardRing_GeD_0.Shape GuardRing
GeWaferGuardRing_GeD_0.Position  {-0.6555+Xshift} {0.0+Yshift} {Zshift}
GeWaferGuardRing_GeD_0.Mother DetectorGeD_0

# Al dead layer on top
Shape BRIK stripsAl1_GeD_0
stripsAl1_GeD_0.Parameters 3.71 3.71 0.00025

Shape TUBE WaferCutDisk1_GeD_0
WaferCutDisk1_GeD_0.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead1_GeD_0
AlDead1_GeD_0.Parameters stripsAl1_GeD_0 WaferCutDisk1_GeD_0

Volume stripsAl_GeD_0
stripsAl_GeD_0.Material aluminum
stripsAl_GeD_0.Visibility 1
stripsAl_GeD_0.Color 7
stripsAl_GeD_0.Shape AlDead1_GeD_0
stripsAl_GeD_0.Mother DetectorGeD_0
stripsAl_GeD_0.Position {-0.6555+Xshift} {0.0+Yshift} {0.80025+Zshift}

Shape BRIK stripsAl2_GeD_0
stripsAl2_GeD_0.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk2_GeD_0
WaferCutDisk2_GeD_0.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead2_GeD_0
AlDead2_GeD_0.Parameters stripsAl2 WaferCutDisk2

# Al dead layer on the bottom
Volume stripsAlbot_GeD_0
stripsAlbot_GeD_0.Material aluminum
stripsAlbot_GeD_0.Visibility 1
stripsAlbot_GeD_0.Color 7
stripsAlbot_GeD_0.Shape AlDead2
stripsAlbot_GeD_0.Mother DetectorGeD_0
stripsAlbot_GeD_0.Position {-0.6555+Xshift} {0.0+Yshift} {-0.80025+Zshift}

# Handles etc.
Volume GeDead1_GeD_0
GeDead1_GeD_0.Material germanium
GeDead1_GeD_0.Visibility 1
GeDead1_GeD_0.Color 6
#GeDead1_GeD_0.Shape TRD1 1.21 2.88 0.076 0.39
GeDead1_GeD_0.Shape TRD1 1.569 3.05 0.102 0.4155

GeDead1_GeD_0.Copy GeDead1_GeD_0_01
GeDead1_GeD_0.Copy GeDead1_GeD_0_02

GeDead1_GeD_0_01.Mother DetectorGeD_0
GeDead1_GeD_0_01.Position  {3.785+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
GeDead1_GeD_0_01.Rotation 90.0  0.0 -90.0

GeDead1_GeD_0_02.Mother DetectorGeD_0
#GeDead1_GeD_0_02.Position  {-0.655+Xshift}  {-4.41+Yshift}  -0.698
GeDead1_GeD_0_02.Position  {-5.096+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
#GeDead1_GeD_0_02.Rotation 90.0  0.0  180.0
GeDead1_GeD_0_02.Rotation 90.0  0.0  90.0

Volume GeDead2_GeD_0
GeDead2_GeD_0.Material germanium
GeDead2_GeD_0.Visibility 1
GeDead2_GeD_0.Color 6
#GeDead2_GeD_0.Shape TRD1 1.21 2.54 0.30 0.287
GeDead2_GeD_0.Shape TRD1 1.569 2.766 0.198 0.2875

GeDead2_GeD_0.Copy GeDead2_GeD_0_01
GeDead2_GeD_0.Copy GeDead2_GeD_0_02

GeDead2_GeD_0_01.Mother DetectorGeD_0
GeDead2_GeD_0_01.Position  {3.913+Xshift}  {0.0+Yshift}  {-0.398+Zshift}
GeDead2_GeD_0_01.Rotation 90.0  0.0 -90.0


GeDead2_GeD_0_02.Mother DetectorGeD_0
GeDead2_GeD_0_02.Position  {-5.224+Xshift}   {0.0+Yshift}  {-0.398+Zshift}
GeDead2_GeD_0_02.Rotation 90.0  0.0  90.0


/////////////////////////////////////////////////////////
// Detector Holder
////////////////////////////////////////////////////////
// Detector holder on the side of the HV PCB Assembly


Shape BRIK HolderBlock_GeD_0
HolderBlock_GeD_0.Parameters 5.08 4.75 0.8545
Shape BRIK HolderBlockHole1_GeD_0
HolderBlockHole1_GeD_0.Parameters 3.886 4.78 0.274
Orientation HolderBlockHole1Ori_GeD_0
HolderBlockHole1Ori_GeD_0.Position -0.076 0.411 -0.5905

Shape Subtraction HolderBlockMinusHole1_GeD_0
HolderBlockMinusHole1_GeD_0.Parameters HolderBlock HolderBlockHole1 HolderBlockHole1Ori

Shape BRIK HolderBlockHole2_GeD_0
HolderBlockHole2_GeD_0.Parameters 3.9125 4.78 0.334
Orientation HolderBlockHole2Ori_GeD_0
HolderBlockHole2Ori_GeD_0.Position -0.1255 0.1825 0.5305

Shape Subtraction HolderBlockMinusHole2_GeD_0
HolderBlockMinusHole2_GeD_0.Parameters HolderBlockMinusHole1_GeD_0 HolderBlockHole2_GeD_0 HolderBlockHole2Ori_GeD_0

Shape BRIK HolderBlockHole3_GeD_0
#HolderBlockHole3.Parameters 4.223 4.2 0.565
HolderBlockHole3_GeD_0.Parameters 4.223 3.72 0.8545
Orientation HolderBlockHole3Ori_GeD_0
HolderBlockHole3Ori_GeD_0.Position 0.0 1.0365 0.0

Shape Subtraction HolderBlockMinusHole3_GeD_0
HolderBlockMinusHole3_GeD_0.Parameters HolderBlockMinusHole2_GeD_0 HolderBlockHole3_GeD_0 HolderBlockHole3Ori_GeD_0

Shape TRD1 HolderTrdHole1_GeD_0
HolderTrdHole1_GeD_0.Parameters 3.261 4.223 0.8545 0.4805
Orientation HolderTrdHole1Ori_GeD_0
HolderTrdHole1Ori_GeD_0.Position 0.0 -3.164 0.0
HolderTrdHole1Ori_GeD_0.Rotation -90.0 0.0 0.0

Shape Subtraction HolderBlockMinusTrdHole1_GeD_0
HolderBlockMinusTrdHole1_GeD_0.Parameters HolderBlockMinusHole3_GeD_0 HolderTrdHole1_GeD_0 HolderTrdHole1Ori_GeD_0

#this is the high voltage side
Shape BRIK HolderBlockHole4_GeD_0
HolderBlockHole4_GeD_0.Parameters 0.64 4.05 0.274
Orientation HolderBlockHole4Ori_GeD_0
HolderBlockHole4Ori_GeD_0.Position -4.445 0.702 -0.5905

Shape Subtraction HolderBlockMinusHole4_GeD_0
HolderBlockMinusHole4_GeD_0.Parameters HolderBlockMinusTrdHole1_GeD_0 HolderBlockHole4_GeD_0 HolderBlockHole4Ori_GeD_0

#This is the low voltage side opposite the HV side
Shape BRIK HolderBlockHole5_GeD_0
HolderBlockHole5_GeD_0.Parameters 0.64 3.93 0.274
Orientation HolderBlockHole5Ori_GeD_0
HolderBlockHole5Ori_GeD_0.Position 4.445 0.8255 -0.5905

Shape Subtraction HolderBlockMinusHole5_GeD_0
HolderBlockMinusHole5_GeD_0.Parameters HolderBlockMinusHole4_GeD_0 HolderBlockHole5_GeD_0 HolderBlockHole5Ori_GeD_0

Shape TRD1 HolderTrdHole2_GeD_0
HolderTrdHole2_GeD_0.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole2Ori_GeD_0
HolderTrdHole2Ori_GeD_0.Position -4.588 0.584 -0.192
HolderTrdHole2Ori_GeD_0.Rotation 90.0 0.0 90.0

Shape Subtraction HolderBlockMinusTrdHole2_GeD_0
HolderBlockMinusTrdHole2_GeD_0.Parameters HolderBlockMinusHole5_GeD_0 HolderTrdHole2_GeD_0 HolderTrdHole2Ori_GeD_0

Shape TRD1 HolderTrdHole3_GeD_0
HolderTrdHole3_GeD_0.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole3Ori_GeD_0
HolderTrdHole3Ori_GeD_0.Position 4.588 0.584 -0.192
HolderTrdHole3Ori_GeD_0.Rotation 90.0 0.0 -90.0

Shape Subtraction HolderBlockMinusTrdHole3_GeD_0
HolderBlockMinusTrdHole3_GeD_0.Parameters HolderBlockMinusTrdHole2_GeD_0 HolderTrdHole3_GeD_0 HolderTrdHole3Ori_GeD_0

Shape TRD1 HolderTrdHole4_GeD_0
HolderTrdHole4_GeD_0.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole4Ori_GeD_0
HolderTrdHole4Ori_GeD_0.Position 0.0 -4.0145 -0.18655
HolderTrdHole4Ori_GeD_0.Rotation 90.0 0.0 180.0

Shape Subtraction HolderBlockMinusTrdHole4_GeD_0
HolderBlockMinusTrdHole4_GeD_0.Parameters HolderBlockMinusTrdHole3_GeD_0 HolderTrdHole4_GeD_0 HolderTrdHole4Ori_GeD_0

Shape BRIK HolderBlockHole6_GeD_0
HolderBlockHole6_GeD_0.Parameters 5.1 0.1395 0.265
Orientation HolderBlockHole6Ori_GeD_0
HolderBlockHole6Ori_GeD_0.Position 0.0 -4.611 -0.5905

Shape Subtraction HolderBlockMinusBrikHole6_GeD_0
HolderBlockMinusBrikHole6_GeD_0.Parameters HolderBlockMinusTrdHole4_GeD_0 HolderBlockHole6 HolderBlockHole6Ori_GeD_0

Shape BRIK HolderBlockHole7_GeD_0
HolderBlockHole7_GeD_0.Parameters 0.4445 0.39 0.265
Orientation HolderBlockHole7Ori_GeD_0
HolderBlockHole7Ori_GeD_0.Position -4.6355 -4.36 -0.5905

Shape Subtraction HolderBlockMinusBrikHole7_GeD_0
HolderBlockMinusBrikHole7_GeD_0.Parameters HolderBlockMinusBrikHole6_GeD_0 HolderBlockHole7_GeD_0 HolderBlockHole7Ori_GeD_0

Shape BRIK HolderBlockHole8_GeD_0
HolderBlockHole8_GeD_0.Parameters 0.362 0.432 0.201
Orientation HolderBlockHole8Ori_GeD_0
HolderBlockHole8Ori_GeD_0.Position 4.718 -3.531 -0.654

Shape Subtraction HolderBlockMinusBrikHole8_GeD_0
HolderBlockMinusBrikHole8_GeD_0.Parameters HolderBlockMinusBrikHole7_GeD_0 HolderBlockHole8_GeD_0 HolderBlockHole8Ori_GeD_0

#Adding in the additional tabs on this side
Shape BRIK HolderBlockTab1_GeD_0
HolderBlockTab1_GeD_0.Parameters 0.076 0.305 0.47
Orientation HolderBlockTab1Ori_GeD_0
HolderBlockTab1Ori_GeD_0.Position -5.004 -4.445 -0.7955

Shape Union HolderBlockPlusBrikTab1_GeD_0
HolderBlockPlusBrikTab1_GeD_0.Parameters HolderBlockMinusBrikHole8_GeD_0 HolderBlockTab1_GeD_0 HolderBlockTab1Ori_GeD_0

Shape BRIK HolderBlockTab2_GeD_0
HolderBlockTab2_GeD_0.Parameters 0.076 0.254 0.4065
Orientation HolderBlockTab2Ori_GeD_0
HolderBlockTab2Ori_GeD_0.Position 5.004 -4.217 -0.8595

Shape Union HolderBlockPlusBrikTab2_GeD_0
HolderBlockPlusBrikTab2_GeD_0.Parameters HolderBlockPlusBrikTab1_GeD_0 HolderBlockTab2_GeD_0 HolderBlockTab2Ori_GeD_0

Shape BRIK HolderBlockTab3_GeD_0
HolderBlockTab3_GeD_0.Parameters 0.286 0.292 0.47
Orientation HolderBlockTab3Ori_GeD_0
HolderBlockTab3Ori_GeD_0.Position 4.508 4.458 -0.7565

Shape Union HolderBlockPlusBrikTab3_GeD_0
HolderBlockPlusBrikTab3_GeD_0.Parameters HolderBlockPlusBrikTab2_GeD_0 HolderBlockTab3_GeD_0 HolderBlockTab3Ori_GeD_0

Shape BRIK HolderBlockTab4_GeD_0
HolderBlockTab4_GeD_0.Parameters 0.743 0.254 0.2275
Orientation HolderBlockTab4Ori_GeD_0
HolderBlockTab4Ori_GeD_0.Position -4.337 5.004 -.226

Shape Union HolderBlockPlusBrikTab4_GeD_0
HolderBlockPlusBrikTab4_GeD_0.Parameters HolderBlockPlusBrikTab3_GeD_0 HolderBlockTab4_GeD_0 HolderBlockTab4Ori_GeD_0

Shape BRIK HolderBlockTab5_GeD_0
HolderBlockTab5_GeD_0.Parameters 0.3685 0.1015 0.4065
Orientation HolderBlockTab5Ori_GeD_0
HolderBlockTab5Ori_GeD_0.Position -4.7115 5.1565 -.86

Shape Union HolderBlockPlusBrikTab5_GeD_0
HolderBlockPlusBrikTab5_GeD_0.Parameters HolderBlockPlusBrikTab4_GeD_0 HolderBlockTab5_GeD_0 HolderBlockTab5Ori_GeD_0

Shape BRIK HolderBlockTab6_GeD_0
HolderBlockTab6_GeD_0.Parameters 0.457 0.1525 0.2415
Orientation HolderBlockTab6Ori_GeD_0
HolderBlockTab6Ori_GeD_0.Position -5.537 4.8005 0.296

Shape Union HolderBlockPlusBrikTab6_GeD_0
HolderBlockPlusBrikTab6_GeD_0.Parameters HolderBlockPlusBrikTab5_GeD_0 HolderBlockTab6_GeD_0 HolderBlockTab6Ori_GeD_0

#following two tabs are on the side closest to the HV board
Shape BRIK HolderBlockTab7_GeD_0
HolderBlockTab7_GeD_0.Parameters 0.457 0.216 0.2415
Orientation HolderBlockTab7Ori_GeD_0
HolderBlockTab7Ori_GeD_0.Position -5.537 -4.242 0.296

Shape Union HolderBlockPlusBrikTab7_GeD_0
HolderBlockPlusBrikTab7_GeD_0.Parameters HolderBlockPlusBrikTab6_GeD_0 HolderBlockTab7_GeD_0 HolderBlockTab7Ori_GeD_0

Shape BRIK HolderBlockTab8_GeD_0
HolderBlockTab8_GeD_0.Parameters 0.178 1.7465 1.27
Orientation HolderBlockTab8Ori_GeD_0
HolderBlockTab8Ori_GeD_0.Position 5.258 -3.6385 0.8165

Shape Union HolderBlockPlusBrikTab8_GeD_0
HolderBlockPlusBrikTab8_GeD_0.Parameters HolderBlockPlusBrikTab7_GeD_0 HolderBlockTab8_GeD_0 HolderBlockTab8Ori_GeD_0

#Following two tabs are the tabs that line up with the LV board
Shape BRIK HolderBlockTab9_GeD_0
HolderBlockTab9_GeD_0.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab9Ori_GeD_0
HolderBlockTab9Ori_GeD_0.Position -4.4325 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab9_GeD_0
HolderBlockPlusBrikTab9_GeD_0.Parameters HolderBlockPlusBrikTab8_GeD_0 HolderBlockTab9_GeD_0 HolderBlockTab9Ori_GeD_0

Shape BRIK HolderBlockTab10_GeD_0
HolderBlockTab10_GeD_0.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab10Ori_GeD_0
HolderBlockTab10Ori_GeD_0.Position 4.1655 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab10_GeD_0
HolderBlockPlusBrikTab10_GeD_0.Parameters HolderBlockPlusBrikTab9_GeD_0 HolderBlockTab10_GeD_0 HolderBlockTab10Ori_GeD_0

#Now going to the opposite side of the holder
#Like above, I will start by subtracting then move to adding mass
Shape BRIK HolderBlockHole9_GeD_0
HolderBlockHole9_GeD_0.Parameters 0.445 4.2035 0.33
Orientation HolderBlockHole9Ori_GeD_0
HolderBlockHole9Ori_GeD_0.Position 4.483 0.0385 0.5305

Shape Subtraction HolderBlockPlusBrikHole9_GeD_0
HolderBlockPlusBrikHole9_GeD_0.Parameters HolderBlockPlusBrikTab10_GeD_0 HolderBlockHole9_GeD_0 HolderBlockHole9Ori_GeD_0

Shape BRIK HolderBlockHole10_GeD_0
HolderBlockHole10_GeD_0.Parameters 0.3525 4.045 0.33
Orientation HolderBlockHole10Ori_GeD_0
HolderBlockHole10Ori_GeD_0.Position -4.7275 0.603 0.5305

Shape Subtraction HolderBlockPlusBrikHole10_GeD_0
HolderBlockPlusBrikHole10_GeD_0.Parameters HolderBlockPlusBrikHole9_GeD_0 HolderBlockHole10_GeD_0 HolderBlockHole10Ori_GeD_0

#Adding mass now
Shape BRIK HolderBlockTab11_GeD_0
HolderBlockTab11_GeD_0.Parameters 0.254 0.305 0.616
Orientation HolderBlockTab11Ori_GeD_0
HolderBlockTab11Ori_GeD_0.Position -4.674 -4.445 1.4705

Shape Union HolderBlockPlusBrikTab11_GeD_0
HolderBlockPlusBrikTab11_GeD_0.Parameters HolderBlockPlusBrikHole10_GeD_0 HolderBlockTab11_GeD_0 HolderBlockTab11Ori_GeD_0

Shape BRIK HolderBlockTab112_GeD_0
HolderBlockTab112_GeD_0.Parameters 0.076 0.305 0.2095
Orientation HolderBlockTab112Ori_GeD_0
HolderBlockTab112Ori_GeD_0.Position -5.004 -4.445 1.064

Shape Union HolderBlockPlusBrikTab112_GeD_0
HolderBlockPlusBrikTab112_GeD_0.Parameters HolderBlockPlusBrikTab11_GeD_0 HolderBlockTab112_GeD_0 HolderBlockTab112Ori_GeD_0

Shape BRIK HolderBlockTab12_GeD_0
HolderBlockTab12_GeD_0.Parameters 0.743 0.1015 0.4265
Orientation HolderBlockTab12Ori_GeD_0
HolderBlockTab12Ori_GeD_0.Position -4.337 4.8515 .428

Shape Union HolderBlockPlusBrikTab12_GeD_0
HolderBlockPlusBrikTab12_GeD_0.Parameters HolderBlockPlusBrikTab112_GeD_0 HolderBlockTab12_GeD_0 HolderBlockTab12Ori_GeD_0

#This tab should be 0.8045 apparentl in the z direction
Shape BRIK HolderBlockTab13_GeD_0
HolderBlockTab13_GeD_0.Parameters 0.3685 0.051 0.4045
Orientation HolderBlockTab13Ori_GeD_0
HolderBlockTab13Ori_GeD_0.Position -3.9625 5.004 1.282

Shape Union HolderBlockPlusBrikTab13_GeD_0
HolderBlockPlusBrikTab13_GeD_0.Parameters HolderBlockPlusBrikTab12_GeD_0 HolderBlockTab13_GeD_0 HolderBlockTab13Ori_GeD_0

Shape BRIK HolderBlockTab14_GeD_0
HolderBlockTab14_GeD_0.Parameters 0.286 0.292 .5335
Orientation HolderBlockTab14Ori_GeD_0
HolderBlockTab14Ori_GeD_0.Position 4.508 4.458 0.74

Shape Union HolderBlockPlusBrikTab14_GeD_0
HolderBlockPlusBrikTab14_GeD_0.Parameters HolderBlockPlusBrikTab13_GeD_0 HolderBlockTab14_GeD_0 HolderBlockTab14Ori_GeD_0

Shape BRIK HolderBlockTab15_GeD_0
HolderBlockTab15_GeD_0.Parameters 0.076 0.254 0.6415
Orientation HolderBlockTab15Ori_GeD_0
HolderBlockTab15Ori_GeD_0.Position 5.004 3.658 1.445

Shape Union HolderBlockPlusBrikTab15_GeD_0
HolderBlockPlusBrikTab15_GeD_0.Parameters HolderBlockPlusBrikTab14_GeD_0 HolderBlockTab15_GeD_0 HolderBlockTab15Ori_GeD_0

#Hole for the stupid skewer things
Shape TUBS HolderRodHole_GeD_0
HolderRodHole_GeD_0.Parameters 0.0 0.16 2.11 0.0 360.0
Orientation HolderRodHole_Ori_GeD_0
HolderRodHole_Ori_GeD_0.Position 4.508 4.471 0.0

Shape SUBTRACTION HolderBlockMinusRodHole_GeD_0
HolderBlockMinusRodHole_GeD_0.Parameters HolderBlockPlusBrikTab15_GeD_0 HolderRodHole_GeD_0 HolderRodHole_Ori_GeD_0

Volume Holder_GeD_0
Holder_GeD_0.Material al6061
Holder_GeD_0.Visibility 1
Holder_QD00.Color 15
Holder_GeD_0.Shape HolderBlockMinusRodHole_GeD_0
Holder_GeD_0.Rotation 0.0 0.0 0.0
Holder_GeD_0.Position {-0.6555+Xshift} {-0.574+Yshift} {-.0005+Zshift}
Holder_GeD_0.Mother DetectorGeD_0

# adding new aluminum bar that is on the far end of the holder on the opposite side of the LV interposer board
Volume AlBar_GeD_0
AlBar_GeD_0.Material al6061
AlBar_GeD_0.Visibility 1
AlBar_GeD_0.Color 20
AlBar_GeD_0.Shape Brik 3.9 0.0735 0.273
#AlBar_GeD_0.Position  {-0.582+Xshift} {4.2495+Yshift} {-0.067+Zshift}
AlBar_GeD_0.Position  {-.345+Xshift} {4.2345+Yshift} {-0.067+Zshift}
AlBar_GeD_0.Mother DetectorGeD_0


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
#AlSide1.Mother DetectorGeD_0
#AlSide1.Position {-5.307+Xshift}  {-0.547+Yshift}  0.206

#Updating this to be a boolean shape 

Shape BRIK LV_Block_GeD_0
LV_Block_GeD_0.Parameters 4.661 1.552 0.0795
Shape TRD1 LV_TRD_Hole_GeD_0
LV_TRD_Hole_GeD_0.Parameters 3.7245 2.756 0.08 0.4295
Orientation LV_TRD_HoleOri_GeD_0
LV_TRD_HoleOri_GeD_0.Rotation 90.0 0.0 0.0
LV_TRD_HoleOri_GeD_0.Position 0.1445 1.1225 0.0

Shape Subtraction LVBlockMinusTRDHole_GeD_0
LVBlockMinusTRDHole_GeD_0.Parameters LV_Block_GeD_0 LV_TRD_Hole_GeD_0 LV_TRD_HoleOri_GeD_0

Shape BRIK LVL3_GeD_0
LVL3_GeD_0.Parameters .203 .3365 .08
Orientation LVL3_Ori_GeD_0
LVL3_Ori_GeD_0.Position 4.458 1.2155  0.0

Shape Subtraction LVBlockMinusLVL3_GeD_0
LVBlockMinusLVL3_GeD_0.Parameters LVBlockMinusTRDHole_GeD_0 LVL3_GeD_0 LVL3_Ori_GeD_0

Shape BRIK LVL4_GeD_0
LVL4_GeD_0.Parameters .2795 .536 .08
Orientation LVL4_Ori_GeD_0
LVL4_Ori_GeD_0.Position -4.3815 1.016  0.0

Shape Subtraction LVBlockMinusLVL4_GeD_0
LVBlockMinusLVL4_GeD_0.Parameters LVBlockMinusLVL3_GeD_0 LVL4_GeD_0 LVL4_Ori_GeD_0

Shape BRIK LVL6_GeD_0
LVL6_GeD_0.Parameters .303 .5535 .08
Orientation LVL6_Ori_GeD_0
LVL6_Ori_GeD_0.Position -4.458 -0.6825  0.0

Shape Subtraction LVBlockMinusLVL6_GeD_0
LVBlockMinusLVL6_GeD_0.Parameters LVBlockMinusLVL4_GeD_0 LVL6_GeD_0 LVL6_Ori_GeD_0


Volume LVL1_GeD_0
LVL1_GeD_0.Material ro4003
LVL1_GeD_0.Visibility 1
LVL1_GeD_0.Color 52
LVL1_GeD_0.Shape LVBlockMinusLVL6
LVL1_GeD_0.Mother DetectorGeD_0
#LVL1_GeD_0.Position {-0.1435+Xshift} {-3.691+Yshift} 0.967
# Seems like the LV board is shifted slightly off center. Having a hard time getting this measurement
# therefore, if something seems off check this shift here. Currently saying it is shifted by .178 cm
LVL1_GeD_0.Position {-0.8335+Xshift} {-4.417+Yshift} {-0.935+Zshift}

Volume LVL5_GeD_0
LVL5_GeD_0.Material ro4003
LVL5_GeD_0.Mother DetectorGeD_0
LVL5_GeD_0.Shape BRIK 4.661 0.158 0.978
LVL5_GeD_0.Visibility 1
LVL5_GeD_0.Color 3
LVL5_GeD_0.Position {-0.8335+Xshift} {-6.127+Yshift} {-0.0365+Zshift}

//Flex Clamp Block
Volume LVFlexBlock_GeD_0
#LVFlexBlock_GeD_0.Material al6061
LVFlexBlock_GeD_0.Material steel_304
LVFlexBlock_GeD_0.Mother DetectorGeD_0
LVFlexBlock_GeD_0.Visibility 1
LVFlexBlock_GeD_0.Color 7
LVFlexBlock_GeD_0.Shape BRIK 3.9155 0.2385 0.286
LVFlexBlock_GeD_0.Position {-0.929+Xshift} {-6.5235+Yshift} {0.4015+Zshift}

Volume LVFlexSmBlock1_GeD_0
#LVFlexSmBlock1_GeD_0.Material al6061
LVFlexSmBlock1_GeD_0.Material steel_304
LVFlexSmBlock1_GeD_0.Mother DetectorGeD_0
LVFlexSmBlock1_GeD_0.Visibility 1
LVFlexSmBlock1_GeD_0.Color 7
LVFlexSmBlock1_GeD_0.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock1_GeD_0.Position {2.8235+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

Volume LVFlexSmBlock2_GeD_0
LVFlexSmBlock2_GeD_0.Material steel_304
LVFlexSmBlock2_GeD_0.Mother DetectorGeD_0
LVFlexSmBlock2_GeD_0.Visibility 1
LVFlexSmBlock2_GeD_0.Color 7
LVFlexSmBlock2_GeD_0.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock2_GeD_0.Position {-4.6815+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

////////////////////////////////////////////////
// High voltage boards
_GeD_0///////////////////////////////////////////////
#Making this a Boolean shape
Shape BRIK HVBlock_GeD_0
HVBlock_GeD_0.Parameters 1.5645 4.934 0.0795
Shape BRIK HVLH1_GeD_0
HVLH1_GeD_0.Parameters 1.128 0.3225 0.08
Orientation HVLH1_Ori_GeD_0
HVLH1_Ori_GeD_0.Position .4365 -4.6115 0.0

Shape SUBTRACTION HVBlockMinusHVLH1_GeD_0
HVBlockMinusHVLH1_GeD_0.Parameters HVBlock_GeD_0 HVLH1_GeD_0 HVLH1_Ori_GeD_0

Shape BRIK HVLH2_GeD_0
HVLH2_GeD_0.Parameters 0.32 0.292 0.08
Orientation HVLH2_Ori_GeD_0
HVLH2_Ori_GeD_0.Position 1.2445 -3.997 0.0

Shape SUBTRACTION HVBlockMinusHVLH2_GeD_0
HVBlockMinusHVLH2_GeD_0.Parameters HVBlockMinusHVLH1_GeD_0 HVLH2_GeD_0 HVLH2_Ori_GeD_0

Shape BRIK HVLH3_GeD_0
HVLH3_GeD_0.Parameters 1.168 0.089 0.08
Orientation HVLH3_Ori_GeD_0
HVLH3_Ori_GeD_0.Position 0.3965 4.845 0.0

Shape SUBTRACTION HVBlockMinusHVLH3_GeD_0
HVBlockMinusHVLH3_GeD_0.Parameters HVBlockMinusHVLH2_GeD_0 HVLH3_GeD_0 HVLH3_Ori_GeD_0

Shape BRIK HVLH4_GeD_0
HVLH4_GeD_0.Parameters 0.397 0.165 0.08
Orientation HVLH4_Ori_GeD_0
HVLH4_Ori_GeD_0.Position 1.1675 4.591 0.0

Shape SUBTRACTION HVBlockMinusHVLH4_GeD_0
HVBlockMinusHVLH4_GeD_0.Parameters HVBlockMinusHVLH3_GeD_0 HVLH4_GeD_0 HVLH4_Ori_GeD_0

Shape TRD1 HVLH5_GeD_0
HVLH5_GeD_0.Parameters 3.7245 2.756 0.09 0.4295
Orientation HVLH5_Ori_GeD_0
HVLH5_Ori_GeD_0.Position 1.135 0.401 0.0
HVLH5_Ori_GeD_0.Rotation 90.0 0.0 270.0

Shape SUBTRACTION HVBlockMinusHVLH5_GeD_0
HVBlockMinusHVLH5_GeD_0.Parameters HVBlockMinusHVLH4_GeD_0 HVLH5_GeD_0 HVLH5_Ori_GeD_0

Volume HVL1_GeD_0
HVL1_GeD_0.Material ro4003
HVL1_GeD_0.Visibility 1
HVL1_GeD_0.Color 94
HVL1_GeD_0.Shape HVBlockMinusHVLH5
HVL1_GeD_0.Mother DetectorGeD_0
HVL1_GeD_0.Position {-5.085+Xshift} {-0.4+Yshift} {.934+Zshift}
#HVL1_GeD_0.Position {-5.085+Xshift} {-0.4+Yshift} .88
HVL1_GeD_0.Rotation 0.0 0.0 0.0

#Making the HVL5 board also a boolean shape

Shape BRIK HVL5Block_GeD_0
HVL5Block_GeD_0.Parameters 0.1585 4.934 0.978
Shape BRIK HVL5H1_GeD_0
HVL5H1_GeD_0.Parameters 0.16 0.216 0.505
Orientation HVL5H1_Ori_GeD_0
HVL5H1_Ori_GeD_0.Position 0.0 -4.718 -0.473

Shape SUBTRACTION HVL5BlockMinusH1_GeD_0
HVL5BlockMinusH1_GeD_0.Parameters HVL5Block_GeD_0 HVL5H1_GeD_0 HVL5H1_Ori_GeD_0

Shape BRIK HVL5H2_GeD_0
HVL5H2_GeD_0.Parameters 0.16 0.216 0.2445
Orientation HVL5H2_Ori_GeD_0
HVL5H2_Ori_GeD_0.Position 0.0 -4.718 0.7335

Shape SUBTRACTION HVL5BlockMinusH2_GeD_0
HVL5BlockMinusH2_GeD_0.Parameters HVL5BlockMinusH1_GeD_0 HVL5H2_GeD_0 HVL5H2_Ori_GeD_0

Shape BRIK HVL5H3_GeD_0
HVL5H3_GeD_0.Parameters 0.16 0.1335 0.4365
Orientation HVL5H3_Ori_GeD_0
HVL5H3_Ori_GeD_0.Position 0.0 4.8005 -0.5415

Shape SUBTRACTION HVL5BlockMinusH3_GeD_0
HVL5BlockMinusH3_GeD_0.Parameters HVL5BlockMinusH2_GeD_0 HVL5H3_GeD_0 HVL5H3_Ori_GeD_0

Volume HVL5_GeD_0
HVL5_GeD_0.Material roTMM3
HVL5_GeD_0.Mother DetectorGeD_0
HVL5_GeD_0.Visibility 1
HVL5_GeD_0.Color 3
HVL5_GeD_0.Shape HVL5BlockMinusH3
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -0.062
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -.0185
HVL5_GeD_0.Position {-6.808+Xshift} {-0.4+Yshift} {.0355+Zshift}

#adding a block to represent the capacitors
Volume HV_Caps_GeD_0
HV_Caps_GeD_0.Material Class1Cap
HV_Caps_GeD_0.Mother DetectorGeD_0
HV_Caps_GeD_0.Visibility 1
HV_Caps_GeD_0.Color 4
HV_Caps_GeD_0.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps_GeD_0.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)+0.5*.6401}

Volume HV_Caps2_GeD_0
HV_Caps2_GeD_0.Material Class1Cap
HV_Caps2_GeD_0.Mother DetectorGeD_0
HV_Caps2_GeD_0.Visibility 1
HV_Caps2_GeD_0.Color 4
HV_Caps2_GeD_0.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps2_GeD_0.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}


#Adding in solder
Volume DetSolder_GeD_0
DetSolder_GeD_0.Material solder
DetSolder_GeD_0.Visibility 1
DetSolder_GeD_0.Color 12
DetSolder_GeD_0.Shape BRIK DetectorHalfWidth .3 0.1217
DetSolder_GeD_0.Rotation 90.0 0.0 90.0
DetSolder_GeD_0.Position {(-6.808+Xshift)+2*0.5*0.574+.16+.1217} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}
DetSolder_GeD_0.Mother DetectorGeD_0


//Flex Clamp Block
Volume HVFlexBlock_GeD_0
HVFlexBlock_GeD_0.Material al6061
HVFlexBlock_GeD_0.Mother DetectorGeD_0
HVFlexBlock_GeD_0.Visibility 1
HVFlexBlock_GeD_0.Color 7
HVFlexBlock_GeD_0.Shape BRIK 0.2385 3.9155 0.286
HVFlexBlock_GeD_0.Position {-7.2055+Xshift} {-0.1995+Yshift} {-0.3945+Zshift}

Volume HVFlexSmBlock1_GeD_0
HVFlexSmBlock1_GeD_0.Material al6061
HVFlexSmBlock1_GeD_0.Mother DetectorGeD_0
HVFlexSmBlock1_GeD_0.Visibility 1
HVFlexSmBlock1_GeD_0.Color 7
HVFlexSmBlock1_GeD_0.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock1_GeD_0.Position {-7.2055+Xshift} {3.553+Yshift} {0.1895+Zshift}

Volume HVFlexSmBlock2_GeD_0
HVFlexSmBlock2_GeD_0.Material al6061
HVFlexSmBlock2_GeD_0.Mother DetectorGeD_0
HVFlexSmBlock2_GeD_0.Visibility 1
HVFlexSmBlock2_GeD_0.Color 7
HVFlexSmBlock2_GeD_0.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock2_GeD_0.Position {-7.2055+Xshift} {-3.952+Yshift} {0.1895+Zshift}

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
Volume In_PassGe_GeD_0
In_PassGe_GeD_0.Material indium
In_PassGe_GeD_0.Visibility 1
In_PassGe_GeD_0.Color 90
In_PassGe_GeD_0.Shape BRIK .3555 1.2445 .005

In_PassGe_GeD_0.Copy In_PassGe1_GeD_0
In_PassGe_GeD_0.Copy In_PassGe2_GeD_0
In_PassGe_GeD_0.Copy In_PassGe3_GeD_0
In_PassGe_GeD_0.Copy In_PassGe4_GeD_0


In_PassGe1_GeD_0.Mother DetectorGeD_0
In_PassGe1_GeD_0.Position {3.785+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe2_GeD_0.Mother DetectorGeD_0
In_PassGe2_GeD_0.Position {3.785+Xshift} {0.0+Yshift} {-0.08+Zshift}
In_PassGe3_GeD_0.Mother DetectorGeD_0
In_PassGe3_GeD_0.Position {-5.096+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe4_GeD_0.Mother DetectorGeD_0
In_PassGe4_GeD_0.Position {-5.096+Xshift} {0.0+Yshift} {-0.08+Zshift}

Volume In_PassAlNi_GeD_0
In_PassAlNi_GeD_0.Material indium
In_PassAlNi_GeD_0.Visibility 1
In_PassAlNi_GeD_0.Color 90
In_PassAlNi_GeD_0.Shape BRIK .3555 1.2445 .05

In_PassAlNi_GeD_0.Copy In_PassAlNi1_GeD_0
In_PassAlNi_GeD_0.Copy In_PassAlNi2_GeD_0

# Not sure why the same z positions are not working for In_PassGe3 and In_PassAlNi_GeD_02 but this is the only way I can remove the overlap.
In_PassAlNi1_GeD_0.Mother DetectorGeD_0
In_PassAlNi1_GeD_0.Position {3.785+Xshift} {0.0+Yshift} {-0.140+Zshift}
In_PassAlNi2_GeD_0.Mother DetectorGeD_0
In_PassAlNi2_GeD_0.Position {-5.096+Xshift} {0.0+Yshift} {-0.140+Zshift}

# Not including the detector clamp buttons

#Dummy approximation of the detector clamps
# 4130 Steel
Shape Brik BigClamp_GeD_0
BigClamp_GeD_0.Parameters 3.041 0.3175 0.178 
Shape Brik SmallClamp1_GeD_0
SmallClamp1_GeD_0.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp1Ori_GeD_0
SmallClamp1Ori_GeD_0.Position 2.99 0.0 0.4465

Shape UNION BigClampPlusSmallClamp1_GeD_0
BigClampPlusSmallClamp1_GeD_0.Parameters BigClamp_GeD_0 SmallClamp1_GeD_0 SmallClamp1Ori_GeD_0

Shape Brik SmallClamp2_GeD_0
SmallClamp2_GeD_0.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp2Ori_GeD_0
SmallClamp2Ori_GeD_0.Position -2.99 0.0 0.4465


Shape Union BigClampPlusSmallClamp2_GeD_0
BigClampPlusSmallClamp2_GeD_0.Parameters BigClampPlusSmallClamp1_GeD_0 SmallClamp2_GeD_0 SmallClamp2Ori_GeD_0

Volume DetClamp_GeD_0
DetClamp_GeD_0.Material steel_4130
DetClamp_GeD_0.Visibility 1
DetClamp_GeD_0.Color 67
DetClamp_GeD_0.Shape BigClampPlusSmallClamp2
DetClamp_GeD_0.Rotation 0.0 0.0 90.0
DetClamp_GeD_0.Position {3.9485+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp_GeD_0.Mother DetectorGeD_0

Volume DetClamp2_GeD_0
DetClamp2_GeD_0.Material steel_4130
DetClamp2_GeD_0.Visibility 1
DetClamp2_GeD_0.Color 67
DetClamp2_GeD_0.Shape BigClampPlusSmallClamp2
DetClamp2_GeD_0.Rotation 0.0 0.0 90.0
DetClamp2_GeD_0.Position {-5.253+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp2_GeD_0.Mother DetectorGeD_0

#Dummy approximation of the preload hardware 
# 304 Stainless Steel
Volume Preload_GeD_0
Preload_GeD_0.Material steel_304
Preload_GeD_0.Visibility 1
Preload_GeD_0.Color 71
Preload_GeD_0.Shape TUBE 0.0 0.255 0.3365 0.0 360.0

Preload_GeD_0.Copy Preload1_GeD_0
Preload_GeD_0.Copy Preload2_GeD_0
Preload_GeD_0.Copy Preload3_GeD_0
Preload_GeD_0.Copy Preload4_GeD_0

Preload1_GeD_0.Position {3.9485+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload1_GeD_0.Mother DetectorGeD_0
Preload2_GeD_0.Position {3.9485+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload2_GeD_0.Mother DetectorGeD_0
Preload3_GeD_0.Position {-5.253+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload3_GeD_0.Mother DetectorGeD_0
Preload4_GeD_0.Position {-5.253+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload4_GeD_0.Mother DetectorGeD_0



# Steel - very dummy approximation of the screws we need

#Volume ScrewDummy
#ScrewDummy.Material Steel_18_8
#ScrewDummy.Visibility 1
#ScrewDummy.Color 5
#ScrewDummy.Shape BRIK 0.5 0.5 0.375

#ScrewDummy.Copy ScrewDummy1
#ScrewDummy.Copy ScrewDummy2

#ScrewDummy1.Mother DetectorGeD_0
#ScrewDummy1.Position  {4.5+Xshift}  {-3.6+Yshift}  -0.45

#ScrewDummy2.Mother DetectorGeD_0
#ScrewDummy2.Position  {4.5+Xshift}  {3.0+Yshift}  -0.45


