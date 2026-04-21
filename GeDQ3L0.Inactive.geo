# A single germanium detector volume for the COSI EM Cryostat

Volume Q3L0SingleDetector
Q3L0SingleDetector.Material Vacuum
Q3L0SingleDetector.Shape BRIK  1000 1000 1000
Q3L0SingleDetector.Visibility 0
Q3L0SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q3L0WaferOuterBox
Q3L0WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q3L0WaferCutDisk
Q3L0WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q3L0WholeWafer
Q3L0WholeWafer.Parameters Q3L0WaferOuterBox Q3L0WaferCutDisk

# Create the active wafer
Shape BRIK Q3L0ActiveWaferOuterBox
Q3L0ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q3L0ActiveWaferCutDisk
Q3L0ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q3L0ActiveWafer
Q3L0ActiveWafer.Parameters Q3L0ActiveWaferOuterBox Q3L0ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q3L0GuardRing_AlmostThere
Q3L0GuardRing_AlmostThere.Parameters Q3L0WholeWafer Q3L0ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q3L0GuardRing
Q3L0GuardRing.Parameters Q3L0WaferOuterBox Q3L0GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q3L0_GeWafer
Q3L0_GeWafer.Material active_ge_recoil
Q3L0_GeWafer.Visibility 1
Q3L0_GeWafer.Color 4
Q3L0_GeWafer.Shape Q3L0ActiveWafer
Q3L0_GeWafer.Mother Q3L0SingleDetector
Q3L0_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q3L0GeWaferGuardRing
Q3L0GeWaferGuardRing.Material active_ge_recoil
Q3L0GeWaferGuardRing.Visibility 1
Q3L0GeWaferGuardRing.Color 3
Q3L0GeWaferGuardRing.Shape Q3L0GuardRing
Q3L0GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q3L0GeWaferGuardRing.Mother Q3L0SingleDetector

# Al dead layer on top
Shape BRIK Q3L0stripsAl1
Q3L0stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q3L0WaferCutDisk1
Q3L0WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q3L0AlDead1
Q3L0AlDead1.Parameters Q3L0stripsAl1 Q3L0WaferCutDisk1

Volume Q3L0stripsAl
Q3L0stripsAl.Material Aluminium
Q3L0stripsAl.Visibility 1
Q3L0stripsAl.Color 7
Q3L0stripsAl.Shape Q3L0AlDead1
Q3L0stripsAl.Mother Q3L0SingleDetector
Q3L0stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q3L0stripsAl2
Q3L0stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q3L0WaferCutDisk2
Q3L0WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q3L0AlDead2
Q3L0AlDead2.Parameters Q3L0stripsAl2 Q3L0WaferCutDisk2

# Al dead layer on the bottom
Volume Q3L0stripsAlbot
Q3L0stripsAlbot.Material Aluminium
Q3L0stripsAlbot.Visibility 1
Q3L0stripsAlbot.Color 7
Q3L0stripsAlbot.Shape Q3L0AlDead2
Q3L0stripsAlbot.Mother Q3L0SingleDetector
Q3L0stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q3L0GeDead1
Q3L0GeDead1.Material Germanium
Q3L0GeDead1.Visibility 1
Q3L0GeDead1.Color 6
Q3L0GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q3L0GeDead1.Copy Q3L0GeDead1_01
Q3L0GeDead1.Copy Q3L0GeDead1_02

Q3L0GeDead1_01.Mother Q3L0SingleDetector
Q3L0GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q3L0GeDead1_01.Rotation 90.0  0.0 -90.0

Q3L0GeDead1_02.Mother Q3L0SingleDetector
Q3L0GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q3L0GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q3L0GeDead2
Q3L0GeDead2.Material Germanium
Q3L0GeDead2.Visibility 1
Q3L0GeDead2.Color 6
Q3L0GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q3L0GeDead2.Copy Q3L0GeDead2_01
Q3L0GeDead2.Copy Q3L0GeDead2_02

Q3L0GeDead2_01.Mother Q3L0SingleDetector
Q3L0GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q3L0GeDead2_01.Rotation 90.0  0.0 -90.0

Q3L0GeDead2_02.Mother Q3L0SingleDetector
Q3L0GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q3L0GeDead2_02.Rotation 90.0  0.0  90.0


