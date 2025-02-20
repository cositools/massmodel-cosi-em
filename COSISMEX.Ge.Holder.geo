# A single germanium detector volume
# COSI SMEX model

Constant Xshift -0.627
Constant Yshift 0.771


Volume SingleDetector
SingleDetector.Material vacuum
#SingleDetector.Shape BRIK  5.3025  4.791  1.07
SingleDetector.Shape BRIK  12.3025  10.791  2.07
SingleDetector.Visibility 0


/////////////////////////////////////////////////////////
// Detector Holder
////////////////////////////////////////////////////////
// I think I need to make this as an organic shape for everything to fit.. ugh
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
HolderBlockHole4Ori.Position 4.445 0.702 -0.5905

Shape Subtraction HolderBlockMinusHole4
HolderBlockMinusHole4.Parameters HolderBlockMinusTrdHole1 HolderBlockHole4 HolderBlockHole4Ori

#This is the low voltage side
Shape BRIK HolderBlockHole5
HolderBlockHole5.Parameters 0.64 3.93 0.274
Orientation HolderBlockHole5Ori
HolderBlockHole5Ori.Position -4.445 0.8255 -0.5905

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
HolderBlockHole7Ori.Position 4.6355 -4.36 -0.5905

Shape Subtraction HolderBlockMinusBrikHole7
HolderBlockMinusBrikHole7.Parameters HolderBlockMinusBrikHole6 HolderBlockHole7 HolderBlockHole7Ori

Shape BRIK HolderBlockHole8
HolderBlockHole8.Parameters 0.362 0.432 0.201
Orientation HolderBlockHole8Ori
HolderBlockHole8Ori.Position -4.718 -3.531 -0.654

Shape Subtraction HolderBlockMinusBrikHole8
HolderBlockMinusBrikHole8.Parameters HolderBlockMinusBrikHole7 HolderBlockHole8 HolderBlockHole8Ori

#Adding in the additional tabs on this side
Shape BRIK HolderBlockTab1
HolderBlockTab1.Parameters 0.076 0.305 0.47
Orientation HolderBlockTab1Ori
HolderBlockTab1Ori.Position 5.004 -4.445 -0.7955

Shape Union HolderBlockPlusBrikTab1
HolderBlockPlusBrikTab1.Parameters HolderBlockMinusBrikHole8 HolderBlockTab1 HolderBlockTab1Ori

Shape BRIK HolderBlockTab2
HolderBlockTab2.Parameters 0.076 0.254 0.4065
Orientation HolderBlockTab2Ori
HolderBlockTab2Ori.Position -5.004 -4.217 -0.8595

Shape Union HolderBlockPlusBrikTab2
HolderBlockPlusBrikTab2.Parameters HolderBlockPlusBrikTab1 HolderBlockTab2 HolderBlockTab2Ori

Shape BRIK HolderBlockTab3
HolderBlockTab3.Parameters 0.286 0.292 0.47
Orientation HolderBlockTab3Ori
HolderBlockTab3Ori.Position -4.508 4.458 -0.7565

Shape Union HolderBlockPlusBrikTab3
HolderBlockPlusBrikTab3.Parameters HolderBlockPlusBrikTab2 HolderBlockTab3 HolderBlockTab3Ori

Shape BRIK HolderBlockTab4
HolderBlockTab4.Parameters 0.743 0.254 0.2275
Orientation HolderBlockTab4Ori
HolderBlockTab4Ori.Position 4.337 5.004 -.226

Shape Union HolderBlockPlusBrikTab4
HolderBlockPlusBrikTab4.Parameters HolderBlockPlusBrikTab3 HolderBlockTab4 HolderBlockTab4Ori

Shape BRIK HolderBlockTab5
HolderBlockTab5.Parameters 0.3685 0.1015 0.4065
Orientation HolderBlockTab5Ori
HolderBlockTab5Ori.Position 4.7115 5.1565 -.86

Shape Union HolderBlockPlusBrikTab5
HolderBlockPlusBrikTab5.Parameters HolderBlockPlusBrikTab4 HolderBlockTab5 HolderBlockTab5Ori

Shape BRIK HolderBlockTab6
HolderBlockTab6.Parameters 0.457 0.1525 0.2415
Orientation HolderBlockTab6Ori
HolderBlockTab6Ori.Position 5.537 4.8005 0.296

Shape Union HolderBlockPlusBrikTab6
HolderBlockPlusBrikTab6.Parameters HolderBlockPlusBrikTab5 HolderBlockTab6 HolderBlockTab6Ori

Shape BRIK HolderBlockTab7
HolderBlockTab7.Parameters 0.457 0.216 0.2415
Orientation HolderBlockTab7Ori
HolderBlockTab7Ori.Position 5.537 -4.242 0.296

