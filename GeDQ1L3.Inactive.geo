# A single germanium detector volume for the COSI EM Cryostat

Volume Q1L3SingleDetector
Q1L3SingleDetector.Material Vacuum
Q1L3SingleDetector.Shape BRIK  1000 1000 1000
Q1L3SingleDetector.Visibility 0
Q1L3SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q1L3WaferOuterBox
Q1L3WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q1L3WaferCutDisk
Q1L3WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q1L3WholeWafer
Q1L3WholeWafer.Parameters Q1L3WaferOuterBox Q1L3WaferCutDisk

# Create the active wafer
Shape BRIK Q1L3ActiveWaferOuterBox
Q1L3ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q1L3ActiveWaferCutDisk
Q1L3ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q1L3ActiveWafer
Q1L3ActiveWafer.Parameters Q1L3ActiveWaferOuterBox Q1L3ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q1L3GuardRing_AlmostThere
Q1L3GuardRing_AlmostThere.Parameters Q1L3WholeWafer Q1L3ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q1L3GuardRing
Q1L3GuardRing.Parameters Q1L3WaferOuterBox Q1L3GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q1L3_GeWafer
Q1L3_GeWafer.Material active_ge_recoil
Q1L3_GeWafer.Visibility 1
Q1L3_GeWafer.Color 4
Q1L3_GeWafer.Shape Q1L3ActiveWafer
Q1L3_GeWafer.Mother Q1L3SingleDetector
Q1L3_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q1L3GeWaferGuardRing
Q1L3GeWaferGuardRing.Material active_ge_recoil
Q1L3GeWaferGuardRing.Visibility 1
Q1L3GeWaferGuardRing.Color 3
Q1L3GeWaferGuardRing.Shape Q1L3GuardRing
Q1L3GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q1L3GeWaferGuardRing.Mother Q1L3SingleDetector

# Al dead layer on top
Shape BRIK Q1L3stripsAl1
Q1L3stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L3WaferCutDisk1
Q1L3WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L3AlDead1
Q1L3AlDead1.Parameters Q1L3stripsAl1 Q1L3WaferCutDisk1

Volume Q1L3stripsAl
Q1L3stripsAl.Material Aluminium
Q1L3stripsAl.Visibility 1
Q1L3stripsAl.Color 7
Q1L3stripsAl.Shape Q1L3AlDead1
Q1L3stripsAl.Mother Q1L3SingleDetector
Q1L3stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q1L3stripsAl2
Q1L3stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L3WaferCutDisk2
Q1L3WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L3AlDead2
Q1L3AlDead2.Parameters Q1L3stripsAl2 Q1L3WaferCutDisk2

# Al dead layer on the bottom
Volume Q1L3stripsAlbot
Q1L3stripsAlbot.Material Aluminium
Q1L3stripsAlbot.Visibility 1
Q1L3stripsAlbot.Color 7
Q1L3stripsAlbot.Shape Q1L3AlDead2
Q1L3stripsAlbot.Mother Q1L3SingleDetector
Q1L3stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q1L3GeDead1
Q1L3GeDead1.Material Germanium
Q1L3GeDead1.Visibility 1
Q1L3GeDead1.Color 6
Q1L3GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q1L3GeDead1.Copy Q1L3GeDead1_01
Q1L3GeDead1.Copy Q1L3GeDead1_02

Q1L3GeDead1_01.Mother Q1L3SingleDetector
Q1L3GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L3GeDead1_01.Rotation 90.0  0.0 -90.0

Q1L3GeDead1_02.Mother Q1L3SingleDetector
Q1L3GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L3GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q1L3GeDead2
Q1L3GeDead2.Material Germanium
Q1L3GeDead2.Visibility 1
Q1L3GeDead2.Color 6
Q1L3GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q1L3GeDead2.Copy Q1L3GeDead2_01
Q1L3GeDead2.Copy Q1L3GeDead2_02

Q1L3GeDead2_01.Mother Q1L3SingleDetector
Q1L3GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L3GeDead2_01.Rotation 90.0  0.0 -90.0

Q1L3GeDead2_02.Mother Q1L3SingleDetector
Q1L3GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L3GeDead2_02.Rotation 90.0  0.0  90.0


