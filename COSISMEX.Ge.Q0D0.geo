# A single germanium detector volume
# COSI SMEX model
#These constants were used to make the detector sit nicely in the mother volume
#Constant Xshift -0.627
Constant Xshift 1.342
Constant Yshift 0.991
Constant Zshift 0.0
#Constant Zshift -0.4

Volume DetectorQ0D0
DetectorQ0D0.Material vacuum
#DetectorQ0D0.Shape BRIK  5.3025  4.791  1.07
#DetectorQ0D0.Shape BRIK  7.7025  6.791  2.17
DetectorQ0D0.Shape BRIK  6.1225  5.791  {DetectorHalfHeight+.9+.4}
DetectorQ0D0.Visibility 0
DetectorQ0D0.Virtual true

#Shape BRIK GeWaferBlock
#GeWaferBlock.Parameters DetectorHalfWidth DetectorHalfWidth DetectorHalfHeight

#Shape TUBE WaferCutDisk
#WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

#Shape Intersection ActiveWafer
#ActiveWafer.Parameters GeWaferBlock WaferCutDisk

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK WaferOuterBox_Q0D0
WaferOuterBox_Q0D0.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE WaferCutDisk_Q0D0
WaferCutDisk_Q0D0.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection WholeWafer_Q0D0
WholeWafer_Q0D0.Parameters WaferOuterBox_Q0D0 WaferCutDisk_Q0D0

# Create the active wafer
Shape BRIK ActiveWaferOuterBox_Q0D0
ActiveWaferOuterBox_Q0D0.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE ActiveWaferCutDisk_Q0D0
ActiveWaferCutDisk_Q0D0.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection ActiveWafer_Q0D0
ActiveWafer_Q0D0.Parameters ActiveWaferOuterBox_Q0D0 ActiveWaferCutDisk_Q0D0

# Create the guard ring
Shape Subtraction GuardRing_AlmostThere_Q0D0
GuardRing_AlmostThere_Q0D0.Parameters WholeWafer_Q0D0 ActiveWafer_Q0D0

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection GuardRing_Q0D0
GuardRing_Q0D0.Parameters WaferOuterBox_Q0D0 GuardRing_AlmostThere_Q0D0

Volume Q0D0_GeWafer
Q0D0_GeWafer.Material active_ge_recoil
Q0D0_GeWafer.Visibility 1
Q0D0_GeWafer.Color 4
Q0D0_GeWafer.Shape ActiveWafer_Q0D0
#Come back and check this. Need to figure out where the 0,0 point is and what we are offsetting
Q0D0_GeWafer.Mother DetectorQ0D0
Q0D0_GeWafer.Position {-0.6555+Xshift} {0.0+Yshift} {Zshift}

Volume GeWaferGuardRing_Q0D0
GeWaferGuardRing_Q0D0.Material active_ge_recoil
GeWaferGuardRing_Q0D0.Visibility 1
GeWaferGuardRing_Q0D0.Color 3
GeWaferGuardRing_Q0D0.Shape GuardRing
GeWaferGuardRing_Q0D0.Position  {-0.6555+Xshift} {0.0+Yshift} {Zshift}
GeWaferGuardRing_Q0D0.Mother DetectorQ0D0

# Al dead layer on top
Shape BRIK stripsAl1_Q0D0
stripsAl1_Q0D0.Parameters 3.71 3.71 0.00025

Shape TUBE WaferCutDisk1_Q0D0
WaferCutDisk1_Q0D0.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead1_Q0D0
AlDead1_Q0D0.Parameters stripsAl1_Q0D0 WaferCutDisk1_Q0D0

Volume stripsAl_Q0D0
stripsAl_Q0D0.Material aluminum
stripsAl_Q0D0.Visibility 1
stripsAl_Q0D0.Color 7
stripsAl_Q0D0.Shape AlDead1_Q0D0
stripsAl_Q0D0.Mother DetectorQ0D0
stripsAl_Q0D0.Position {-0.6555+Xshift} {0.0+Yshift} {0.80025+Zshift}

Shape BRIK stripsAl2_Q0D0
stripsAl2_Q0D0.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk2_Q0D0
WaferCutDisk2_Q0D0.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead2_Q0D0
AlDead2_Q0D0.Parameters stripsAl2 WaferCutDisk2

# Al dead layer on the bottom
Volume stripsAlbot_Q0D0
stripsAlbot_Q0D0.Material aluminum
stripsAlbot_Q0D0.Visibility 1
stripsAlbot_Q0D0.Color 7
stripsAlbot_Q0D0.Shape AlDead2
stripsAlbot_Q0D0.Mother DetectorQ0D0
stripsAlbot_Q0D0.Position {-0.6555+Xshift} {0.0+Yshift} {-0.80025+Zshift}

# Handles etc.
Volume GeDead1_Q0D0
GeDead1_Q0D0.Material germanium
GeDead1_Q0D0.Visibility 1
GeDead1_Q0D0.Color 6
#GeDead1_Q0D0.Shape TRD1 1.21 2.88 0.076 0.39
GeDead1_Q0D0.Shape TRD1 1.569 3.05 0.102 0.4155

GeDead1_Q0D0.Copy GeDead1_Q0D0_01
GeDead1_Q0D0.Copy GeDead1_Q0D0_02

