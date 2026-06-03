# A single germanium detector volume for the COSI EM Cryostat

Volume Q1L0SingleDetector
Q1L0SingleDetector.Material Vacuum
Q1L0SingleDetector.Shape BRIK  1000 1000 1000
Q1L0SingleDetector.Visibility 0
Q1L0SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q1L0WaferOuterBox
Q1L0WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q1L0WaferCutDisk
Q1L0WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q1L0WholeWafer
Q1L0WholeWafer.Parameters Q1L0WaferOuterBox Q1L0WaferCutDisk

# Create the active wafer
Shape BRIK Q1L0ActiveWaferOuterBox
Q1L0ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q1L0ActiveWaferCutDisk
Q1L0ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q1L0ActiveWafer
Q1L0ActiveWafer.Parameters Q1L0ActiveWaferOuterBox Q1L0ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q1L0GuardRing_AlmostThere
Q1L0GuardRing_AlmostThere.Parameters Q1L0WholeWafer Q1L0ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q1L0GuardRing
Q1L0GuardRing.Parameters Q1L0WaferOuterBox Q1L0GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q1L0_GeWafer
Q1L0_GeWafer.Material Aluminium
Q1L0_GeWafer.Visibility 1
Q1L0_GeWafer.Color 4
Q1L0_GeWafer.Shape Q1L0ActiveWafer
Q1L0_GeWafer.Mother Q1L0SingleDetector
Q1L0_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q1L0GeWaferGuardRing
Q1L0GeWaferGuardRing.Material Aluminium
Q1L0GeWaferGuardRing.Visibility 1
Q1L0GeWaferGuardRing.Color 3
Q1L0GeWaferGuardRing.Shape Q1L0GuardRing
Q1L0GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q1L0GeWaferGuardRing.Mother Q1L0SingleDetector

# Al dead layer on top
Shape BRIK Q1L0stripsAl1
Q1L0stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L0WaferCutDisk1
Q1L0WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L0AlDead1
Q1L0AlDead1.Parameters Q1L0stripsAl1 Q1L0WaferCutDisk1

Volume Q1L0stripsAl
Q1L0stripsAl.Material Aluminium
Q1L0stripsAl.Visibility 1
Q1L0stripsAl.Color 7
Q1L0stripsAl.Shape Q1L0AlDead1
Q1L0stripsAl.Mother Q1L0SingleDetector
Q1L0stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q1L0stripsAl2
Q1L0stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L0WaferCutDisk2
Q1L0WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L0AlDead2
Q1L0AlDead2.Parameters Q1L0stripsAl2 Q1L0WaferCutDisk2

# Al dead layer on the bottom
Volume Q1L0stripsAlbot
Q1L0stripsAlbot.Material Aluminium
Q1L0stripsAlbot.Visibility 1
Q1L0stripsAlbot.Color 7
Q1L0stripsAlbot.Shape Q1L0AlDead2
Q1L0stripsAlbot.Mother Q1L0SingleDetector
Q1L0stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q1L0GeDead1
Q1L0GeDead1.Material Aluminium
Q1L0GeDead1.Visibility 1
Q1L0GeDead1.Color 6
Q1L0GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q1L0GeDead1.Copy Q1L0GeDead1_01
Q1L0GeDead1.Copy Q1L0GeDead1_02

Q1L0GeDead1_01.Mother Q1L0SingleDetector
Q1L0GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L0GeDead1_01.Rotation 90.0  0.0 -90.0

Q1L0GeDead1_02.Mother Q1L0SingleDetector
Q1L0GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L0GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q1L0GeDead2
Q1L0GeDead2.Material Aluminium
Q1L0GeDead2.Visibility 1
Q1L0GeDead2.Color 6
Q1L0GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q1L0GeDead2.Copy Q1L0GeDead2_01
Q1L0GeDead2.Copy Q1L0GeDead2_02

Q1L0GeDead2_01.Mother Q1L0SingleDetector
Q1L0GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L0GeDead2_01.Rotation 90.0  0.0 -90.0

Q1L0GeDead2_02.Mother Q1L0SingleDetector
Q1L0GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L0GeDead2_02.Rotation 90.0  0.0  90.0


