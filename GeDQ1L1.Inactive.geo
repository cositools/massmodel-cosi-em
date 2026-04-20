# A single germanium detector volume for the COSI EM Cryostat

Volume Q1L1SingleDetector
Q1L1SingleDetector.Material Vacuum
Q1L1SingleDetector.Shape BRIK  1000 1000 1000
Q1L1SingleDetector.Visibility 0
Q1L1SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q1L1WaferOuterBox
Q1L1WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q1L1WaferCutDisk
Q1L1WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q1L1WholeWafer
Q1L1WholeWafer.Parameters Q1L1WaferOuterBox Q1L1WaferCutDisk

# Create the active wafer
Shape BRIK Q1L1ActiveWaferOuterBox
Q1L1ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q1L1ActiveWaferCutDisk
Q1L1ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q1L1ActiveWafer
Q1L1ActiveWafer.Parameters Q1L1ActiveWaferOuterBox Q1L1ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q1L1GuardRing_AlmostThere
Q1L1GuardRing_AlmostThere.Parameters Q1L1WholeWafer Q1L1ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q1L1GuardRing
Q1L1GuardRing.Parameters Q1L1WaferOuterBox Q1L1GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q1L1_GeWafer
Q1L1_GeWafer.Material active_ge_recoil
Q1L1_GeWafer.Visibility 1
Q1L1_GeWafer.Color 4
Q1L1_GeWafer.Shape Q1L1ActiveWafer
Q1L1_GeWafer.Mother Q1L1SingleDetector
Q1L1_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q1L1GeWaferGuardRing
Q1L1GeWaferGuardRing.Material active_ge_recoil
Q1L1GeWaferGuardRing.Visibility 1
Q1L1GeWaferGuardRing.Color 3
Q1L1GeWaferGuardRing.Shape Q1L1GuardRing
Q1L1GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q1L1GeWaferGuardRing.Mother Q1L1SingleDetector

# Al dead layer on top
Shape BRIK Q1L1stripsAl1
Q1L1stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L1WaferCutDisk1
Q1L1WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L1AlDead1
Q1L1AlDead1.Parameters Q1L1stripsAl1 Q1L1WaferCutDisk1

Volume Q1L1stripsAl
Q1L1stripsAl.Material Aluminium
Q1L1stripsAl.Visibility 1
Q1L1stripsAl.Color 7
Q1L1stripsAl.Shape Q1L1AlDead1
Q1L1stripsAl.Mother Q1L1SingleDetector
Q1L1stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q1L1stripsAl2
Q1L1stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q1L1WaferCutDisk2
Q1L1WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q1L1AlDead2
Q1L1AlDead2.Parameters Q1L1stripsAl2 Q1L1WaferCutDisk2

# Al dead layer on the bottom
Volume Q1L1stripsAlbot
Q1L1stripsAlbot.Material Aluminium
Q1L1stripsAlbot.Visibility 1
Q1L1stripsAlbot.Color 7
Q1L1stripsAlbot.Shape Q1L1AlDead2
Q1L1stripsAlbot.Mother Q1L1SingleDetector
Q1L1stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q1L1GeDead1
Q1L1GeDead1.Material Germanium
Q1L1GeDead1.Visibility 1
Q1L1GeDead1.Color 6
Q1L1GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q1L1GeDead1.Copy Q1L1GeDead1_01
Q1L1GeDead1.Copy Q1L1GeDead1_02

Q1L1GeDead1_01.Mother Q1L1SingleDetector
Q1L1GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L1GeDead1_01.Rotation 90.0  0.0 -90.0

Q1L1GeDead1_02.Mother Q1L1SingleDetector
Q1L1GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q1L1GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q1L1GeDead2
Q1L1GeDead2.Material Germanium
Q1L1GeDead2.Visibility 1
Q1L1GeDead2.Color 6
Q1L1GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q1L1GeDead2.Copy Q1L1GeDead2_01
Q1L1GeDead2.Copy Q1L1GeDead2_02

Q1L1GeDead2_01.Mother Q1L1SingleDetector
Q1L1GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L1GeDead2_01.Rotation 90.0  0.0 -90.0

Q1L1GeDead2_02.Mother Q1L1SingleDetector
Q1L1GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q1L1GeDead2_02.Rotation 90.0  0.0  90.0


