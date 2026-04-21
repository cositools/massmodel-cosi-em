# A single germanium detector volume for the COSI EM Cryostat

Volume Q2L1SingleDetector
Q2L1SingleDetector.Material Vacuum
Q2L1SingleDetector.Shape BRIK  1000 1000 1000
Q2L1SingleDetector.Visibility 0
Q2L1SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q2L1WaferOuterBox
Q2L1WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q2L1WaferCutDisk
Q2L1WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q2L1WholeWafer
Q2L1WholeWafer.Parameters Q2L1WaferOuterBox Q2L1WaferCutDisk

# Create the active wafer
Shape BRIK Q2L1ActiveWaferOuterBox
Q2L1ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q2L1ActiveWaferCutDisk
Q2L1ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q2L1ActiveWafer
Q2L1ActiveWafer.Parameters Q2L1ActiveWaferOuterBox Q2L1ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q2L1GuardRing_AlmostThere
Q2L1GuardRing_AlmostThere.Parameters Q2L1WholeWafer Q2L1ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q2L1GuardRing
Q2L1GuardRing.Parameters Q2L1WaferOuterBox Q2L1GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q2L1_GeWafer
Q2L1_GeWafer.Material active_ge_recoil
Q2L1_GeWafer.Visibility 1
Q2L1_GeWafer.Color 4
Q2L1_GeWafer.Shape Q2L1ActiveWafer
Q2L1_GeWafer.Mother Q2L1SingleDetector
Q2L1_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q2L1GeWaferGuardRing
Q2L1GeWaferGuardRing.Material active_ge_recoil
Q2L1GeWaferGuardRing.Visibility 1
Q2L1GeWaferGuardRing.Color 3
Q2L1GeWaferGuardRing.Shape Q2L1GuardRing
Q2L1GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q2L1GeWaferGuardRing.Mother Q2L1SingleDetector

# Al dead layer on top
Shape BRIK Q2L1stripsAl1
Q2L1stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L1WaferCutDisk1
Q2L1WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L1AlDead1
Q2L1AlDead1.Parameters Q2L1stripsAl1 Q2L1WaferCutDisk1

Volume Q2L1stripsAl
Q2L1stripsAl.Material Aluminium
Q2L1stripsAl.Visibility 1
Q2L1stripsAl.Color 7
Q2L1stripsAl.Shape Q2L1AlDead1
Q2L1stripsAl.Mother Q2L1SingleDetector
Q2L1stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q2L1stripsAl2
Q2L1stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q2L1WaferCutDisk2
Q2L1WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q2L1AlDead2
Q2L1AlDead2.Parameters Q2L1stripsAl2 Q2L1WaferCutDisk2

# Al dead layer on the bottom
Volume Q2L1stripsAlbot
Q2L1stripsAlbot.Material Aluminium
Q2L1stripsAlbot.Visibility 1
Q2L1stripsAlbot.Color 7
Q2L1stripsAlbot.Shape Q2L1AlDead2
Q2L1stripsAlbot.Mother Q2L1SingleDetector
Q2L1stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q2L1GeDead1
Q2L1GeDead1.Material Germanium
Q2L1GeDead1.Visibility 1
Q2L1GeDead1.Color 6
Q2L1GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q2L1GeDead1.Copy Q2L1GeDead1_01
Q2L1GeDead1.Copy Q2L1GeDead1_02

Q2L1GeDead1_01.Mother Q2L1SingleDetector
Q2L1GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L1GeDead1_01.Rotation 90.0  0.0 -90.0

Q2L1GeDead1_02.Mother Q2L1SingleDetector
Q2L1GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q2L1GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q2L1GeDead2
Q2L1GeDead2.Material Germanium
Q2L1GeDead2.Visibility 1
Q2L1GeDead2.Color 6
Q2L1GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q2L1GeDead2.Copy Q2L1GeDead2_01
Q2L1GeDead2.Copy Q2L1GeDead2_02

Q2L1GeDead2_01.Mother Q2L1SingleDetector
Q2L1GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L1GeDead2_01.Rotation 90.0  0.0 -90.0

Q2L1GeDead2_02.Mother Q2L1SingleDetector
Q2L1GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q2L1GeDead2_02.Rotation 90.0  0.0  90.0


