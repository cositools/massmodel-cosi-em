# A single germanium detector volume for the COSI EM Cryostat

Volume Q2L3SingleDetector
Q2L3SingleDetector.Material Vacuum
Q2L3SingleDetector.Shape BRIK  1000 1000 1000
Q2L3SingleDetector.Visibility 0
Q2L3SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q2L3WaferOuterBox
Q2L3WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q2L3WaferCutDisk
Q2L3WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q2L3WholeWafer
Q2L3WholeWafer.Parameters Q2L3WaferOuterBox Q2L3WaferCutDisk

# Create the active wafer
Shape BRIK Q2L3ActiveWaferOuterBox
Q2L3ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q2L3ActiveWaferCutDisk
Q2L3ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q2L3ActiveWafer
Q2L3ActiveWafer.Parameters Q2L3ActiveWaferOuterBox Q2L3ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q2L3GuardRing_AlmostThere
Q2L3GuardRing_AlmostThere.Parameters Q2L3WholeWafer Q2L3ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q2L3GuardRing
Q2L3GuardRing.Parameters Q2L3WaferOuterBox Q2L3GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q2L3_GeWafer
Q2L3_GeWafer.Material active_ge_recoil
Q2L3_GeWafer.Visibility 1
Q2L3_GeWafer.Color 4
Q2L3_GeWafer.Shape Q2L3ActiveWafer
Q2L3_GeWafer.Mother Q2L3SingleDetector
Q2L3_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q2L3GeWaferGuardRing
Q2L3GeWaferGuardRing.Material active_ge_recoil
Q2L3GeWaferGuardRing.Visibility 1
Q2L3GeWaferGuardRing.Color 3
Q2L3GeWaferGuardRing.Shape Q2L3GuardRing
Q2L3GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q2L3GeWaferGuardRing.Mother Q2L3SingleDetector

# Al dead layer on top
Shape BRIK Q2L3stripsAl1
Q2L3stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L3WaferCutDisk1
Q2L3WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L3AlDead1
Q2L3AlDead1.Parameters Q2L3stripsAl1 Q2L3WaferCutDisk1

Volume Q2L3stripsAl
Q2L3stripsAl.Material Aluminium
Q2L3stripsAl.Visibility 1
Q2L3stripsAl.Color 7
Q2L3stripsAl.Shape Q2L3AlDead1
Q2L3stripsAl.Mother Q2L3SingleDetector
Q2L3stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q2L3stripsAl2
Q2L3stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L3WaferCutDisk2
Q2L3WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L3AlDead2
Q2L3AlDead2.Parameters Q2L3stripsAl2 Q2L3WaferCutDisk2

# Al dead layer on the bottom
Volume Q2L3stripsAlbot
Q2L3stripsAlbot.Material Aluminium
Q2L3stripsAlbot.Visibility 1
Q2L3stripsAlbot.Color 7
Q2L3stripsAlbot.Shape Q2L3AlDead2
Q2L3stripsAlbot.Mother Q2L3SingleDetector
Q2L3stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q2L3GeDead1
Q2L3GeDead1.Material Germanium
Q2L3GeDead1.Visibility 1
Q2L3GeDead1.Color 6
Q2L3GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q2L3GeDead1.Copy Q2L3GeDead1_01
Q2L3GeDead1.Copy Q2L3GeDead1_02

Q2L3GeDead1_01.Mother Q2L3SingleDetector
Q2L3GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L3GeDead1_01.Rotation 90.0  0.0 -90.0

Q2L3GeDead1_02.Mother Q2L3SingleDetector
Q2L3GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L3GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q2L3GeDead2
Q2L3GeDead2.Material Germanium
Q2L3GeDead2.Visibility 1
Q2L3GeDead2.Color 6
Q2L3GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q2L3GeDead2.Copy Q2L3GeDead2_01
Q2L3GeDead2.Copy Q2L3GeDead2_02

Q2L3GeDead2_01.Mother Q2L3SingleDetector
Q2L3GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L3GeDead2_01.Rotation 90.0  0.0 -90.0

Q2L3GeDead2_02.Mother Q2L3SingleDetector
Q2L3GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L3GeDead2_02.Rotation 90.0  0.0  90.0


