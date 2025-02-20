# A single germanium detector volume
# COSI SMEX model
#These constants were used to make the detector sit nicely in the mother volume
#Constant Xshift -0.627
Constant Xshift 1.342
Constant Yshift 0.991
Constant Zshift 0.0
#Constant Zshift -0.4

Volume DetectorQ0D1
DetectorQ0D1.Material vacuum
#DetectorQ0D1.Shape BRIK  5.3025  4.791  1.07
#DetectorQ0D1.Shape BRIK  7.7025  6.791  2.17
DetectorQ0D1.Shape BRIK  6.1225  5.791  {DetectorHalfHeight+.9+.4}
DetectorQ0D1.Visibility 0
DetectorQ0D1.Virtual true

#Shape BRIK GeWaferBlock
#GeWaferBlock.Parameters DetectorHalfWidth DetectorHalfWidth DetectorHalfHeight

#Shape TUBE WaferCutDisk
#WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

#Shape Intersection ActiveWafer
#ActiveWafer.Parameters GeWaferBlock WaferCutDisk

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK WaferOuterBox_Q0D1
WaferOuterBox_Q0D1.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE WaferCutDisk_Q0D1
WaferCutDisk_Q0D1.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection WholeWafer_Q0D1
WholeWafer_Q0D1.Parameters WaferOuterBox_Q0D1 WaferCutDisk_Q0D1

# Create the active wafer
Shape BRIK ActiveWaferOuterBox_Q0D1
ActiveWaferOuterBox_Q0D1.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE ActiveWaferCutDisk_Q0D1
ActiveWaferCutDisk_Q0D1.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection ActiveWafer_Q0D1
ActiveWafer_Q0D1.Parameters ActiveWaferOuterBox_Q0D1 ActiveWaferCutDisk_Q0D1

# Create the guard ring
Shape Subtraction GuardRing_AlmostThere_Q0D1
GuardRing_AlmostThere_Q0D1.Parameters WholeWafer_Q0D1 ActiveWafer_Q0D1

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection GuardRing_Q0D1
GuardRing_Q0D1.Parameters WaferOuterBox_Q0D1 GuardRing_AlmostThere_Q0D1

Volume Q0D1_GeWafer
Q0D1_GeWafer.Material active_ge_recoil
Q0D1_GeWafer.Visibility 1
Q0D1_GeWafer.Color 4
Q0D1_GeWafer.Shape ActiveWafer_Q0D1
#Come back and check this. Need to figure out where the 0,0 point is and what we are offsetting
Q0D1_GeWafer.Mother DetectorQ0D1
Q0D1_GeWafer.Position {-0.6555+Xshift} {0.0+Yshift} {Zshift}

Volume GeWaferGuardRing_Q0D1
GeWaferGuardRing_Q0D1.Material active_ge_recoil
GeWaferGuardRing_Q0D1.Visibility 1
GeWaferGuardRing_Q0D1.Color 3
GeWaferGuardRing_Q0D1.Shape GuardRing
GeWaferGuardRing_Q0D1.Position  {-0.6555+Xshift} {0.0+Yshift} {Zshift}
GeWaferGuardRing_Q0D1.Mother DetectorQ0D1

# Al dead layer on top
Shape BRIK stripsAl1_Q0D1
stripsAl1_Q0D1.Parameters 3.71 3.71 0.00025

Shape TUBE WaferCutDisk1_Q0D1
WaferCutDisk1_Q0D1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead1_Q0D1
AlDead1_Q0D1.Parameters stripsAl1_Q0D1 WaferCutDisk1_Q0D1

Volume stripsAl_Q0D1
stripsAl_Q0D1.Material aluminum
stripsAl_Q0D1.Visibility 1
stripsAl_Q0D1.Color 7
stripsAl_Q0D1.Shape AlDead1_Q0D1
stripsAl_Q0D1.Mother DetectorQ0D1
stripsAl_Q0D1.Position {-0.6555+Xshift} {0.0+Yshift} {0.80025+Zshift}

Shape BRIK stripsAl2_Q0D1
stripsAl2_Q0D1.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk2_Q0D1
WaferCutDisk2_Q0D1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead2_Q0D1
AlDead2_Q0D1.Parameters stripsAl2 WaferCutDisk2

# Al dead layer on the bottom
Volume stripsAlbot_Q0D1
stripsAlbot_Q0D1.Material aluminum
stripsAlbot_Q0D1.Visibility 1
stripsAlbot_Q0D1.Color 7
stripsAlbot_Q0D1.Shape AlDead2
stripsAlbot_Q0D1.Mother DetectorQ0D1
stripsAlbot_Q0D1.Position {-0.6555+Xshift} {0.0+Yshift} {-0.80025+Zshift}

# Handles etc.
Volume GeDead1_Q0D1
GeDead1_Q0D1.Material germanium
GeDead1_Q0D1.Visibility 1
GeDead1_Q0D1.Color 6
#GeDead1_Q0D1.Shape TRD1 1.21 2.88 0.076 0.39
GeDead1_Q0D1.Shape TRD1 1.569 3.05 0.102 0.4155

GeDead1_Q0D1.Copy GeDead1_Q0D1_01
GeDead1_Q0D1.Copy GeDead1_Q0D1_02

