# A single germanium detector volume for the COSI EM Cryostat

Volume Q0L3SingleDetector
Q0L3SingleDetector.Material Vacuum
Q0L3SingleDetector.Shape BRIK  1000 1000 1000
Q0L3SingleDetector.Visibility 0
Q0L3SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q0L3WaferOuterBox
Q0L3WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q0L3WaferCutDisk
Q0L3WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q0L3WholeWafer
Q0L3WholeWafer.Parameters Q0L3WaferOuterBox Q0L3WaferCutDisk

# Create the active wafer
Shape BRIK Q0L3ActiveWaferOuterBox
Q0L3ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q0L3ActiveWaferCutDisk
Q0L3ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q0L3ActiveWafer
Q0L3ActiveWafer.Parameters Q0L3ActiveWaferOuterBox Q0L3ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q0L3GuardRing_AlmostThere
Q0L3GuardRing_AlmostThere.Parameters Q0L3WholeWafer Q0L3ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q0L3GuardRing
Q0L3GuardRing.Parameters Q0L3WaferOuterBox Q0L3GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q0L3_GeWafer
Q0L3_GeWafer.Material Aluminium
Q0L3_GeWafer.Visibility 1
Q0L3_GeWafer.Color 4
Q0L3_GeWafer.Shape Q0L3ActiveWafer
Q0L3_GeWafer.Mother Q0L3SingleDetector
Q0L3_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q0L3GeWaferGuardRing
Q0L3GeWaferGuardRing.Material Aluminium
Q0L3GeWaferGuardRing.Visibility 1
Q0L3GeWaferGuardRing.Color 3
Q0L3GeWaferGuardRing.Shape Q0L3GuardRing
Q0L3GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q0L3GeWaferGuardRing.Mother Q0L3SingleDetector

# Al dead layer on top
Shape BRIK Q0L3stripsAl1
Q0L3stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L3WaferCutDisk1
Q0L3WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L3AlDead1
Q0L3AlDead1.Parameters Q0L3stripsAl1 Q0L3WaferCutDisk1

Volume Q0L3stripsAl
Q0L3stripsAl.Material Aluminium
Q0L3stripsAl.Visibility 1
Q0L3stripsAl.Color 7
Q0L3stripsAl.Shape Q0L3AlDead1
Q0L3stripsAl.Mother Q0L3SingleDetector
Q0L3stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q0L3stripsAl2
Q0L3stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L3WaferCutDisk2
Q0L3WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L3AlDead2
Q0L3AlDead2.Parameters Q0L3stripsAl2 Q0L3WaferCutDisk2

# Al dead layer on the bottom
Volume Q0L3stripsAlbot
Q0L3stripsAlbot.Material Aluminium
Q0L3stripsAlbot.Visibility 1
Q0L3stripsAlbot.Color 7
Q0L3stripsAlbot.Shape Q0L3AlDead2
Q0L3stripsAlbot.Mother Q0L3SingleDetector
Q0L3stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q0L3GeDead1
Q0L3GeDead1.Material Aluminium
Q0L3GeDead1.Visibility 1
Q0L3GeDead1.Color 6
Q0L3GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q0L3GeDead1.Copy Q0L3GeDead1_01
Q0L3GeDead1.Copy Q0L3GeDead1_02

Q0L3GeDead1_01.Mother Q0L3SingleDetector
Q0L3GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q0L3GeDead1_01.Rotation 90.0  0.0 -90.0

Q0L3GeDead1_02.Mother Q0L3SingleDetector
Q0L3GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q0L3GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q0L3GeDead2
Q0L3GeDead2.Material Aluminium
Q0L3GeDead2.Visibility 1
Q0L3GeDead2.Color 6
Q0L3GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q0L3GeDead2.Copy Q0L3GeDead2_01
Q0L3GeDead2.Copy Q0L3GeDead2_02

Q0L3GeDead2_01.Mother Q0L3SingleDetector
Q0L3GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q0L3GeDead2_01.Rotation 90.0  0.0 -90.0

Q0L3GeDead2_02.Mother Q0L3SingleDetector
Q0L3GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q0L3GeDead2_02.Rotation 90.0  0.0  90.0