GeDead1_Q0D0_01.Mother DetectorQ0D0
GeDead1_Q0D0_01.Position  {3.785+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
GeDead1_Q0D0_01.Rotation 90.0  0.0 -90.0

GeDead1_Q0D0_02.Mother DetectorQ0D0
#GeDead1_Q0D0_02.Position  {-0.655+Xshift}  {-4.41+Yshift}  -0.698
GeDead1_Q0D0_02.Position  {-5.096+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
#GeDead1_Q0D0_02.Rotation 90.0  0.0  180.0
GeDead1_Q0D0_02.Rotation 90.0  0.0  90.0

Volume GeDead2_Q0D0
GeDead2_Q0D0.Material germanium
GeDead2_Q0D0.Visibility 1
GeDead2_Q0D0.Color 6
#GeDead2_Q0D0.Shape TRD1 1.21 2.54 0.30 0.287
GeDead2_Q0D0.Shape TRD1 1.569 2.766 0.198 0.2875

GeDead2_Q0D0.Copy GeDead2_Q0D0_01
GeDead2_Q0D0.Copy GeDead2_Q0D0_02

GeDead2_Q0D0_01.Mother DetectorQ0D0
GeDead2_Q0D0_01.Position  {3.913+Xshift}  {0.0+Yshift}  {-0.398+Zshift}
GeDead2_Q0D0_01.Rotation 90.0  0.0 -90.0


GeDead2_Q0D0_02.Mother DetectorQ0D0
GeDead2_Q0D0_02.Position  {-5.224+Xshift}   {0.0+Yshift}  {-0.398+Zshift}
GeDead2_Q0D0_02.Rotation 90.0  0.0  90.0


/////////////////////////////////////////////////////////
// Detector Holder
////////////////////////////////////////////////////////
// Detector holder on the side of the HV PCB Assembly


Shape BRIK HolderBlock_Q0D0
HolderBlock_Q0D0.Parameters 5.08 4.75 0.8545
Shape BRIK HolderBlockHole1_Q0D0
HolderBlockHole1_Q0D0.Parameters 3.886 4.78 0.274
Orientation HolderBlockHole1Ori_Q0D0
HolderBlockHole1Ori_Q0D0.Position -0.076 0.411 -0.5905

Shape Subtraction HolderBlockMinusHole1_Q0D0
HolderBlockMinusHole1_Q0D0.Parameters HolderBlock HolderBlockHole1 HolderBlockHole1Ori

Shape BRIK HolderBlockHole2_Q0D0
HolderBlockHole2_Q0D0.Parameters 3.9125 4.78 0.334
Orientation HolderBlockHole2Ori_Q0D0
HolderBlockHole2Ori_Q0D0.Position -0.1255 0.1825 0.5305

Shape Subtraction HolderBlockMinusHole2_Q0D0
HolderBlockMinusHole2_Q0D0.Parameters HolderBlockMinusHole1_Q0D0 HolderBlockHole2_Q0D0 HolderBlockHole2Ori_Q0D0

Shape BRIK HolderBlockHole3_Q0D0
#HolderBlockHole3.Parameters 4.223 4.2 0.565
HolderBlockHole3_Q0D0.Parameters 4.223 3.72 0.8545
Orientation HolderBlockHole3Ori_Q0D0
HolderBlockHole3Ori_Q0D0.Position 0.0 1.0365 0.0

Shape Subtraction HolderBlockMinusHole3_Q0D0
HolderBlockMinusHole3_Q0D0.Parameters HolderBlockMinusHole2_Q0D0 HolderBlockHole3_Q0D0 HolderBlockHole3Ori_Q0D0

Shape TRD1 HolderTrdHole1_Q0D0
HolderTrdHole1_Q0D0.Parameters 3.261 4.223 0.8545 0.4805
Orientation HolderTrdHole1Ori_Q0D0
HolderTrdHole1Ori_Q0D0.Position 0.0 -3.164 0.0
HolderTrdHole1Ori_Q0D0.Rotation -90.0 0.0 0.0

Shape Subtraction HolderBlockMinusTrdHole1_Q0D0
HolderBlockMinusTrdHole1_Q0D0.Parameters HolderBlockMinusHole3_Q0D0 HolderTrdHole1_Q0D0 HolderTrdHole1Ori_Q0D0

#this is the high voltage side
Shape BRIK HolderBlockHole4_Q0D0
HolderBlockHole4_Q0D0.Parameters 0.64 4.05 0.274
Orientation HolderBlockHole4Ori_Q0D0
HolderBlockHole4Ori_Q0D0.Position -4.445 0.702 -0.5905

Shape Subtraction HolderBlockMinusHole4_Q0D0
HolderBlockMinusHole4_Q0D0.Parameters HolderBlockMinusTrdHole1_Q0D0 HolderBlockHole4_Q0D0 HolderBlockHole4Ori_Q0D0

#This is the low voltage side opposite the HV side
Shape BRIK HolderBlockHole5_Q0D0
HolderBlockHole5_Q0D0.Parameters 0.64 3.93 0.274
Orientation HolderBlockHole5Ori_Q0D0
HolderBlockHole5Ori_Q0D0.Position 4.445 0.8255 -0.5905

Shape Subtraction HolderBlockMinusHole5_Q0D0
HolderBlockMinusHole5_Q0D0.Parameters HolderBlockMinusHole4_Q0D0 HolderBlockHole5_Q0D0 HolderBlockHole5Ori_Q0D0

Shape TRD1 HolderTrdHole2_Q0D0
HolderTrdHole2_Q0D0.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole2Ori_Q0D0
HolderTrdHole2Ori_Q0D0.Position -4.588 0.584 -0.192
HolderTrdHole2Ori_Q0D0.Rotation 90.0 0.0 90.0

Shape Subtraction HolderBlockMinusTrdHole2_Q0D0
HolderBlockMinusTrdHole2_Q0D0.Parameters HolderBlockMinusHole5_Q0D0 HolderTrdHole2_Q0D0 HolderTrdHole2Ori_Q0D0

Shape TRD1 HolderTrdHole3_Q0D0
HolderTrdHole3_Q0D0.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole3Ori_Q0D0
HolderTrdHole3Ori_Q0D0.Position 4.588 0.584 -0.192
HolderTrdHole3Ori_Q0D0.Rotation 90.0 0.0 -90.0

Shape Subtraction HolderBlockMinusTrdHole3_Q0D0
HolderBlockMinusTrdHole3_Q0D0.Parameters HolderBlockMinusTrdHole2_Q0D0 HolderTrdHole3_Q0D0 HolderTrdHole3Ori_Q0D0

Shape TRD1 HolderTrdHole4_Q0D0
HolderTrdHole4_Q0D0.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole4Ori_Q0D0
HolderTrdHole4Ori_Q0D0.Position 0.0 -4.0145 -0.18655
HolderTrdHole4Ori_Q0D0.Rotation 90.0 0.0 180.0

Shape Subtraction HolderBlockMinusTrdHole4_Q0D0
HolderBlockMinusTrdHole4_Q0D0.Parameters HolderBlockMinusTrdHole3_Q0D0 HolderTrdHole4_Q0D0 HolderTrdHole4Ori_Q0D0

Shape BRIK HolderBlockHole6_Q0D0
HolderBlockHole6_Q0D0.Parameters 5.1 0.1395 0.265
Orientation HolderBlockHole6Ori_Q0D0
HolderBlockHole6Ori_Q0D0.Position 0.0 -4.611 -0.5905

Shape Subtraction HolderBlockMinusBrikHole6_Q0D0
HolderBlockMinusBrikHole6_Q0D0.Parameters HolderBlockMinusTrdHole4_Q0D0 HolderBlockHole6 HolderBlockHole6Ori_Q0D0

Shape BRIK HolderBlockHole7_Q0D0
HolderBlockHole7_Q0D0.Parameters 0.4445 0.39 0.265
Orientation HolderBlockHole7Ori_Q0D0
HolderBlockHole7Ori_Q0D0.Position -4.6355 -4.36 -0.5905

Shape Subtraction HolderBlockMinusBrikHole7_Q0D0
HolderBlockMinusBrikHole7_Q0D0.Parameters HolderBlockMinusBrikHole6_Q0D0 HolderBlockHole7_Q0D0 HolderBlockHole7Ori_Q0D0

Shape BRIK HolderBlockHole8_Q0D0
HolderBlockHole8_Q0D0.Parameters 0.362 0.432 0.201
Orientation HolderBlockHole8Ori_Q0D0
HolderBlockHole8Ori_Q0D0.Position 4.718 -3.531 -0.654

Shape Subtraction HolderBlockMinusBrikHole8_Q0D0
HolderBlockMinusBrikHole8_Q0D0.Parameters HolderBlockMinusBrikHole7_Q0D0 HolderBlockHole8_Q0D0 HolderBlockHole8Ori_Q0D0

#Adding in the additional tabs on this side
Shape BRIK HolderBlockTab1_Q0D0
HolderBlockTab1_Q0D0.Parameters 0.076 0.305 0.47
Orientation HolderBlockTab1Ori_Q0D0
HolderBlockTab1Ori_Q0D0.Position -5.004 -4.445 -0.7955

Shape Union HolderBlockPlusBrikTab1_Q0D0
HolderBlockPlusBrikTab1_Q0D0.Parameters HolderBlockMinusBrikHole8_Q0D0 HolderBlockTab1_Q0D0 HolderBlockTab1Ori_Q0D0

Shape BRIK HolderBlockTab2_Q0D0
HolderBlockTab2_Q0D0.Parameters 0.076 0.254 0.4065
Orientation HolderBlockTab2Ori_Q0D0
HolderBlockTab2Ori_Q0D0.Position 5.004 -4.217 -0.8595

Shape Union HolderBlockPlusBrikTab2_Q0D0
HolderBlockPlusBrikTab2_Q0D0.Parameters HolderBlockPlusBrikTab1_Q0D0 HolderBlockTab2_Q0D0 HolderBlockTab2Ori_Q0D0

Shape BRIK HolderBlockTab3_Q0D0
HolderBlockTab3_Q0D0.Parameters 0.286 0.292 0.47
Orientation HolderBlockTab3Ori_Q0D0
HolderBlockTab3Ori_Q0D0.Position 4.508 4.458 -0.7565

Shape Union HolderBlockPlusBrikTab3_Q0D0
HolderBlockPlusBrikTab3_Q0D0.Parameters HolderBlockPlusBrikTab2_Q0D0 HolderBlockTab3_Q0D0 HolderBlockTab3Ori_Q0D0

Shape BRIK HolderBlockTab4_Q0D0
HolderBlockTab4_Q0D0.Parameters 0.743 0.254 0.2275
Orientation HolderBlockTab4Ori_Q0D0
HolderBlockTab4Ori_Q0D0.Position -4.337 5.004 -.226

Shape Union HolderBlockPlusBrikTab4_Q0D0
HolderBlockPlusBrikTab4_Q0D0.Parameters HolderBlockPlusBrikTab3_Q0D0 HolderBlockTab4_Q0D0 HolderBlockTab4Ori_Q0D0

Shape BRIK HolderBlockTab5_Q0D0
HolderBlockTab5_Q0D0.Parameters 0.3685 0.1015 0.4065
Orientation HolderBlockTab5Ori_Q0D0
HolderBlockTab5Ori_Q0D0.Position -4.7115 5.1565 -.86

Shape Union HolderBlockPlusBrikTab5_Q0D0
HolderBlockPlusBrikTab5_Q0D0.Parameters HolderBlockPlusBrikTab4_Q0D0 HolderBlockTab5_Q0D0 HolderBlockTab5Ori_Q0D0

Shape BRIK HolderBlockTab6_Q0D0
HolderBlockTab6_Q0D0.Parameters 0.457 0.1525 0.2415
Orientation HolderBlockTab6Ori_Q0D0
HolderBlockTab6Ori_Q0D0.Position -5.537 4.8005 0.296

Shape Union HolderBlockPlusBrikTab6_Q0D0
HolderBlockPlusBrikTab6_Q0D0.Parameters HolderBlockPlusBrikTab5_Q0D0 HolderBlockTab6_Q0D0 HolderBlockTab6Ori_Q0D0

#following two tabs are on the side closest to the HV board
Shape BRIK HolderBlockTab7_Q0D0
HolderBlockTab7_Q0D0.Parameters 0.457 0.216 0.2415
Orientation HolderBlockTab7Ori_Q0D0
HolderBlockTab7Ori_Q0D0.Position -5.537 -4.242 0.296

Shape Union HolderBlockPlusBrikTab7_Q0D0
HolderBlockPlusBrikTab7_Q0D0.Parameters HolderBlockPlusBrikTab6_Q0D0 HolderBlockTab7_Q0D0 HolderBlockTab7Ori_Q0D0

Shape BRIK HolderBlockTab8_Q0D0
HolderBlockTab8_Q0D0.Parameters 0.178 1.7465 1.27
Orientation HolderBlockTab8Ori_Q0D0
HolderBlockTab8Ori_Q0D0.Position 5.258 -3.6385 0.8165

Shape Union HolderBlockPlusBrikTab8_Q0D0
HolderBlockPlusBrikTab8_Q0D0.Parameters HolderBlockPlusBrikTab7_Q0D0 HolderBlockTab8_Q0D0 HolderBlockTab8Ori_Q0D0

#Following two tabs are the tabs that line up with the LV board
Shape BRIK HolderBlockTab9_Q0D0
HolderBlockTab9_Q0D0.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab9Ori_Q0D0
HolderBlockTab9Ori_Q0D0.Position -4.4325 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab9_Q0D0
HolderBlockPlusBrikTab9_Q0D0.Parameters HolderBlockPlusBrikTab8_Q0D0 HolderBlockTab9_Q0D0 HolderBlockTab9Ori_Q0D0

Shape BRIK HolderBlockTab10_Q0D0
HolderBlockTab10_Q0D0.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab10Ori_Q0D0
HolderBlockTab10Ori_Q0D0.Position 4.1655 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab10_Q0D0
HolderBlockPlusBrikTab10_Q0D0.Parameters HolderBlockPlusBrikTab9_Q0D0 HolderBlockTab10_Q0D0 HolderBlockTab10Ori_Q0D0

#Now going to the opposite side of the holder
#Like above, I will start by subtracting then move to adding mass
Shape BRIK HolderBlockHole9_Q0D0
HolderBlockHole9_Q0D0.Parameters 0.445 4.2035 0.33
Orientation HolderBlockHole9Ori_Q0D0
HolderBlockHole9Ori_Q0D0.Position 4.483 0.0385 0.5305

Shape Subtraction HolderBlockPlusBrikHole9_Q0D0
HolderBlockPlusBrikHole9_Q0D0.Parameters HolderBlockPlusBrikTab10_Q0D0 HolderBlockHole9_Q0D0 HolderBlockHole9Ori_Q0D0

Shape BRIK HolderBlockHole10_Q0D0
HolderBlockHole10_Q0D0.Parameters 0.3525 4.045 0.33
Orientation HolderBlockHole10Ori_Q0D0
HolderBlockHole10Ori_Q0D0.Position -4.7275 0.603 0.5305

Shape Subtraction HolderBlockPlusBrikHole10_Q0D0
HolderBlockPlusBrikHole10_Q0D0.Parameters HolderBlockPlusBrikHole9_Q0D0 HolderBlockHole10_Q0D0 HolderBlockHole10Ori_Q0D0

#Adding mass now
Shape BRIK HolderBlockTab11_Q0D0
HolderBlockTab11_Q0D0.Parameters 0.254 0.305 0.616
Orientation HolderBlockTab11Ori_Q0D0
HolderBlockTab11Ori_Q0D0.Position -4.674 -4.445 1.4705

Shape Union HolderBlockPlusBrikTab11_Q0D0
HolderBlockPlusBrikTab11_Q0D0.Parameters HolderBlockPlusBrikHole10_Q0D0 HolderBlockTab11_Q0D0 HolderBlockTab11Ori_Q0D0

Shape BRIK HolderBlockTab112_Q0D0
HolderBlockTab112_Q0D0.Parameters 0.076 0.305 0.2095
Orientation HolderBlockTab112Ori_Q0D0
HolderBlockTab112Ori_Q0D0.Position -5.004 -4.445 1.064

Shape Union HolderBlockPlusBrikTab112_Q0D0
HolderBlockPlusBrikTab112_Q0D0.Parameters HolderBlockPlusBrikTab11_Q0D0 HolderBlockTab112_Q0D0 HolderBlockTab112Ori_Q0D0

Shape BRIK HolderBlockTab12_Q0D0
HolderBlockTab12_Q0D0.Parameters 0.743 0.1015 0.4265
Orientation HolderBlockTab12Ori_Q0D0
HolderBlockTab12Ori_Q0D0.Position -4.337 4.8515 .428

Shape Union HolderBlockPlusBrikTab12_Q0D0
HolderBlockPlusBrikTab12_Q0D0.Parameters HolderBlockPlusBrikTab112_Q0D0 HolderBlockTab12_Q0D0 HolderBlockTab12Ori_Q0D0

#This tab should be 0.8045 apparentl in the z direction
Shape BRIK HolderBlockTab13_Q0D0
HolderBlockTab13_Q0D0.Parameters 0.3685 0.051 0.4045
Orientation HolderBlockTab13Ori_Q0D0
HolderBlockTab13Ori_Q0D0.Position -3.9625 5.004 1.282

Shape Union HolderBlockPlusBrikTab13_Q0D0
HolderBlockPlusBrikTab13_Q0D0.Parameters HolderBlockPlusBrikTab12_Q0D0 HolderBlockTab13_Q0D0 HolderBlockTab13Ori_Q0D0

Shape BRIK HolderBlockTab14_Q0D0
HolderBlockTab14_Q0D0.Parameters 0.286 0.292 .5335
Orientation HolderBlockTab14Ori_Q0D0
HolderBlockTab14Ori_Q0D0.Position 4.508 4.458 0.74

Shape Union HolderBlockPlusBrikTab14_Q0D0
HolderBlockPlusBrikTab14_Q0D0.Parameters HolderBlockPlusBrikTab13_Q0D0 HolderBlockTab14_Q0D0 HolderBlockTab14Ori_Q0D0

Shape BRIK HolderBlockTab15_Q0D0
HolderBlockTab15_Q0D0.Parameters 0.076 0.254 0.6415
Orientation HolderBlockTab15Ori_Q0D0
HolderBlockTab15Ori_Q0D0.Position 5.004 3.658 1.445

Shape Union HolderBlockPlusBrikTab15_Q0D0
HolderBlockPlusBrikTab15_Q0D0.Parameters HolderBlockPlusBrikTab14_Q0D0 HolderBlockTab15_Q0D0 HolderBlockTab15Ori_Q0D0

#Hole for the stupid skewer things
Shape TUBS HolderRodHole_Q0D0
HolderRodHole_Q0D0.Parameters 0.0 0.16 2.11 0.0 360.0
Orientation HolderRodHole_Ori_Q0D0
HolderRodHole_Ori_Q0D0.Position 4.508 4.471 0.0

Shape SUBTRACTION HolderBlockMinusRodHole_Q0D0
HolderBlockMinusRodHole_Q0D0.Parameters HolderBlockPlusBrikTab15_Q0D0 HolderRodHole_Q0D0 HolderRodHole_Ori_Q0D0

Volume Holder_Q0D0
Holder_Q0D0.Material al6061
Holder_Q0D0.Visibility 1
Holder_QD00.Color 15
Holder_Q0D0.Shape HolderBlockMinusRodHole_Q0D0
Holder_Q0D0.Rotation 0.0 0.0 0.0
Holder_Q0D0.Position {-0.6555+Xshift} {-0.574+Yshift} {-.0005+Zshift}
Holder_Q0D0.Mother DetectorQ0D0

# adding new aluminum bar that is on the far end of the holder on the opposite side of the LV interposer board
Volume AlBar_Q0D0
AlBar_Q0D0.Material al6061
AlBar_Q0D0.Visibility 1
AlBar_Q0D0.Color 20
AlBar_Q0D0.Shape Brik 3.9 0.0735 0.273
#AlBar_Q0D0.Position  {-0.582+Xshift} {4.2495+Yshift} {-0.067+Zshift}
AlBar_Q0D0.Position  {-.345+Xshift} {4.2345+Yshift} {-0.067+Zshift}
AlBar_Q0D0.Mother DetectorQ0D0


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
#AlSide1.Mother DetectorQ0D0
#AlSide1.Position {-5.307+Xshift}  {-0.547+Yshift}  0.206

#Updating this to be a boolean shape 

Shape BRIK LV_Block_Q0D0
LV_Block_Q0D0.Parameters 4.661 1.552 0.0795
Shape TRD1 LV_TRD_Hole_Q0D0
LV_TRD_Hole_Q0D0.Parameters 3.7245 2.756 0.08 0.4295
Orientation LV_TRD_HoleOri_Q0D0
LV_TRD_HoleOri_Q0D0.Rotation 90.0 0.0 0.0
LV_TRD_HoleOri_Q0D0.Position 0.1445 1.1225 0.0

Shape Subtraction LVBlockMinusTRDHole_Q0D0
LVBlockMinusTRDHole_Q0D0.Parameters LV_Block_Q0D0 LV_TRD_Hole_Q0D0 LV_TRD_HoleOri_Q0D0

Shape BRIK LVL3_Q0D0
LVL3_Q0D0.Parameters .203 .3365 .08
Orientation LVL3_Ori_Q0D0
LVL3_Ori_Q0D0.Position 4.458 1.2155  0.0

Shape Subtraction LVBlockMinusLVL3_Q0D0
LVBlockMinusLVL3_Q0D0.Parameters LVBlockMinusTRDHole_Q0D0 LVL3_Q0D0 LVL3_Ori_Q0D0

Shape BRIK LVL4_Q0D0
LVL4_Q0D0.Parameters .2795 .536 .08
Orientation LVL4_Ori_Q0D0
LVL4_Ori_Q0D0.Position -4.3815 1.016  0.0

Shape Subtraction LVBlockMinusLVL4_Q0D0
LVBlockMinusLVL4_Q0D0.Parameters LVBlockMinusLVL3_Q0D0 LVL4_Q0D0 LVL4_Ori_Q0D0

Shape BRIK LVL6_Q0D0
LVL6_Q0D0.Parameters .303 .5535 .08
Orientation LVL6_Ori_Q0D0
LVL6_Ori_Q0D0.Position -4.458 -0.6825  0.0

Shape Subtraction LVBlockMinusLVL6_Q0D0
LVBlockMinusLVL6_Q0D0.Parameters LVBlockMinusLVL4_Q0D0 LVL6_Q0D0 LVL6_Ori_Q0D0


Volume LVL1_Q0D0
LVL1_Q0D0.Material ro4003
LVL1_Q0D0.Visibility 1
LVL1_Q0D0.Color 52
LVL1_Q0D0.Shape LVBlockMinusLVL6
LVL1_Q0D0.Mother DetectorQ0D0
#LVL1_Q0D0.Position {-0.1435+Xshift} {-3.691+Yshift} 0.967
# Seems like the LV board is shifted slightly off center. Having a hard time getting this measurement
# therefore, if something seems off check this shift here. Currently saying it is shifted by .178 cm
LVL1_Q0D0.Position {-0.8335+Xshift} {-4.417+Yshift} {-0.935+Zshift}

Volume LVL5_Q0D0
LVL5_Q0D0.Material ro4003
LVL5_Q0D0.Mother DetectorQ0D0
LVL5_Q0D0.Shape BRIK 4.661 0.158 0.978
LVL5_Q0D0.Visibility 1
LVL5_Q0D0.Color 3
LVL5_Q0D0.Position {-0.8335+Xshift} {-6.127+Yshift} {-0.0365+Zshift}

//Flex Clamp Block
Volume LVFlexBlock_Q0D0
#LVFlexBlock_Q0D0.Material al6061
LVFlexBlock_Q0D0.Material steel_304
LVFlexBlock_Q0D0.Mother DetectorQ0D0
LVFlexBlock_Q0D0.Visibility 1
LVFlexBlock_Q0D0.Color 7
LVFlexBlock_Q0D0.Shape BRIK 3.9155 0.2385 0.286
LVFlexBlock_Q0D0.Position {-0.929+Xshift} {-6.5235+Yshift} {0.4015+Zshift}

Volume LVFlexSmBlock1_Q0D0
#LVFlexSmBlock1_Q0D0.Material al6061
LVFlexSmBlock1_Q0D0.Material steel_304
LVFlexSmBlock1_Q0D0.Mother DetectorQ0D0
LVFlexSmBlock1_Q0D0.Visibility 1
LVFlexSmBlock1_Q0D0.Color 7
LVFlexSmBlock1_Q0D0.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock1_Q0D0.Position {2.8235+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

Volume LVFlexSmBlock2_Q0D0
LVFlexSmBlock2_Q0D0.Material steel_304
LVFlexSmBlock2_Q0D0.Mother DetectorQ0D0
LVFlexSmBlock2_Q0D0.Visibility 1
LVFlexSmBlock2_Q0D0.Color 7
LVFlexSmBlock2_Q0D0.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock2_Q0D0.Position {-4.6815+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

////////////////////////////////////////////////
// High voltage boards
_Q0D0///////////////////////////////////////////////
#Making this a Boolean shape
Shape BRIK HVBlock_Q0D0
HVBlock_Q0D0.Parameters 1.5645 4.934 0.0795
Shape BRIK HVLH1_Q0D0
HVLH1_Q0D0.Parameters 1.128 0.3225 0.08
Orientation HVLH1_Ori_Q0D0
HVLH1_Ori_Q0D0.Position .4365 -4.6115 0.0

Shape SUBTRACTION HVBlockMinusHVLH1_Q0D0
HVBlockMinusHVLH1_Q0D0.Parameters HVBlock_Q0D0 HVLH1_Q0D0 HVLH1_Ori_Q0D0

Shape BRIK HVLH2_Q0D0
HVLH2_Q0D0.Parameters 0.32 0.292 0.08
Orientation HVLH2_Ori_Q0D0
HVLH2_Ori_Q0D0.Position 1.2445 -3.997 0.0

Shape SUBTRACTION HVBlockMinusHVLH2_Q0D0
HVBlockMinusHVLH2_Q0D0.Parameters HVBlockMinusHVLH1_Q0D0 HVLH2_Q0D0 HVLH2_Ori_Q0D0

Shape BRIK HVLH3_Q0D0
HVLH3_Q0D0.Parameters 1.168 0.089 0.08
Orientation HVLH3_Ori_Q0D0
HVLH3_Ori_Q0D0.Position 0.3965 4.845 0.0

Shape SUBTRACTION HVBlockMinusHVLH3_Q0D0
HVBlockMinusHVLH3_Q0D0.Parameters HVBlockMinusHVLH2_Q0D0 HVLH3_Q0D0 HVLH3_Ori_Q0D0

Shape BRIK HVLH4_Q0D0
HVLH4_Q0D0.Parameters 0.397 0.165 0.08
Orientation HVLH4_Ori_Q0D0
HVLH4_Ori_Q0D0.Position 1.1675 4.591 0.0

Shape SUBTRACTION HVBlockMinusHVLH4_Q0D0
HVBlockMinusHVLH4_Q0D0.Parameters HVBlockMinusHVLH3_Q0D0 HVLH4_Q0D0 HVLH4_Ori_Q0D0

Shape TRD1 HVLH5_Q0D0
HVLH5_Q0D0.Parameters 3.7245 2.756 0.09 0.4295
Orientation HVLH5_Ori_Q0D0
HVLH5_Ori_Q0D0.Position 1.135 0.401 0.0
HVLH5_Ori_Q0D0.Rotation 90.0 0.0 270.0

Shape SUBTRACTION HVBlockMinusHVLH5_Q0D0
HVBlockMinusHVLH5_Q0D0.Parameters HVBlockMinusHVLH4_Q0D0 HVLH5_Q0D0 HVLH5_Ori_Q0D0

Volume HVL1_Q0D0
HVL1_Q0D0.Material ro4003
HVL1_Q0D0.Visibility 1
HVL1_Q0D0.Color 94
HVL1_Q0D0.Shape HVBlockMinusHVLH5
HVL1_Q0D0.Mother DetectorQ0D0
HVL1_Q0D0.Position {-5.085+Xshift} {-0.4+Yshift} {.934+Zshift}
#HVL1_Q0D0.Position {-5.085+Xshift} {-0.4+Yshift} .88
HVL1_Q0D0.Rotation 0.0 0.0 0.0

#Making the HVL5 board also a boolean shape

Shape BRIK HVL5Block_Q0D0
HVL5Block_Q0D0.Parameters 0.1585 4.934 0.978
Shape BRIK HVL5H1_Q0D0
HVL5H1_Q0D0.Parameters 0.16 0.216 0.505
Orientation HVL5H1_Ori_Q0D0
HVL5H1_Ori_Q0D0.Position 0.0 -4.718 -0.473

Shape SUBTRACTION HVL5BlockMinusH1_Q0D0
HVL5BlockMinusH1_Q0D0.Parameters HVL5Block_Q0D0 HVL5H1_Q0D0 HVL5H1_Ori_Q0D0

Shape BRIK HVL5H2_Q0D0
HVL5H2_Q0D0.Parameters 0.16 0.216 0.2445
Orientation HVL5H2_Ori_Q0D0
HVL5H2_Ori_Q0D0.Position 0.0 -4.718 0.7335

Shape SUBTRACTION HVL5BlockMinusH2_Q0D0
HVL5BlockMinusH2_Q0D0.Parameters HVL5BlockMinusH1_Q0D0 HVL5H2_Q0D0 HVL5H2_Ori_Q0D0

Shape BRIK HVL5H3_Q0D0
HVL5H3_Q0D0.Parameters 0.16 0.1335 0.4365
Orientation HVL5H3_Ori_Q0D0
HVL5H3_Ori_Q0D0.Position 0.0 4.8005 -0.5415

Shape SUBTRACTION HVL5BlockMinusH3_Q0D0
HVL5BlockMinusH3_Q0D0.Parameters HVL5BlockMinusH2_Q0D0 HVL5H3_Q0D0 HVL5H3_Ori_Q0D0

Volume HVL5_Q0D0
HVL5_Q0D0.Material roTMM3
HVL5_Q0D0.Mother DetectorQ0D0
HVL5_Q0D0.Visibility 1
HVL5_Q0D0.Color 3
HVL5_Q0D0.Shape HVL5BlockMinusH3
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -0.062
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -.0185
HVL5_Q0D0.Position {-6.808+Xshift} {-0.4+Yshift} {.0355+Zshift}

#adding a block to represent the capacitors
Volume HV_Caps_Q0D0
HV_Caps_Q0D0.Material Class1Cap
HV_Caps_Q0D0.Mother DetectorQ0D0
HV_Caps_Q0D0.Visibility 1
HV_Caps_Q0D0.Color 4
HV_Caps_Q0D0.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps_Q0D0.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)+0.5*.6401}

Volume HV_Caps2_Q0D0
HV_Caps2_Q0D0.Material Class1Cap
HV_Caps2_Q0D0.Mother DetectorQ0D0
HV_Caps2_Q0D0.Visibility 1
HV_Caps2_Q0D0.Color 4
HV_Caps2_Q0D0.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps2_Q0D0.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}


#Adding in solder
Volume DetSolder_Q0D0
DetSolder_Q0D0.Material solder
DetSolder_Q0D0.Visibility 1
DetSolder_Q0D0.Color 12
DetSolder_Q0D0.Shape BRIK DetectorHalfWidth .3 0.1217
DetSolder_Q0D0.Rotation 90.0 0.0 90.0
DetSolder_Q0D0.Position {(-6.808+Xshift)+2*0.5*0.574+.16+.1217} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}
DetSolder_Q0D0.Mother DetectorQ0D0