GeDead1_Q0D1_01.Mother DetectorQ0D1
GeDead1_Q0D1_01.Position  {3.785+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
GeDead1_Q0D1_01.Rotation 90.0  0.0 -90.0

GeDead1_Q0D1_02.Mother DetectorQ0D1
#GeDead1_Q0D1_02.Position  {-0.655+Xshift}  {-4.41+Yshift}  -0.698
GeDead1_Q0D1_02.Position  {-5.096+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
#GeDead1_Q0D1_02.Rotation 90.0  0.0  180.0
GeDead1_Q0D1_02.Rotation 90.0  0.0  90.0

Volume GeDead2_Q0D1
GeDead2_Q0D1.Material germanium
GeDead2_Q0D1.Visibility 1
GeDead2_Q0D1.Color 6
#GeDead2_Q0D1.Shape TRD1 1.21 2.54 0.30 0.287
GeDead2_Q0D1.Shape TRD1 1.569 2.766 0.198 0.2875

GeDead2_Q0D1.Copy GeDead2_Q0D1_01
GeDead2_Q0D1.Copy GeDead2_Q0D1_02

GeDead2_Q0D1_01.Mother DetectorQ0D1
GeDead2_Q0D1_01.Position  {3.913+Xshift}  {0.0+Yshift}  {-0.398+Zshift}
GeDead2_Q0D1_01.Rotation 90.0  0.0 -90.0


GeDead2_Q0D1_02.Mother DetectorQ0D1
GeDead2_Q0D1_02.Position  {-5.224+Xshift}   {0.0+Yshift}  {-0.398+Zshift}
GeDead2_Q0D1_02.Rotation 90.0  0.0  90.0


/////////////////////////////////////////////////////////
// Detector Holder
////////////////////////////////////////////////////////
// Detector holder on the side of the HV PCB Assembly


Shape BRIK HolderBlock_Q0D1
HolderBlock_Q0D1.Parameters 5.08 4.75 0.8545
Shape BRIK HolderBlockHole1_Q0D1
HolderBlockHole1_Q0D1.Parameters 3.886 4.78 0.274
Orientation HolderBlockHole1Ori_Q0D1
HolderBlockHole1Ori_Q0D1.Position -0.076 0.411 -0.5905

Shape Subtraction HolderBlockMinusHole1_Q0D1
HolderBlockMinusHole1_Q0D1.Parameters HolderBlock HolderBlockHole1 HolderBlockHole1Ori

Shape BRIK HolderBlockHole2_Q0D1
HolderBlockHole2_Q0D1.Parameters 3.9125 4.78 0.334
Orientation HolderBlockHole2Ori_Q0D1
HolderBlockHole2Ori_Q0D1.Position -0.1255 0.1825 0.5305

Shape Subtraction HolderBlockMinusHole2_Q0D1
HolderBlockMinusHole2_Q0D1.Parameters HolderBlockMinusHole1_Q0D1 HolderBlockHole2_Q0D1 HolderBlockHole2Ori_Q0D1

Shape BRIK HolderBlockHole3_Q0D1
#HolderBlockHole3.Parameters 4.223 4.2 0.565
HolderBlockHole3_Q0D1.Parameters 4.223 3.72 0.8545
Orientation HolderBlockHole3Ori_Q0D1
HolderBlockHole3Ori_Q0D1.Position 0.0 1.0365 0.0

Shape Subtraction HolderBlockMinusHole3_Q0D1
HolderBlockMinusHole3_Q0D1.Parameters HolderBlockMinusHole2_Q0D1 HolderBlockHole3_Q0D1 HolderBlockHole3Ori_Q0D1

Shape TRD1 HolderTrdHole1_Q0D1
HolderTrdHole1_Q0D1.Parameters 3.261 4.223 0.8545 0.4805
Orientation HolderTrdHole1Ori_Q0D1
HolderTrdHole1Ori_Q0D1.Position 0.0 -3.164 0.0
HolderTrdHole1Ori_Q0D1.Rotation -90.0 0.0 0.0

Shape Subtraction HolderBlockMinusTrdHole1_Q0D1
HolderBlockMinusTrdHole1_Q0D1.Parameters HolderBlockMinusHole3_Q0D1 HolderTrdHole1_Q0D1 HolderTrdHole1Ori_Q0D1

#this is the high voltage side
Shape BRIK HolderBlockHole4_Q0D1
HolderBlockHole4_Q0D1.Parameters 0.64 4.05 0.274
Orientation HolderBlockHole4Ori_Q0D1
HolderBlockHole4Ori_Q0D1.Position -4.445 0.702 -0.5905

Shape Subtraction HolderBlockMinusHole4_Q0D1
HolderBlockMinusHole4_Q0D1.Parameters HolderBlockMinusTrdHole1_Q0D1 HolderBlockHole4_Q0D1 HolderBlockHole4Ori_Q0D1

#This is the low voltage side opposite the HV side
Shape BRIK HolderBlockHole5_Q0D1
HolderBlockHole5_Q0D1.Parameters 0.64 3.93 0.274
Orientation HolderBlockHole5Ori_Q0D1
HolderBlockHole5Ori_Q0D1.Position 4.445 0.8255 -0.5905

Shape Subtraction HolderBlockMinusHole5_Q0D1
HolderBlockMinusHole5_Q0D1.Parameters HolderBlockMinusHole4_Q0D1 HolderBlockHole5_Q0D1 HolderBlockHole5Ori_Q0D1

Shape TRD1 HolderTrdHole2_Q0D1
HolderTrdHole2_Q0D1.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole2Ori_Q0D1
HolderTrdHole2Ori_Q0D1.Position -4.588 0.584 -0.192
HolderTrdHole2Ori_Q0D1.Rotation 90.0 0.0 90.0

Shape Subtraction HolderBlockMinusTrdHole2_Q0D1
HolderBlockMinusTrdHole2_Q0D1.Parameters HolderBlockMinusHole5_Q0D1 HolderTrdHole2_Q0D1 HolderTrdHole2Ori_Q0D1

Shape TRD1 HolderTrdHole3_Q0D1
HolderTrdHole3_Q0D1.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole3Ori_Q0D1
HolderTrdHole3Ori_Q0D1.Position 4.588 0.584 -0.192
HolderTrdHole3Ori_Q0D1.Rotation 90.0 0.0 -90.0

Shape Subtraction HolderBlockMinusTrdHole3_Q0D1
HolderBlockMinusTrdHole3_Q0D1.Parameters HolderBlockMinusTrdHole2_Q0D1 HolderTrdHole3_Q0D1 HolderTrdHole3Ori_Q0D1

Shape TRD1 HolderTrdHole4_Q0D1
HolderTrdHole4_Q0D1.Parameters 1.37 2.948 0.13 0.37
Orientation HolderTrdHole4Ori_Q0D1
HolderTrdHole4Ori_Q0D1.Position 0.0 -4.0145 -0.18655
HolderTrdHole4Ori_Q0D1.Rotation 90.0 0.0 180.0

Shape Subtraction HolderBlockMinusTrdHole4_Q0D1
HolderBlockMinusTrdHole4_Q0D1.Parameters HolderBlockMinusTrdHole3_Q0D1 HolderTrdHole4_Q0D1 HolderTrdHole4Ori_Q0D1

Shape BRIK HolderBlockHole6_Q0D1
HolderBlockHole6_Q0D1.Parameters 5.1 0.1395 0.265
Orientation HolderBlockHole6Ori_Q0D1
HolderBlockHole6Ori_Q0D1.Position 0.0 -4.611 -0.5905

Shape Subtraction HolderBlockMinusBrikHole6_Q0D1
HolderBlockMinusBrikHole6_Q0D1.Parameters HolderBlockMinusTrdHole4_Q0D1 HolderBlockHole6 HolderBlockHole6Ori_Q0D1

Shape BRIK HolderBlockHole7_Q0D1
HolderBlockHole7_Q0D1.Parameters 0.4445 0.39 0.265
Orientation HolderBlockHole7Ori_Q0D1
HolderBlockHole7Ori_Q0D1.Position -4.6355 -4.36 -0.5905

Shape Subtraction HolderBlockMinusBrikHole7_Q0D1
HolderBlockMinusBrikHole7_Q0D1.Parameters HolderBlockMinusBrikHole6_Q0D1 HolderBlockHole7_Q0D1 HolderBlockHole7Ori_Q0D1

Shape BRIK HolderBlockHole8_Q0D1
HolderBlockHole8_Q0D1.Parameters 0.362 0.432 0.201
Orientation HolderBlockHole8Ori_Q0D1
HolderBlockHole8Ori_Q0D1.Position 4.718 -3.531 -0.654

Shape Subtraction HolderBlockMinusBrikHole8_Q0D1
HolderBlockMinusBrikHole8_Q0D1.Parameters HolderBlockMinusBrikHole7_Q0D1 HolderBlockHole8_Q0D1 HolderBlockHole8Ori_Q0D1

#Adding in the additional tabs on this side
Shape BRIK HolderBlockTab1_Q0D1
HolderBlockTab1_Q0D1.Parameters 0.076 0.305 0.47
Orientation HolderBlockTab1Ori_Q0D1
HolderBlockTab1Ori_Q0D1.Position -5.004 -4.445 -0.7955

Shape Union HolderBlockPlusBrikTab1_Q0D1
HolderBlockPlusBrikTab1_Q0D1.Parameters HolderBlockMinusBrikHole8_Q0D1 HolderBlockTab1_Q0D1 HolderBlockTab1Ori_Q0D1

Shape BRIK HolderBlockTab2_Q0D1
HolderBlockTab2_Q0D1.Parameters 0.076 0.254 0.4065
Orientation HolderBlockTab2Ori_Q0D1
HolderBlockTab2Ori_Q0D1.Position 5.004 -4.217 -0.8595

Shape Union HolderBlockPlusBrikTab2_Q0D1
HolderBlockPlusBrikTab2_Q0D1.Parameters HolderBlockPlusBrikTab1_Q0D1 HolderBlockTab2_Q0D1 HolderBlockTab2Ori_Q0D1

Shape BRIK HolderBlockTab3_Q0D1
HolderBlockTab3_Q0D1.Parameters 0.286 0.292 0.47
Orientation HolderBlockTab3Ori_Q0D1
HolderBlockTab3Ori_Q0D1.Position 4.508 4.458 -0.7565

Shape Union HolderBlockPlusBrikTab3_Q0D1
HolderBlockPlusBrikTab3_Q0D1.Parameters HolderBlockPlusBrikTab2_Q0D1 HolderBlockTab3_Q0D1 HolderBlockTab3Ori_Q0D1

Shape BRIK HolderBlockTab4_Q0D1
HolderBlockTab4_Q0D1.Parameters 0.743 0.254 0.2275
Orientation HolderBlockTab4Ori_Q0D1
HolderBlockTab4Ori_Q0D1.Position -4.337 5.004 -.226

Shape Union HolderBlockPlusBrikTab4_Q0D1
HolderBlockPlusBrikTab4_Q0D1.Parameters HolderBlockPlusBrikTab3_Q0D1 HolderBlockTab4_Q0D1 HolderBlockTab4Ori_Q0D1

Shape BRIK HolderBlockTab5_Q0D1
HolderBlockTab5_Q0D1.Parameters 0.3685 0.1015 0.4065
Orientation HolderBlockTab5Ori_Q0D1
HolderBlockTab5Ori_Q0D1.Position -4.7115 5.1565 -.86

Shape Union HolderBlockPlusBrikTab5_Q0D1
HolderBlockPlusBrikTab5_Q0D1.Parameters HolderBlockPlusBrikTab4_Q0D1 HolderBlockTab5_Q0D1 HolderBlockTab5Ori_Q0D1

Shape BRIK HolderBlockTab6_Q0D1
HolderBlockTab6_Q0D1.Parameters 0.457 0.1525 0.2415
Orientation HolderBlockTab6Ori_Q0D1
HolderBlockTab6Ori_Q0D1.Position -5.537 4.8005 0.296

Shape Union HolderBlockPlusBrikTab6_Q0D1
HolderBlockPlusBrikTab6_Q0D1.Parameters HolderBlockPlusBrikTab5_Q0D1 HolderBlockTab6_Q0D1 HolderBlockTab6Ori_Q0D1

#following two tabs are on the side closest to the HV board
Shape BRIK HolderBlockTab7_Q0D1
HolderBlockTab7_Q0D1.Parameters 0.457 0.216 0.2415
Orientation HolderBlockTab7Ori_Q0D1
HolderBlockTab7Ori_Q0D1.Position -5.537 -4.242 0.296

Shape Union HolderBlockPlusBrikTab7_Q0D1
HolderBlockPlusBrikTab7_Q0D1.Parameters HolderBlockPlusBrikTab6_Q0D1 HolderBlockTab7_Q0D1 HolderBlockTab7Ori_Q0D1

Shape BRIK HolderBlockTab8_Q0D1
HolderBlockTab8_Q0D1.Parameters 0.178 1.7465 1.27
Orientation HolderBlockTab8Ori_Q0D1
HolderBlockTab8Ori_Q0D1.Position 5.258 -3.6385 0.8165

Shape Union HolderBlockPlusBrikTab8_Q0D1
HolderBlockPlusBrikTab8_Q0D1.Parameters HolderBlockPlusBrikTab7_Q0D1 HolderBlockTab8_Q0D1 HolderBlockTab8Ori_Q0D1

#Following two tabs are the tabs that line up with the LV board
Shape BRIK HolderBlockTab9_Q0D1
HolderBlockTab9_Q0D1.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab9Ori_Q0D1
HolderBlockTab9Ori_Q0D1.Position -4.4325 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab9_Q0D1
HolderBlockPlusBrikTab9_Q0D1.Parameters HolderBlockPlusBrikTab8_Q0D1 HolderBlockTab9_Q0D1 HolderBlockTab9Ori_Q0D1

Shape BRIK HolderBlockTab10_Q0D1
HolderBlockTab10_Q0D1.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab10Ori_Q0D1
HolderBlockTab10Ori_Q0D1.Position 4.1655 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab10_Q0D1
HolderBlockPlusBrikTab10_Q0D1.Parameters HolderBlockPlusBrikTab9_Q0D1 HolderBlockTab10_Q0D1 HolderBlockTab10Ori_Q0D1

#Now going to the opposite side of the holder
#Like above, I will start by subtracting then move to adding mass
Shape BRIK HolderBlockHole9_Q0D1
HolderBlockHole9_Q0D1.Parameters 0.445 4.2035 0.33
Orientation HolderBlockHole9Ori_Q0D1
HolderBlockHole9Ori_Q0D1.Position 4.483 0.0385 0.5305

Shape Subtraction HolderBlockPlusBrikHole9_Q0D1
HolderBlockPlusBrikHole9_Q0D1.Parameters HolderBlockPlusBrikTab10_Q0D1 HolderBlockHole9_Q0D1 HolderBlockHole9Ori_Q0D1

Shape BRIK HolderBlockHole10_Q0D1
HolderBlockHole10_Q0D1.Parameters 0.3525 4.045 0.33
Orientation HolderBlockHole10Ori_Q0D1
HolderBlockHole10Ori_Q0D1.Position -4.7275 0.603 0.5305

Shape Subtraction HolderBlockPlusBrikHole10_Q0D1
HolderBlockPlusBrikHole10_Q0D1.Parameters HolderBlockPlusBrikHole9_Q0D1 HolderBlockHole10_Q0D1 HolderBlockHole10Ori_Q0D1

#Adding mass now
Shape BRIK HolderBlockTab11_Q0D1
HolderBlockTab11_Q0D1.Parameters 0.254 0.305 0.616
Orientation HolderBlockTab11Ori_Q0D1
HolderBlockTab11Ori_Q0D1.Position -4.674 -4.445 1.4705

Shape Union HolderBlockPlusBrikTab11_Q0D1
HolderBlockPlusBrikTab11_Q0D1.Parameters HolderBlockPlusBrikHole10_Q0D1 HolderBlockTab11_Q0D1 HolderBlockTab11Ori_Q0D1

Shape BRIK HolderBlockTab112_Q0D1
HolderBlockTab112_Q0D1.Parameters 0.076 0.305 0.2095
Orientation HolderBlockTab112Ori_Q0D1
HolderBlockTab112Ori_Q0D1.Position -5.004 -4.445 1.064

Shape Union HolderBlockPlusBrikTab112_Q0D1
HolderBlockPlusBrikTab112_Q0D1.Parameters HolderBlockPlusBrikTab11_Q0D1 HolderBlockTab112_Q0D1 HolderBlockTab112Ori_Q0D1

Shape BRIK HolderBlockTab12_Q0D1
HolderBlockTab12_Q0D1.Parameters 0.743 0.1015 0.4265
Orientation HolderBlockTab12Ori_Q0D1
HolderBlockTab12Ori_Q0D1.Position -4.337 4.8515 .428

Shape Union HolderBlockPlusBrikTab12_Q0D1
HolderBlockPlusBrikTab12_Q0D1.Parameters HolderBlockPlusBrikTab112_Q0D1 HolderBlockTab12_Q0D1 HolderBlockTab12Ori_Q0D1

#This tab should be 0.8045 apparentl in the z direction
Shape BRIK HolderBlockTab13_Q0D1
HolderBlockTab13_Q0D1.Parameters 0.3685 0.051 0.4045
Orientation HolderBlockTab13Ori_Q0D1
HolderBlockTab13Ori_Q0D1.Position -3.9625 5.004 1.282

Shape Union HolderBlockPlusBrikTab13_Q0D1
HolderBlockPlusBrikTab13_Q0D1.Parameters HolderBlockPlusBrikTab12_Q0D1 HolderBlockTab13_Q0D1 HolderBlockTab13Ori_Q0D1

Shape BRIK HolderBlockTab14_Q0D1
HolderBlockTab14_Q0D1.Parameters 0.286 0.292 .5335
Orientation HolderBlockTab14Ori_Q0D1
HolderBlockTab14Ori_Q0D1.Position 4.508 4.458 0.74

Shape Union HolderBlockPlusBrikTab14_Q0D1
HolderBlockPlusBrikTab14_Q0D1.Parameters HolderBlockPlusBrikTab13_Q0D1 HolderBlockTab14_Q0D1 HolderBlockTab14Ori_Q0D1

Shape BRIK HolderBlockTab15_Q0D1
HolderBlockTab15_Q0D1.Parameters 0.076 0.254 0.6415
Orientation HolderBlockTab15Ori_Q0D1
HolderBlockTab15Ori_Q0D1.Position 5.004 3.658 1.445

Shape Union HolderBlockPlusBrikTab15_Q0D1
HolderBlockPlusBrikTab15_Q0D1.Parameters HolderBlockPlusBrikTab14_Q0D1 HolderBlockTab15_Q0D1 HolderBlockTab15Ori_Q0D1

#Hole for the stupid skewer things
Shape TUBS HolderRodHole_Q0D1
HolderRodHole_Q0D1.Parameters 0.0 0.16 2.11 0.0 360.0
Orientation HolderRodHole_Ori_Q0D1
HolderRodHole_Ori_Q0D1.Position 4.508 4.471 0.0

Shape SUBTRACTION HolderBlockMinusRodHole_Q0D1
HolderBlockMinusRodHole_Q0D1.Parameters HolderBlockPlusBrikTab15_Q0D1 HolderRodHole_Q0D1 HolderRodHole_Ori_Q0D1

Volume Holder_Q0D1
Holder_Q0D1.Material al6061
Holder_Q0D1.Visibility 1
Holder_QD00.Color 15
Holder_Q0D1.Shape HolderBlockMinusRodHole_Q0D1
Holder_Q0D1.Rotation 0.0 0.0 0.0
Holder_Q0D1.Position {-0.6555+Xshift} {-0.574+Yshift} {-.0005+Zshift}
Holder_Q0D1.Mother DetectorQ0D1

# adding new aluminum bar that is on the far end of the holder on the opposite side of the LV interposer board
Volume AlBar_Q0D1
AlBar_Q0D1.Material al6061
AlBar_Q0D1.Visibility 1
AlBar_Q0D1.Color 20
AlBar_Q0D1.Shape Brik 3.9 0.0735 0.273
#AlBar_Q0D1.Position  {-0.582+Xshift} {4.2495+Yshift} {-0.067+Zshift}
AlBar_Q0D1.Position  {-.345+Xshift} {4.2345+Yshift} {-0.067+Zshift}
AlBar_Q0D1.Mother DetectorQ0D1


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
#AlSide1.Mother DetectorQ0D1
#AlSide1.Position {-5.307+Xshift}  {-0.547+Yshift}  0.206

#Updating this to be a boolean shape 

Shape BRIK LV_Block_Q0D1
LV_Block_Q0D1.Parameters 4.661 1.552 0.0795
Shape TRD1 LV_TRD_Hole_Q0D1
LV_TRD_Hole_Q0D1.Parameters 3.7245 2.756 0.08 0.4295
Orientation LV_TRD_HoleOri_Q0D1
LV_TRD_HoleOri_Q0D1.Rotation 90.0 0.0 0.0
LV_TRD_HoleOri_Q0D1.Position 0.1445 1.1225 0.0

Shape Subtraction LVBlockMinusTRDHole_Q0D1
LVBlockMinusTRDHole_Q0D1.Parameters LV_Block_Q0D1 LV_TRD_Hole_Q0D1 LV_TRD_HoleOri_Q0D1

Shape BRIK LVL3_Q0D1
LVL3_Q0D1.Parameters .203 .3365 .08
Orientation LVL3_Ori_Q0D1
LVL3_Ori_Q0D1.Position 4.458 1.2155  0.0

Shape Subtraction LVBlockMinusLVL3_Q0D1
LVBlockMinusLVL3_Q0D1.Parameters LVBlockMinusTRDHole_Q0D1 LVL3_Q0D1 LVL3_Ori_Q0D1

Shape BRIK LVL4_Q0D1
LVL4_Q0D1.Parameters .2795 .536 .08
Orientation LVL4_Ori_Q0D1
LVL4_Ori_Q0D1.Position -4.3815 1.016  0.0

Shape Subtraction LVBlockMinusLVL4_Q0D1
LVBlockMinusLVL4_Q0D1.Parameters LVBlockMinusLVL3_Q0D1 LVL4_Q0D1 LVL4_Ori_Q0D1

Shape BRIK LVL6_Q0D1
LVL6_Q0D1.Parameters .303 .5535 .08
Orientation LVL6_Ori_Q0D1
LVL6_Ori_Q0D1.Position -4.458 -0.6825  0.0

Shape Subtraction LVBlockMinusLVL6_Q0D1
LVBlockMinusLVL6_Q0D1.Parameters LVBlockMinusLVL4_Q0D1 LVL6_Q0D1 LVL6_Ori_Q0D1


Volume LVL1_Q0D1
LVL1_Q0D1.Material ro4003
LVL1_Q0D1.Visibility 1
LVL1_Q0D1.Color 52
LVL1_Q0D1.Shape LVBlockMinusLVL6
LVL1_Q0D1.Mother DetectorQ0D1
#LVL1_Q0D1.Position {-0.1435+Xshift} {-3.691+Yshift} 0.967
# Seems like the LV board is shifted slightly off center. Having a hard time getting this measurement
# therefore, if something seems off check this shift here. Currently saying it is shifted by .178 cm
LVL1_Q0D1.Position {-0.8335+Xshift} {-4.417+Yshift} {-0.935+Zshift}

Volume LVL5_Q0D1
LVL5_Q0D1.Material ro4003
LVL5_Q0D1.Mother DetectorQ0D1
LVL5_Q0D1.Shape BRIK 4.661 0.158 0.978
LVL5_Q0D1.Visibility 1
LVL5_Q0D1.Color 3
LVL5_Q0D1.Position {-0.8335+Xshift} {-6.127+Yshift} {-0.0365+Zshift}

//Flex Clamp Block
Volume LVFlexBlock_Q0D1
#LVFlexBlock_Q0D1.Material al6061
LVFlexBlock_Q0D1.Material steel_304
LVFlexBlock_Q0D1.Mother DetectorQ0D1
LVFlexBlock_Q0D1.Visibility 1
LVFlexBlock_Q0D1.Color 7
LVFlexBlock_Q0D1.Shape BRIK 3.9155 0.2385 0.286
LVFlexBlock_Q0D1.Position {-0.929+Xshift} {-6.5235+Yshift} {0.4015+Zshift}

Volume LVFlexSmBlock1_Q0D1
#LVFlexSmBlock1_Q0D1.Material al6061
LVFlexSmBlock1_Q0D1.Material steel_304
LVFlexSmBlock1_Q0D1.Mother DetectorQ0D1
LVFlexSmBlock1_Q0D1.Visibility 1
LVFlexSmBlock1_Q0D1.Color 7
LVFlexSmBlock1_Q0D1.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock1_Q0D1.Position {2.8235+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

Volume LVFlexSmBlock2_Q0D1
LVFlexSmBlock2_Q0D1.Material steel_304
LVFlexSmBlock2_Q0D1.Mother DetectorQ0D1
LVFlexSmBlock2_Q0D1.Visibility 1
LVFlexSmBlock2_Q0D1.Color 7
LVFlexSmBlock2_Q0D1.Shape BRIK 0.163 0.2385 0.292
LVFlexSmBlock2_Q0D1.Position {-4.6815+Xshift} {-6.5235+Yshift} {-0.1765+Zshift}

////////////////////////////////////////////////
// High voltage boards
_Q0D1///////////////////////////////////////////////
#Making this a Boolean shape
Shape BRIK HVBlock_Q0D1
HVBlock_Q0D1.Parameters 1.5645 4.934 0.0795
Shape BRIK HVLH1_Q0D1
HVLH1_Q0D1.Parameters 1.128 0.3225 0.08
Orientation HVLH1_Ori_Q0D1
HVLH1_Ori_Q0D1.Position .4365 -4.6115 0.0

Shape SUBTRACTION HVBlockMinusHVLH1_Q0D1
HVBlockMinusHVLH1_Q0D1.Parameters HVBlock_Q0D1 HVLH1_Q0D1 HVLH1_Ori_Q0D1

Shape BRIK HVLH2_Q0D1
HVLH2_Q0D1.Parameters 0.32 0.292 0.08
Orientation HVLH2_Ori_Q0D1
HVLH2_Ori_Q0D1.Position 1.2445 -3.997 0.0

Shape SUBTRACTION HVBlockMinusHVLH2_Q0D1
HVBlockMinusHVLH2_Q0D1.Parameters HVBlockMinusHVLH1_Q0D1 HVLH2_Q0D1 HVLH2_Ori_Q0D1

Shape BRIK HVLH3_Q0D1
HVLH3_Q0D1.Parameters 1.168 0.089 0.08
Orientation HVLH3_Ori_Q0D1
HVLH3_Ori_Q0D1.Position 0.3965 4.845 0.0

Shape SUBTRACTION HVBlockMinusHVLH3_Q0D1
HVBlockMinusHVLH3_Q0D1.Parameters HVBlockMinusHVLH2_Q0D1 HVLH3_Q0D1 HVLH3_Ori_Q0D1

Shape BRIK HVLH4_Q0D1
HVLH4_Q0D1.Parameters 0.397 0.165 0.08
Orientation HVLH4_Ori_Q0D1
HVLH4_Ori_Q0D1.Position 1.1675 4.591 0.0

Shape SUBTRACTION HVBlockMinusHVLH4_Q0D1
HVBlockMinusHVLH4_Q0D1.Parameters HVBlockMinusHVLH3_Q0D1 HVLH4_Q0D1 HVLH4_Ori_Q0D1

Shape TRD1 HVLH5_Q0D1
HVLH5_Q0D1.Parameters 3.7245 2.756 0.09 0.4295
Orientation HVLH5_Ori_Q0D1
HVLH5_Ori_Q0D1.Position 1.135 0.401 0.0
HVLH5_Ori_Q0D1.Rotation 90.0 0.0 270.0

Shape SUBTRACTION HVBlockMinusHVLH5_Q0D1
HVBlockMinusHVLH5_Q0D1.Parameters HVBlockMinusHVLH4_Q0D1 HVLH5_Q0D1 HVLH5_Ori_Q0D1

Volume HVL1_Q0D1
HVL1_Q0D1.Material ro4003
HVL1_Q0D1.Visibility 1
HVL1_Q0D1.Color 94
HVL1_Q0D1.Shape HVBlockMinusHVLH5
HVL1_Q0D1.Mother DetectorQ0D1
HVL1_Q0D1.Position {-5.085+Xshift} {-0.4+Yshift} {.934+Zshift}
#HVL1_Q0D1.Position {-5.085+Xshift} {-0.4+Yshift} .88
HVL1_Q0D1.Rotation 0.0 0.0 0.0

#Making the HVL5 board also a boolean shape

Shape BRIK HVL5Block_Q0D1
HVL5Block_Q0D1.Parameters 0.1585 4.934 0.978
Shape BRIK HVL5H1_Q0D1
HVL5H1_Q0D1.Parameters 0.16 0.216 0.505
Orientation HVL5H1_Ori_Q0D1
HVL5H1_Ori_Q0D1.Position 0.0 -4.718 -0.473

Shape SUBTRACTION HVL5BlockMinusH1_Q0D1
HVL5BlockMinusH1_Q0D1.Parameters HVL5Block_Q0D1 HVL5H1_Q0D1 HVL5H1_Ori_Q0D1

Shape BRIK HVL5H2_Q0D1
HVL5H2_Q0D1.Parameters 0.16 0.216 0.2445
Orientation HVL5H2_Ori_Q0D1
HVL5H2_Ori_Q0D1.Position 0.0 -4.718 0.7335

Shape SUBTRACTION HVL5BlockMinusH2_Q0D1
HVL5BlockMinusH2_Q0D1.Parameters HVL5BlockMinusH1_Q0D1 HVL5H2_Q0D1 HVL5H2_Ori_Q0D1

Shape BRIK HVL5H3_Q0D1
HVL5H3_Q0D1.Parameters 0.16 0.1335 0.4365
Orientation HVL5H3_Ori_Q0D1
HVL5H3_Ori_Q0D1.Position 0.0 4.8005 -0.5415

Shape SUBTRACTION HVL5BlockMinusH3_Q0D1
HVL5BlockMinusH3_Q0D1.Parameters HVL5BlockMinusH2_Q0D1 HVL5H3_Q0D1 HVL5H3_Ori_Q0D1

Volume HVL5_Q0D1
HVL5_Q0D1.Material roTMM3
HVL5_Q0D1.Mother DetectorQ0D1
HVL5_Q0D1.Visibility 1
HVL5_Q0D1.Color 3
HVL5_Q0D1.Shape HVL5BlockMinusH3
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -0.062
#HVL5.Position {-6.808+Xshift} {-0.4+Yshift} -.0185
HVL5_Q0D1.Position {-6.808+Xshift} {-0.4+Yshift} {.0355+Zshift}

#adding a block to represent the capacitors
Volume HV_Caps_Q0D1
HV_Caps_Q0D1.Material Class1Cap
HV_Caps_Q0D1.Mother DetectorQ0D1
HV_Caps_Q0D1.Visibility 1
HV_Caps_Q0D1.Color 4
HV_Caps_Q0D1.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps_Q0D1.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)+0.5*.6401}

Volume HV_Caps2_Q0D1
HV_Caps2_Q0D1.Material Class1Cap
HV_Caps2_Q0D1.Mother DetectorQ0D1
HV_Caps2_Q0D1.Visibility 1
HV_Caps2_Q0D1.Color 4
HV_Caps2_Q0D1.Shape Brik {0.5*0.574} {0.5*6.604} {0.5*.6401}
HV_Caps2_Q0D1.Position {(-6.808+Xshift)+0.5*0.574+.16} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}


