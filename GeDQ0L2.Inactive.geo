# A single germanium detector volume for the COSI EM Cryostat

Volume Q0L2SingleDetector
Q0L2SingleDetector.Material Vacuum
Q0L2SingleDetector.Shape BRIK  1000 1000 1000
Q0L2SingleDetector.Visibility 0
Q0L2SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q0L2WaferOuterBox
Q0L2WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q0L2WaferCutDisk
Q0L2WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q0L2WholeWafer
Q0L2WholeWafer.Parameters Q0L2WaferOuterBox Q0L2WaferCutDisk

# Create the active wafer
Shape BRIK Q0L2ActiveWaferOuterBox
Q0L2ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q0L2ActiveWaferCutDisk
Q0L2ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q0L2ActiveWafer
Q0L2ActiveWafer.Parameters Q0L2ActiveWaferOuterBox Q0L2ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q0L2GuardRing_AlmostThere
Q0L2GuardRing_AlmostThere.Parameters Q0L2WholeWafer Q0L2ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q0L2GuardRing
Q0L2GuardRing.Parameters Q0L2WaferOuterBox Q0L2GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q0L2_GeWafer
Q0L2_GeWafer.Material active_ge_recoil
Q0L2_GeWafer.Visibility 1
Q0L2_GeWafer.Color 4
Q0L2_GeWafer.Shape Q0L2ActiveWafer
Q0L2_GeWafer.Mother Q0L2SingleDetector
Q0L2_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q0L2GeWaferGuardRing
Q0L2GeWaferGuardRing.Material active_ge_recoil
Q0L2GeWaferGuardRing.Visibility 1
Q0L2GeWaferGuardRing.Color 3
Q0L2GeWaferGuardRing.Shape Q0L2GuardRing
Q0L2GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q0L2GeWaferGuardRing.Mother Q0L2SingleDetector

# Al dead layer on top
Shape BRIK Q0L2stripsAl1
Q0L2stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L2WaferCutDisk1
Q0L2WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L2AlDead1
Q0L2AlDead1.Parameters Q0L2stripsAl1 Q0L2WaferCutDisk1

Volume Q0L2stripsAl
Q0L2stripsAl.Material Aluminium
Q0L2stripsAl.Visibility 1
Q0L2stripsAl.Color 7
Q0L2stripsAl.Shape Q0L2AlDead1
Q0L2stripsAl.Mother Q0L2SingleDetector
Q0L2stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q0L2stripsAl2
Q0L2stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L2WaferCutDisk2
Q0L2WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L2AlDead2
Q0L2AlDead2.Parameters Q0L2stripsAl2 Q0L2WaferCutDisk2

# Al dead layer on the bottom
Volume Q0L2stripsAlbot
Q0L2stripsAlbot.Material Aluminium
Q0L2stripsAlbot.Visibility 1
Q0L2stripsAlbot.Color 7
Q0L2stripsAlbot.Shape Q0L2AlDead2
Q0L2stripsAlbot.Mother Q0L2SingleDetector
Q0L2stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q0L2GeDead1
Q0L2GeDead1.Material Germanium
Q0L2GeDead1.Visibility 1
Q0L2GeDead1.Color 6
Q0L2GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q0L2GeDead1.Copy Q0L2GeDead1_01
Q0L2GeDead1.Copy Q0L2GeDead1_02

Q0L2GeDead1_01.Mother Q0L2SingleDetector
Q0L2GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q0L2GeDead1_01.Rotation 90.0  0.0 -90.0

Q0L2GeDead1_02.Mother Q0L2SingleDetector
Q0L2GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q0L2GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q0L2GeDead2
Q0L2GeDead2.Material Germanium
Q0L2GeDead2.Visibility 1
Q0L2GeDead2.Color 6
Q0L2GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q0L2GeDead2.Copy Q0L2GeDead2_01
Q0L2GeDead2.Copy Q0L2GeDead2_02

Q0L2GeDead2_01.Mother Q0L2SingleDetector
Q0L2GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q0L2GeDead2_01.Rotation 90.0  0.0 -90.0

Q0L2GeDead2_02.Mother Q0L2SingleDetector
Q0L2GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q0L2GeDead2_02.Rotation 90.0  0.0  90.0