//Flex Clamp Block
Volume HVFlexBlock_Q0D0
HVFlexBlock_Q0D0.Material al6061
HVFlexBlock_Q0D0.Mother DetectorQ0D0
HVFlexBlock_Q0D0.Visibility 1
HVFlexBlock_Q0D0.Color 7
HVFlexBlock_Q0D0.Shape BRIK 0.2385 3.9155 0.286
HVFlexBlock_Q0D0.Position {-7.2055+Xshift} {-0.1995+Yshift} {-0.3945+Zshift}

Volume HVFlexSmBlock1_Q0D0
HVFlexSmBlock1_Q0D0.Material al6061
HVFlexSmBlock1_Q0D0.Mother DetectorQ0D0
HVFlexSmBlock1_Q0D0.Visibility 1
HVFlexSmBlock1_Q0D0.Color 7
HVFlexSmBlock1_Q0D0.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock1_Q0D0.Position {-7.2055+Xshift} {3.553+Yshift} {0.1895+Zshift}

Volume HVFlexSmBlock2_Q0D0
HVFlexSmBlock2_Q0D0.Material al6061
HVFlexSmBlock2_Q0D0.Mother DetectorQ0D0
HVFlexSmBlock2_Q0D0.Visibility 1
HVFlexSmBlock2_Q0D0.Color 7
HVFlexSmBlock2_Q0D0.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock2_Q0D0.Position {-7.2055+Xshift} {-3.952+Yshift} {0.1895+Zshift}

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
Volume In_PassGe_Q0D0
In_PassGe_Q0D0.Material indium
In_PassGe_Q0D0.Visibility 1
In_PassGe_Q0D0.Color 90
In_PassGe_Q0D0.Shape BRIK .3555 1.2445 .005

