# A single germanium detector volume for the COSI EM Cryostat

Volume Q1L2SingleDetector
Q1L2SingleDetector.Material Vacuum
Q1L2SingleDetector.Shape BRIK  1000 1000 1000
Q1L2SingleDetector.Visibility 0
Q1L2SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q1L2WaferOuterBox
Q1L2WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q1L2WaferCutDisk
Q1L2WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q1L2WholeWafer
Q1L2WholeWafer.Parameters Q1L2WaferOuterBox Q1L2WaferCutDisk

# Create the active wafer
Shape BRIK Q1L2ActiveWaferOuterBox
Q1L2ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q1L2ActiveWaferCutDisk
Q1L2ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q1L2ActiveWafer
Q1L2ActiveWafer.Parameters Q1L2ActiveWaferOuterBox Q1L2ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q1L2GuardRing_AlmostThere
Q1L2GuardRing_AlmostThere.Parameters Q1L2WholeWafer Q1L2ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q1L2GuardRing
Q1L2GuardRing.Parameters Q1L2WaferOuterBox Q1L2GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q1L2_GeWafer
Q1L2_GeWafer.Material active_ge_recoil
Q1L2_GeWafer.Visibility 1
Q1L2_GeWafer.Color 4
Q1L2_GeWafer.Shape Q1L2ActiveWafer
Q1L2_GeWafer.Mother Q1L2SingleDetector
Q1L2_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q1L2GeWaferGuardRing
Q1L2GeWaferGuardRing.Material active_ge_recoil
Q1L2GeWaferGuardRing.Visibility 1
Q1L2GeWaferGuardRing.Color 3
Q1L2GeWaferGuardRing.Shape Q1L2GuardRing
Q1L2GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q1L2GeWaferGuardRing.Mother Q1L2SingleDetector

# Al dead layer on top
Shape BRIK Q1L2stripsAl1
Q1L2stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L2WaferCutDisk1
Q1L2WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L2AlDead1
Q1L2AlDead1.Parameters Q1L2stripsAl1 Q1L2WaferCutDisk1

Volume Q1L2stripsAl
Q1L2stripsAl.Material Aluminium
Q1L2stripsAl.Visibility 1
Q1L2stripsAl.Color 7
Q1L2stripsAl.Shape Q1L2AlDead1
Q1L2stripsAl.Mother Q1L2SingleDetector
Q1L2stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q1L2stripsAl2
Q1L2stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L2WaferCutDisk2
Q1L2WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L2AlDead2
Q1L2AlDead2.Parameters Q1L2stripsAl2 Q1L2WaferCutDisk2

# Al dead layer on the bottom
Volume Q1L2stripsAlbot
Q1L2stripsAlbot.Material Aluminium
Q1L2stripsAlbot.Visibility 1
Q1L2stripsAlbot.Color 7
Q1L2stripsAlbot.Shape Q1L2AlDead2
Q1L2stripsAlbot.Mother Q1L2SingleDetector
Q1L2stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q1L2GeDead1
Q1L2GeDead1.Material Germanium
Q1L2GeDead1.Visibility 1
Q1L2GeDead1.Color 6
Q1L2GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q1L2GeDead1.Copy Q1L2GeDead1_01
Q1L2GeDead1.Copy Q1L2GeDead1_02

Q1L2GeDead1_01.Mother Q1L2SingleDetector
Q1L2GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L2GeDead1_01.Rotation 90.0  0.0 -90.0

Q1L2GeDead1_02.Mother Q1L2SingleDetector
Q1L2GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L2GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q1L2GeDead2
Q1L2GeDead2.Material Germanium
Q1L2GeDead2.Visibility 1
Q1L2GeDead2.Color 6
Q1L2GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q1L2GeDead2.Copy Q1L2GeDead2_01
Q1L2GeDead2.Copy Q1L2GeDead2_02

Q1L2GeDead2_01.Mother Q1L2SingleDetector
Q1L2GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L2GeDead2_01.Rotation 90.0  0.0 -90.0

Q1L2GeDead2_02.Mother Q1L2SingleDetector
Q1L2GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L2GeDead2_02.Rotation 90.0  0.0  90.0


