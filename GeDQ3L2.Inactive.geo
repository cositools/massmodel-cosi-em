# A single germanium detector volume for the COSI EM Cryostat

Volume Q3L2SingleDetector
Q3L2SingleDetector.Material Vacuum
Q3L2SingleDetector.Shape BRIK  1000 1000 1000
Q3L2SingleDetector.Visibility 0
Q3L2SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q3L2WaferOuterBox
Q3L2WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q3L2WaferCutDisk
Q3L2WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q3L2WholeWafer
Q3L2WholeWafer.Parameters Q3L2WaferOuterBox Q3L2WaferCutDisk

# Create the active wafer
Shape BRIK Q3L2ActiveWaferOuterBox
Q3L2ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q3L2ActiveWaferCutDisk
Q3L2ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q3L2ActiveWafer
Q3L2ActiveWafer.Parameters Q3L2ActiveWaferOuterBox Q3L2ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q3L2GuardRing_AlmostThere
Q3L2GuardRing_AlmostThere.Parameters Q3L2WholeWafer Q3L2ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q3L2GuardRing
Q3L2GuardRing.Parameters Q3L2WaferOuterBox Q3L2GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q3L2_GeWafer
Q3L2_GeWafer.Material Aluminium
Q3L2_GeWafer.Visibility 1
Q3L2_GeWafer.Color 4
Q3L2_GeWafer.Shape Q3L2ActiveWafer
Q3L2_GeWafer.Mother Q3L2SingleDetector
Q3L2_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q3L2GeWaferGuardRing
Q3L2GeWaferGuardRing.Material Aluminium
Q3L2GeWaferGuardRing.Visibility 1
Q3L2GeWaferGuardRing.Color 3
Q3L2GeWaferGuardRing.Shape Q3L2GuardRing
Q3L2GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q3L2GeWaferGuardRing.Mother Q3L2SingleDetector

# Al dead layer on top
Shape BRIK Q3L2stripsAl1
Q3L2stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q3L2WaferCutDisk1
Q3L2WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q3L2AlDead1
Q3L2AlDead1.Parameters Q3L2stripsAl1 Q3L2WaferCutDisk1

Volume Q3L2stripsAl
Q3L2stripsAl.Material Aluminium
Q3L2stripsAl.Visibility 1
Q3L2stripsAl.Color 7
Q3L2stripsAl.Shape Q3L2AlDead1
Q3L2stripsAl.Mother Q3L2SingleDetector
Q3L2stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q3L2stripsAl2
Q3L2stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q3L2WaferCutDisk2
Q3L2WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q3L2AlDead2
Q3L2AlDead2.Parameters Q3L2stripsAl2 Q3L2WaferCutDisk2

# Al dead layer on the bottom
Volume Q3L2stripsAlbot
Q3L2stripsAlbot.Material Aluminium
Q3L2stripsAlbot.Visibility 1
Q3L2stripsAlbot.Color 7
Q3L2stripsAlbot.Shape Q3L2AlDead2
Q3L2stripsAlbot.Mother Q3L2SingleDetector
Q3L2stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q3L2GeDead1
Q3L2GeDead1.Material Aluminium
Q3L2GeDead1.Visibility 1
Q3L2GeDead1.Color 6
Q3L2GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q3L2GeDead1.Copy Q3L2GeDead1_01
Q3L2GeDead1.Copy Q3L2GeDead1_02

Q3L2GeDead1_01.Mother Q3L2SingleDetector
Q3L2GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q3L2GeDead1_01.Rotation 90.0  0.0 -90.0

Q3L2GeDead1_02.Mother Q3L2SingleDetector
Q3L2GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q3L2GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q3L2GeDead2
Q3L2GeDead2.Material Aluminium
Q3L2GeDead2.Visibility 1
Q3L2GeDead2.Color 6
Q3L2GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q3L2GeDead2.Copy Q3L2GeDead2_01
Q3L2GeDead2.Copy Q3L2GeDead2_02

Q3L2GeDead2_01.Mother Q3L2SingleDetector
Q3L2GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q3L2GeDead2_01.Rotation 90.0  0.0 -90.0

Q3L2GeDead2_02.Mother Q3L2SingleDetector
Q3L2GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q3L2GeDead2_02.Rotation 90.0  0.0  90.0