#Adding in solder
Volume DetSolder_Q0D1
DetSolder_Q0D1.Material solder
DetSolder_Q0D1.Visibility 1
DetSolder_Q0D1.Color 12
DetSolder_Q0D1.Shape BRIK DetectorHalfWidth .3 0.1217
DetSolder_Q0D1.Rotation 90.0 0.0 90.0
DetSolder_Q0D1.Position {(-6.808+Xshift)+2*0.5*0.574+.16+.1217} {(-0.4+Yshift)} {(.0355+Zshift)-.6401}
DetSolder_Q0D1.Mother DetectorQ0D1


//Flex Clamp Block
Volume HVFlexBlock_Q0D1
HVFlexBlock_Q0D1.Material al6061
HVFlexBlock_Q0D1.Mother DetectorQ0D1
HVFlexBlock_Q0D1.Visibility 1
HVFlexBlock_Q0D1.Color 7
HVFlexBlock_Q0D1.Shape BRIK 0.2385 3.9155 0.286
HVFlexBlock_Q0D1.Position {-7.2055+Xshift} {-0.1995+Yshift} {-0.3945+Zshift}

Volume HVFlexSmBlock1_Q0D1
HVFlexSmBlock1_Q0D1.Material al6061
HVFlexSmBlock1_Q0D1.Mother DetectorQ0D1
HVFlexSmBlock1_Q0D1.Visibility 1
HVFlexSmBlock1_Q0D1.Color 7
HVFlexSmBlock1_Q0D1.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock1_Q0D1.Position {-7.2055+Xshift} {3.553+Yshift} {0.1895+Zshift}

