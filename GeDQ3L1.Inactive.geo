# A single germanium detector volume for the COSI EM Cryostat

Volume Q3L1SingleDetector
Q3L1SingleDetector.Material Vacuum
Q3L1SingleDetector.Shape BRIK  1000 1000 1000
Q3L1SingleDetector.Visibility 0
Q3L1SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q3L1WaferOuterBox
Q3L1WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE Q3L1WaferCutDisk
Q3L1WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection Q3L1WholeWafer
Q3L1WholeWafer.Parameters Q3L1WaferOuterBox Q3L1WaferCutDisk

# Create the active wafer
Shape BRIK Q3L1ActiveWaferOuterBox
Q3L1ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE Q3L1ActiveWaferCutDisk
Q3L1ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection Q3L1ActiveWafer
Q3L1ActiveWafer.Parameters Q3L1ActiveWaferOuterBox Q3L1ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q3L1GuardRing_AlmostThere
Q3L1GuardRing_AlmostThere.Parameters Q3L1WholeWafer Q3L1ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q3L1GuardRing
Q3L1GuardRing.Parameters Q3L1WaferOuterBox Q3L1GuardRing_AlmostThere

# Detector and Guard Ring

Volume Q3L1_GeWafer
Q3L1_GeWafer.Material Aluminium
Q3L1_GeWafer.Visibility 1
Q3L1_GeWafer.Color 4
Q3L1_GeWafer.Shape Q3L1ActiveWafer
Q3L1_GeWafer.Mother Q3L1SingleDetector
Q3L1_GeWafer.Position {-0.6555} {0.0} {0.0}

Volume Q3L1GeWaferGuardRing
Q3L1GeWaferGuardRing.Material Aluminium
Q3L1GeWaferGuardRing.Visibility 1
Q3L1GeWaferGuardRing.Color 3
Q3L1GeWaferGuardRing.Shape Q3L1GuardRing
Q3L1GeWaferGuardRing.Position  {-0.6555} {0.0} {0.0}
Q3L1GeWaferGuardRing.Mother Q3L1SingleDetector

# Al dead layer on top
Shape BRIK Q3L1stripsAl1
Q3L1stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q3L1WaferCutDisk1
Q3L1WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q3L1AlDead1
Q3L1AlDead1.Parameters Q3L1stripsAl1 Q3L1WaferCutDisk1

Volume Q3L1stripsAl
Q3L1stripsAl.Material Aluminium
Q3L1stripsAl.Visibility 1
Q3L1stripsAl.Color 7
Q3L1stripsAl.Shape Q3L1AlDead1
Q3L1stripsAl.Mother Q3L1SingleDetector
Q3L1stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorHalfHeight-0.75}

Shape BRIK Q3L1stripsAl2
Q3L1stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q3L1WaferCutDisk2
Q3L1WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q3L1AlDead2
Q3L1AlDead2.Parameters Q3L1stripsAl2 Q3L1WaferCutDisk2

# Al dead layer on the bottom
Volume Q3L1stripsAlbot
Q3L1stripsAlbot.Material Aluminium
Q3L1stripsAlbot.Visibility 1
Q3L1stripsAlbot.Color 7
Q3L1stripsAlbot.Shape Q3L1AlDead2
Q3L1stripsAlbot.Mother Q3L1SingleDetector
Q3L1stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorHalfHeight+0.75}


# Handles

Volume Q3L1GeDead1
Q3L1GeDead1.Material Aluminium
Q3L1GeDead1.Visibility 1
Q3L1GeDead1.Color 6
Q3L1GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q3L1GeDead1.Copy Q3L1GeDead1_01
Q3L1GeDead1.Copy Q3L1GeDead1_02

Q3L1GeDead1_01.Mother Q3L1SingleDetector
Q3L1GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q3L1GeDead1_01.Rotation 90.0  0.0 -90.0

Q3L1GeDead1_02.Mother Q3L1SingleDetector
Q3L1GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorHalfHeight+0.75}
Q3L1GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q3L1GeDead2
Q3L1GeDead2.Material Aluminium
Q3L1GeDead2.Visibility 1
Q3L1GeDead2.Color 6
Q3L1GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q3L1GeDead2.Copy Q3L1GeDead2_01
Q3L1GeDead2.Copy Q3L1GeDead2_02

Q3L1GeDead2_01.Mother Q3L1SingleDetector
Q3L1GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q3L1GeDead2_01.Rotation 90.0  0.0 -90.0

Q3L1GeDead2_02.Mother Q3L1SingleDetector
Q3L1GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorHalfHeight+0.75}
Q3L1GeDead2_02.Rotation 90.0  0.0  90.0


