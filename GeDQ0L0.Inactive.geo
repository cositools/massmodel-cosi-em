# A single germanium detector volume for the COSI EM Cryostat

Constant DetectorQ0L0HalfHeight 0.75

Volume Q0L0SingleDetector
Q0L0SingleDetector.Material Vacuum
Q0L0SingleDetector.Shape BRIK  1000 1000 1000
Q0L0SingleDetector.Visibility 0
Q0L0SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q0L0WaferOuterBox
Q0L0WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorQ0L0HalfHeight

Shape TUBE Q0L0WaferCutDisk
Q0L0WaferCutDisk.Parameters 0.0 IngotRadius DetectorQ0L0HalfHeight

Shape Intersection Q0L0WholeWafer
Q0L0WholeWafer.Parameters Q0L0WaferOuterBox Q0L0WaferCutDisk

# Create the active wafer
Shape BRIK Q0L0ActiveWaferOuterBox
Q0L0ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorQ0L0HalfHeight

Shape TUBE Q0L0ActiveWaferCutDisk
Q0L0ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorQ0L0HalfHeight

Shape Intersection Q0L0ActiveWafer
Q0L0ActiveWafer.Parameters Q0L0ActiveWaferOuterBox Q0L0ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q0L0GuardRing_AlmostThere
Q0L0GuardRing_AlmostThere.Parameters Q0L0WholeWafer Q0L0ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q0L0GuardRing
Q0L0GuardRing.Parameters Q0L0WaferOuterBox Q0L0GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q0L0_GeWafer
Q0L0_GeWafer.Material active_ge_recoil
Q0L0_GeWafer.Visibility 1
Q0L0_GeWafer.Color 4
Q0L0_GeWafer.Shape Q0L0ActiveWafer
Q0L0_GeWafer.Mother Q0L0SingleDetector
Q0L0_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q0L0GeWaferGuardRing
Q0L0GeWaferGuardRing.Material active_ge_recoil
Q0L0GeWaferGuardRing.Visibility 1
Q0L0GeWaferGuardRing.Color 3
Q0L0GeWaferGuardRing.Shape Q0L0GuardRing
Q0L0GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q0L0GeWaferGuardRing.Mother Q0L0SingleDetector

# Al dead layer on top
Shape BRIK Q0L0stripsAl1
Q0L0stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L0WaferCutDisk1
Q0L0WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L0AlDead1
Q0L0AlDead1.Parameters Q0L0stripsAl1 Q0L0WaferCutDisk1

Volume Q0L0stripsAl
Q0L0stripsAl.Material Aluminium
Q0L0stripsAl.Visibility 1
Q0L0stripsAl.Color 7
Q0L0stripsAl.Shape Q0L0AlDead1
Q0L0stripsAl.Mother Q0L0SingleDetector
Q0L0stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorQ0L0HalfHeight-0.75}

Shape BRIK Q0L0stripsAl2
Q0L0stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L0WaferCutDisk2
Q0L0WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L0AlDead2
Q0L0AlDead2.Parameters Q0L0stripsAl2 Q0L0WaferCutDisk2

# Al dead layer on the bottom
Volume Q0L0stripsAlbot
Q0L0stripsAlbot.Material Aluminium
Q0L0stripsAlbot.Visibility 1
Q0L0stripsAlbot.Color 7
Q0L0stripsAlbot.Shape Q0L0AlDead2
Q0L0stripsAlbot.Mother Q0L0SingleDetector
Q0L0stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorQ0L0HalfHeight+0.75}


# Handles

Volume Q0L0GeDead1
Q0L0GeDead1.Material Germanium
Q0L0GeDead1.Visibility 1
Q0L0GeDead1.Color 6
Q0L0GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q0L0GeDead1.Copy Q0L0GeDead1_01
Q0L0GeDead1.Copy Q0L0GeDead1_02

Q0L0GeDead1_01.Mother Q0L0SingleDetector
Q0L0GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorQ0L0HalfHeight+0.75}
Q0L0GeDead1_01.Rotation 90.0  0.0 -90.0

Q0L0GeDead1_02.Mother Q0L0SingleDetector
Q0L0GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorQ0L0HalfHeight+0.75}
Q0L0GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q0L0GeDead2
Q0L0GeDead2.Material Germanium
Q0L0GeDead2.Visibility 1
Q0L0GeDead2.Color 6
Q0L0GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q0L0GeDead2.Copy Q0L0GeDead2_01
Q0L0GeDead2.Copy Q0L0GeDead2_02

Q0L0GeDead2_01.Mother Q0L0SingleDetector
Q0L0GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorQ0L0HalfHeight+0.75}
Q0L0GeDead2_01.Rotation 90.0  0.0 -90.0

Q0L0GeDead2_02.Mother Q0L0SingleDetector
Q0L0GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorQ0L0HalfHeight+0.75}
Q0L0GeDead2_02.Rotation 90.0  0.0  90.0


