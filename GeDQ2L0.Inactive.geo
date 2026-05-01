# A single germanium detector volume for the COSI EM Cryostat

Volume Q2L0SingleDetector
Q2L0SingleDetector.Material Vacuum
Q2L0SingleDetector.Shape BRIK  1000 1000 1000
Q2L0SingleDetector.Visibility 0
Q2L0SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q2L0WaferOuterBox
Q2L0WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q2L0WaferCutDisk
Q2L0WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q2L0WholeWafer
Q2L0WholeWafer.Parameters Q2L0WaferOuterBox Q2L0WaferCutDisk

# Create the active wafer
Shape BRIK Q2L0ActiveWaferOuterBox
Q2L0ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q2L0ActiveWaferCutDisk
Q2L0ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q2L0ActiveWafer
Q2L0ActiveWafer.Parameters Q2L0ActiveWaferOuterBox Q2L0ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q2L0GuardRing_AlmostThere
Q2L0GuardRing_AlmostThere.Parameters Q2L0WholeWafer Q2L0ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q2L0GuardRing
Q2L0GuardRing.Parameters Q2L0WaferOuterBox Q2L0GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q2L0_GeWafer
Q2L0_GeWafer.Material Aluminium
Q2L0_GeWafer.Visibility 1
Q2L0_GeWafer.Color 4
Q2L0_GeWafer.Shape Q2L0ActiveWafer
Q2L0_GeWafer.Mother Q2L0SingleDetector
Q2L0_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q2L0GeWaferGuardRing
Q2L0GeWaferGuardRing.Material Aluminium
Q2L0GeWaferGuardRing.Visibility 1
Q2L0GeWaferGuardRing.Color 3
Q2L0GeWaferGuardRing.Shape Q2L0GuardRing
Q2L0GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q2L0GeWaferGuardRing.Mother Q2L0SingleDetector

# Al dead layer on top
Shape BRIK Q2L0stripsAl1
Q2L0stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L0WaferCutDisk1
Q2L0WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L0AlDead1
Q2L0AlDead1.Parameters Q2L0stripsAl1 Q2L0WaferCutDisk1

Volume Q2L0stripsAl
Q2L0stripsAl.Material Aluminium
Q2L0stripsAl.Visibility 1
Q2L0stripsAl.Color 7
Q2L0stripsAl.Shape Q2L0AlDead1
Q2L0stripsAl.Mother Q2L0SingleDetector
Q2L0stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q2L0stripsAl2
Q2L0stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L0WaferCutDisk2
Q2L0WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L0AlDead2
Q2L0AlDead2.Parameters Q2L0stripsAl2 Q2L0WaferCutDisk2

# Al dead layer on the bottom
Volume Q2L0stripsAlbot
Q2L0stripsAlbot.Material Aluminium
Q2L0stripsAlbot.Visibility 1
Q2L0stripsAlbot.Color 7
Q2L0stripsAlbot.Shape Q2L0AlDead2
Q2L0stripsAlbot.Mother Q2L0SingleDetector
Q2L0stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q2L0GeDead1
Q2L0GeDead1.Material Aluminium
Q2L0GeDead1.Visibility 1
Q2L0GeDead1.Color 6
Q2L0GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q2L0GeDead1.Copy Q2L0GeDead1_01
Q2L0GeDead1.Copy Q2L0GeDead1_02

Q2L0GeDead1_01.Mother Q2L0SingleDetector
Q2L0GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L0GeDead1_01.Rotation 90.0  0.0 -90.0

Q2L0GeDead1_02.Mother Q2L0SingleDetector
Q2L0GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L0GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q2L0GeDead2
Q2L0GeDead2.Material Aluminium
Q2L0GeDead2.Visibility 1
Q2L0GeDead2.Color 6
Q2L0GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q2L0GeDead2.Copy Q2L0GeDead2_01
Q2L0GeDead2.Copy Q2L0GeDead2_02

Q2L0GeDead2_01.Mother Q2L0SingleDetector
Q2L0GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L0GeDead2_01.Rotation 90.0  0.0 -90.0

Q2L0GeDead2_02.Mother Q2L0SingleDetector
Q2L0GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L0GeDead2_02.Rotation 90.0  0.0  90.0