Shape Union HolderBlockPlusBrikTab7
HolderBlockPlusBrikTab7.Parameters HolderBlockPlusBrikTab6 HolderBlockTab7 HolderBlockTab7Ori

Shape BRIK HolderBlockTab8
HolderBlockTab8.Parameters 0.178 1.7465 1.27
Orientation HolderBlockTab8Ori
HolderBlockTab8Ori.Position -5.258 -3.6385 0.8165

Shape Union HolderBlockPlusBrikTab8
HolderBlockPlusBrikTab8.Parameters HolderBlockPlusBrikTab7 HolderBlockTab8 HolderBlockTab8Ori

Shape BRIK HolderBlockTab9
HolderBlockTab9.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab9Ori
HolderBlockTab9Ori.Position 4.4325 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab9
HolderBlockPlusBrikTab9.Parameters HolderBlockPlusBrikTab8 HolderBlockTab9 HolderBlockTab9Ori

Shape BRIK HolderBlockTab10
HolderBlockTab10.Parameters 0.2415 0.3175 0.2415
Orientation HolderBlockTab10Ori
HolderBlockTab10Ori.Position -4.1655 -5.0675 0.416

Shape Union HolderBlockPlusBrikTab10
HolderBlockPlusBrikTab10.Parameters HolderBlockPlusBrikTab9 HolderBlockTab10 HolderBlockTab10Ori

#Now going to the opposite side of the holder
#Like above, I will start by subtracting then move to adding mass
Shape BRIK HolderBlockHole9
HolderBlockHole9.Parameters 0.445 4.2035 0.33
Orientation HolderBlockHole9Ori
HolderBlockHole9Ori.Position -4.483 0.0385 0.5305

Shape Subtraction HolderBlockPlusBrikHole9
HolderBlockPlusBrikHole9.Parameters HolderBlockPlusBrikTab10 HolderBlockHole9 HolderBlockHole9Ori

Shape BRIK HolderBlockHole10
HolderBlockHole10.Parameters 0.3525 4.045 0.33
Orientation HolderBlockHole10Ori
HolderBlockHole10Ori.Position 4.7275 0.603 0.5305

Shape Subtraction HolderBlockPlusBrikHole10
HolderBlockPlusBrikHole10.Parameters HolderBlockPlusBrikHole9 HolderBlockHole10 HolderBlockHole10Ori

#Adding mass now
Shape BRIK HolderBlockTab11
HolderBlockTab11.Parameters 0.254 0.305 0.616
Orientation HolderBlockTab11Ori
HolderBlockTab11Ori.Position 4.674 -4.445 1.4705

Shape Union HolderBlockPlusBrikTab11
HolderBlockPlusBrikTab11.Parameters HolderBlockPlusBrikHole10 HolderBlockTab11 HolderBlockTab11Ori

Shape BRIK HolderBlockTab12
HolderBlockTab12.Parameters 0.743 0.1015 0.4265
Orientation HolderBlockTab12Ori
HolderBlockTab12Ori.Position 4.337 4.8515 0.428

Shape Union HolderBlockPlusBrikTab12
HolderBlockPlusBrikTab12.Parameters HolderBlockPlusBrikTab11 HolderBlockTab12 HolderBlockTab12Ori

Shape BRIK HolderBlockTab13
HolderBlockTab13.Parameters 0.3685 0.051 0.8045
Orientation HolderBlockTab13Ori
HolderBlockTab13Ori.Position 3.9625 5.004 1.282

Shape Union HolderBlockPlusBrikTab13
HolderBlockPlusBrikTab13.Parameters HolderBlockPlusBrikTab12 HolderBlockTab13 HolderBlockTab13Ori

Shape BRIK HolderBlockTab14
HolderBlockTab14.Parameters 0.286 0.292 0.5335
Orientation HolderBlockTab14Ori
HolderBlockTab14Ori.Position -4.508 4.458 0.74

Shape Union HolderBlockPlusBrikTab14
HolderBlockPlusBrikTab14.Parameters HolderBlockPlusBrikTab13 HolderBlockTab14 HolderBlockTab14Ori

Shape BRIK HolderBlockTab15
HolderBlockTab15.Parameters 0.076 0.254 0.6415
Orientation HolderBlockTab15Ori
HolderBlockTab15Ori.Position -5.004 3.658 1.445

Shape Union HolderBlockPlusBrikTab15
HolderBlockPlusBrikTab15.Parameters HolderBlockPlusBrikTab14 HolderBlockTab15 HolderBlockTab15Ori


Volume Holder
Holder.Material al6061
Holder.Visibility 1
Hrolder.Color 15
Holder.Shape HolderBlockPlusBrikTab15
Holder.Position 0.0 0.0 10.0
Holder.Mother SingleDetector