Volume HVFlexSmBlock2_Q0D1
HVFlexSmBlock2_Q0D1.Material al6061
HVFlexSmBlock2_Q0D1.Mother DetectorQ0D1
HVFlexSmBlock2_Q0D1.Visibility 1
HVFlexSmBlock2_Q0D1.Color 7
HVFlexSmBlock2_Q0D1.Shape BRIK 0.2385 0.163 0.292
HVFlexSmBlock2_Q0D1.Position {-7.2055+Xshift} {-3.952+Yshift} {0.1895+Zshift}

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
Volume In_PassGe_Q0D1
In_PassGe_Q0D1.Material indium
In_PassGe_Q0D1.Visibility 1
In_PassGe_Q0D1.Color 90
In_PassGe_Q0D1.Shape BRIK .3555 1.2445 .005

In_PassGe_Q0D1.Copy In_PassGe1_Q0D1
In_PassGe_Q0D1.Copy In_PassGe2_Q0D1
In_PassGe_Q0D1.Copy In_PassGe3_Q0D1
In_PassGe_Q0D1.Copy In_PassGe4_Q0D1


In_PassGe1_Q0D1.Mother DetectorQ0D1
In_PassGe1_Q0D1.Position {3.785+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe2_Q0D1.Mother DetectorQ0D1
In_PassGe2_Q0D1.Position {3.785+Xshift} {0.0+Yshift} {-0.08+Zshift}
In_PassGe3_Q0D1.Mother DetectorQ0D1
In_PassGe3_Q0D1.Position {-5.096+Xshift} {0.0+Yshift} {-0.195+Zshift}
In_PassGe4_Q0D1.Mother DetectorQ0D1
In_PassGe4_Q0D1.Position {-5.096+Xshift} {0.0+Yshift} {-0.08+Zshift}

Volume In_PassAlNi_Q0D1
In_PassAlNi_Q0D1.Material indium
In_PassAlNi_Q0D1.Visibility 1
In_PassAlNi_Q0D1.Color 90
In_PassAlNi_Q0D1.Shape BRIK .3555 1.2445 .05

In_PassAlNi_Q0D1.Copy In_PassAlNi1_Q0D1
In_PassAlNi_Q0D1.Copy In_PassAlNi2_Q0D1

# Not sure why the same z positions are not working for In_PassGe3 and In_PassAlNi_Q0D12 but this is the only way I can remove the overlap.
In_PassAlNi1_Q0D1.Mother DetectorQ0D1
In_PassAlNi1_Q0D1.Position {3.785+Xshift} {0.0+Yshift} {-0.140+Zshift}
In_PassAlNi2_Q0D1.Mother DetectorQ0D1
In_PassAlNi2_Q0D1.Position {-5.096+Xshift} {0.0+Yshift} {-0.140+Zshift}

# Not including the detector clamp buttons

#Dummy approximation of the detector clamps
# 4130 Steel
Shape Brik BigClamp_Q0D1
BigClamp_Q0D1.Parameters 3.041 0.3175 0.178 
Shape Brik SmallClamp1_Q0D1
SmallClamp1_Q0D1.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp1Ori_Q0D1
SmallClamp1Ori_Q0D1.Position 2.99 0.0 0.4465

Shape UNION BigClampPlusSmallClamp1_Q0D1
BigClampPlusSmallClamp1_Q0D1.Parameters BigClamp_Q0D1 SmallClamp1_Q0D1 SmallClamp1Ori_Q0D1

Shape Brik SmallClamp2_Q0D1
SmallClamp2_Q0D1.Parameters 0.0255 0.3175 0.2685
Orientation SmallClamp2Ori_Q0D1
SmallClamp2Ori_Q0D1.Position -2.99 0.0 0.4465


Shape Union BigClampPlusSmallClamp2_Q0D1
BigClampPlusSmallClamp2_Q0D1.Parameters BigClampPlusSmallClamp1_Q0D1 SmallClamp2_Q0D1 SmallClamp2Ori_Q0D1

Volume DetClamp_Q0D1
DetClamp_Q0D1.Material steel_4130
DetClamp_Q0D1.Visibility 1
DetClamp_Q0D1.Color 67
DetClamp_Q0D1.Shape BigClampPlusSmallClamp2
DetClamp_Q0D1.Rotation 0.0 0.0 90.0
DetClamp_Q0D1.Position {3.9485+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp_Q0D1.Mother DetectorQ0D1

Volume DetClamp2_Q0D1
DetClamp2_Q0D1.Material steel_4130
DetClamp2_Q0D1.Visibility 1
DetClamp2_Q0D1.Color 67
DetClamp2_Q0D1.Shape BigClampPlusSmallClamp2
DetClamp2_Q0D1.Rotation 0.0 0.0 90.0
DetClamp2_Q0D1.Position {-5.253+Xshift}  {0.0+Yshift}  {-1.048+Zshift}
DetClamp2_Q0D1.Mother DetectorQ0D1

#Dummy approximation of the preload hardware 
# 304 Stainless Steel
Volume Preload_Q0D1
Preload_Q0D1.Material steel_304
Preload_Q0D1.Visibility 1
Preload_Q0D1.Color 71
Preload_Q0D1.Shape TUBE 0.0 0.255 0.3365 0.0 360.0

Preload_Q0D1.Copy Preload1_Q0D1
Preload_Q0D1.Copy Preload2_Q0D1
Preload_Q0D1.Copy Preload3_Q0D1
Preload_Q0D1.Copy Preload4_Q0D1

Preload1_Q0D1.Position {3.9485+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload1_Q0D1.Mother DetectorQ0D1
Preload2_Q0D1.Position {3.9485+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload2_Q0D1.Mother DetectorQ0D1
Preload3_Q0D1.Position {-5.253+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload3_Q0D1.Mother DetectorQ0D1
Preload4_Q0D1.Position {-5.253+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload4_Q0D1.Mother DetectorQ0D1



# Steel - very dummy approximation of the screws we need

#Volume ScrewDummy
#ScrewDummy.Material Steel_18_8
#ScrewDummy.Visibility 1
#ScrewDummy.Color 5
#ScrewDummy.Shape BRIK 0.5 0.5 0.375

#ScrewDummy.Copy ScrewDummy1
#ScrewDummy.Copy ScrewDummy2

#ScrewDummy1.Mother DetectorQ0D1
#ScrewDummy1.Position  {4.5+Xshift}  {-3.6+Yshift}  -0.45

#ScrewDummy2.Mother DetectorQ0D1
#ScrewDummy2.Position  {4.5+Xshift}  {3.0+Yshift}  -0.45


