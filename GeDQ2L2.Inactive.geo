# A single germanium detector volume for the COSI EM Cryostat

Volume Q2L2SingleDetector
Q2L2SingleDetector.Material Vacuum
Q2L2SingleDetector.Shape BRIK  1000 1000 1000
Q2L2SingleDetector.Visibility 0
Q2L2SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q2L2WaferOuterBox
Q2L2WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q2L2WaferCutDisk
Q2L2WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q2L2WholeWafer
Q2L2WholeWafer.Parameters Q2L2WaferOuterBox Q2L2WaferCutDisk

# Create the active wafer
Shape BRIK Q2L2ActiveWaferOuterBox
Q2L2ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q2L2ActiveWaferCutDisk
Q2L2ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q2L2ActiveWafer
Q2L2ActiveWafer.Parameters Q2L2ActiveWaferOuterBox Q2L2ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q2L2GuardRing_AlmostThere
Q2L2GuardRing_AlmostThere.Parameters Q2L2WholeWafer Q2L2ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q2L2GuardRing
Q2L2GuardRing.Parameters Q2L2WaferOuterBox Q2L2GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q2L2_GeWafer
Q2L2_GeWafer.Material Aluminium
Q2L2_GeWafer.Visibility 1
Q2L2_GeWafer.Color 4
Q2L2_GeWafer.Shape Q2L2ActiveWafer
Q2L2_GeWafer.Mother Q2L2SingleDetector
Q2L2_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q2L2GeWaferGuardRing
Q2L2GeWaferGuardRing.Material Aluminium
Q2L2GeWaferGuardRing.Visibility 1
Q2L2GeWaferGuardRing.Color 3
Q2L2GeWaferGuardRing.Shape Q2L2GuardRing
Q2L2GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q2L2GeWaferGuardRing.Mother Q2L2SingleDetector

# Al dead layer on top
Shape BRIK Q2L2stripsAl1
Q2L2stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L2WaferCutDisk1
Q2L2WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L2AlDead1
Q2L2AlDead1.Parameters Q2L2stripsAl1 Q2L2WaferCutDisk1

Volume Q2L2stripsAl
Q2L2stripsAl.Material Aluminium
Q2L2stripsAl.Visibility 1
Q2L2stripsAl.Color 7
Q2L2stripsAl.Shape Q2L2AlDead1
Q2L2stripsAl.Mother Q2L2SingleDetector
Q2L2stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q2L2stripsAl2
Q2L2stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L2WaferCutDisk2
Q2L2WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L2AlDead2
Q2L2AlDead2.Parameters Q2L2stripsAl2 Q2L2WaferCutDisk2

# Al dead layer on the bottom
Volume Q2L2stripsAlbot
Q2L2stripsAlbot.Material Aluminium
Q2L2stripsAlbot.Visibility 1
Q2L2stripsAlbot.Color 7
Q2L2stripsAlbot.Shape Q2L2AlDead2
Q2L2stripsAlbot.Mother Q2L2SingleDetector
Q2L2stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q2L2GeDead1
Q2L2GeDead1.Material Germanium
Q2L2GeDead1.Visibility 1
Q2L2GeDead1.Color 6
Q2L2GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q2L2GeDead1.Copy Q2L2GeDead1_01
Q2L2GeDead1.Copy Q2L2GeDead1_02

Q2L2GeDead1_01.Mother Q2L2SingleDetector
Q2L2GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L2GeDead1_01.Rotation 90.0  0.0 -90.0

Q2L2GeDead1_02.Mother Q2L2SingleDetector
Q2L2GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L2GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q2L2GeDead2
Q2L2GeDead2.Material Germanium
Q2L2GeDead2.Visibility 1
Q2L2GeDead2.Color 6
Q2L2GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q2L2GeDead2.Copy Q2L2GeDead2_01
Q2L2GeDead2.Copy Q2L2GeDead2_02

Q2L2GeDead2_01.Mother Q2L2SingleDetector
Q2L2GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L2GeDead2_01.Rotation 90.0  0.0 -90.0

Q2L2GeDead2_02.Mother Q2L2SingleDetector
Q2L2GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L2GeDead2_02.Rotation 90.0  0.0  90.0