In_PassGe_Q0D0.Copy In_PassGe1_Q0D0
In_PassGe_Q0D0.Copy In_PassGe2_Q0D0
In_PassGe_Q0D0.Copy In_PassGe3_Q0D0
In_PassGe_Q0D0.Copy In_PassGe4_Q0D0


In_PassGe1_Q0D0.Mother DetectorQ0D0
In_PassGe1_Q0D0.Position {3.785+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe2_Q0D0.Mother DetectorQ0D0
In_PassGe2_Q0D0.Position {3.785+Xshift} {0.0+Yshift} {-0.08+Zshift}
In_PassGe3_Q0D0.Mother DetectorQ0D0
In_PassGe3_Q0D0.Position {-5.096+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe4_Q0D0.Mother DetectorQ0D0
In_PassGe4_Q0D0.Position {-5.096+Xshift} {0.0+Yshift} {-0.08+Zshift}

Volume In_PassAlNi_Q0D0
In_PassAlNi_Q0D0.Material indium
In_PassAlNi_Q0D0.Visibility 1
In_PassAlNi_Q0D0.Color 90
In_PassAlNi_Q0D0.Shape BRIK .3555 1.2445 .05

In_PassAlNi_Q0D0.Copy In_PassAlNi1_Q0D0
In_PassAlNi_Q0D0.Copy In_PassAlNi2_Q0D0

# Not sure why the same z positions are not working for In_PassGe3 and In_PassAlNi_Q0D02 but this is the only way I can remove the overlap.
In_PassAlNi1_Q0D0.Mother DetectorQ0D0
In_PassAlNi1_Q0D0.Position {3.785+Xshift} {0.0+Yshift} {-0.140+Zshift}
In_PassAlNi2_Q0D0.Mother DetectorQ0D0
In_PassAlNi2_Q0D0.Position {-5.096+Xshift} {0.0+Yshift} {-0.140+Zshift}

# Not including the detector clamp buttons

#Dummy approximation of the detector clamps
# 4130 Steel
Shape Brik BigClamp_Q0D0
BigClamp_Q0D0.Parameters 3.041 0.3175 0.178 
Shape Brik SmallClamp1_Q0D0
SmallClamp1_Q0D0.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp1Ori_Q0D0
SmallClamp1Ori_Q0D0.Position 2.99 0.0 0.4465

Shape UNION BigClampPlusSmallClamp1_Q0D0
BigClampPlusSmallClamp1_Q0D0.Parameters BigClamp_Q0D0 SmallClamp1_Q0D0 SmallClamp1Ori_Q0D0

Shape Brik SmallClamp2_Q0D0
SmallClamp2_Q0D0.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp2Ori_Q0D0
SmallClamp2Ori_Q0D0.Position -2.99 0.0 0.4465


Shape Union BigClampPlusSmallClamp2_Q0D0
BigClampPlusSmallClamp2_Q0D0.Parameters BigClampPlusSmallClamp1_Q0D0 SmallClamp2_Q0D0 SmallClamp2Ori_Q0D0

Volume DetClamp_Q0D0
DetClamp_Q0D0.Material steel_4130
DetClamp_Q0D0.Visibility 1
DetClamp_Q0D0.Color 67
DetClamp_Q0D0.Shape BigClampPlusSmallClamp2
DetClamp_Q0D0.Rotation 0.0 0.0 90.0
DetClamp_Q0D0.Position {3.9485+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp_Q0D0.Mother DetectorQ0D0

Volume DetClamp2_Q0D0
DetClamp2_Q0D0.Material steel_4130
DetClamp2_Q0D0.Visibility 1
DetClamp2_Q0D0.Color 67
DetClamp2_Q0D0.Shape BigClampPlusSmallClamp2
DetClamp2_Q0D0.Rotation 0.0 0.0 90.0
DetClamp2_Q0D0.Position {-5.253+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp2_Q0D0.Mother DetectorQ0D0

#Dummy approximation of the preload hardware 
# 304 Stainless Steel
Volume Preload_Q0D0
Preload_Q0D0.Material steel_304
Preload_Q0D0.Visibility 1
Preload_Q0D0.Color 71
Preload_Q0D0.Shape TUBE 0.0 0.255 0.3365 0.0 360.0

Preload_Q0D0.Copy Preload1_Q0D0
Preload_Q0D0.Copy Preload2_Q0D0
Preload_Q0D0.Copy Preload3_Q0D0
Preload_Q0D0.Copy Preload4_Q0D0

Preload1_Q0D0.Position {3.9485+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload1_Q0D0.Mother DetectorQ0D0
Preload2_Q0D0.Position {3.9485+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload2_Q0D0.Mother DetectorQ0D0
Preload3_Q0D0.Position {-5.253+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload3_Q0D0.Mother DetectorQ0D0
Preload4_Q0D0.Position {-5.253+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload4_Q0D0.Mother DetectorQ0D0



# Steel - very dummy approximation of the screws we need

#Volume ScrewDummy
#ScrewDummy.Material Steel_18_8
#ScrewDummy.Visibility 1
#ScrewDummy.Color 5
#ScrewDummy.Shape BRIK 0.5 0.5 0.375

#ScrewDummy.Copy ScrewDummy1
#ScrewDummy.Copy ScrewDummy2

#ScrewDummy1.Mother DetectorQ0D0
#ScrewDummy1.Position  {4.5+Xshift}  {-3.6+Yshift}  -0.45

#ScrewDummy2.Mother DetectorQ0D0
#ScrewDummy2.Position  {4.5+Xshift}  {3.0+Yshift}  -0.45


