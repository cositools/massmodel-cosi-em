# A single germanium detector volume for the COSI EM Cryostat

Constant DetectorQ0L1HalfHeight 0.745

Volume Q0L1SingleDetector
Q0L1SingleDetector.Material Vacuum
Q0L1SingleDetector.Shape BRIK  1000 1000 1000
Q0L1SingleDetector.Visibility 0
Q0L1SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK Q0L1WaferOuterBox
Q0L1WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorQ0L1HalfHeight

Shape TUBE Q0L1WaferCutDisk
Q0L1WaferCutDisk.Parameters 0.0 IngotRadius DetectorQ0L1HalfHeight

Shape Intersection Q0L1WholeWafer
Q0L1WholeWafer.Parameters Q0L1WaferOuterBox Q0L1WaferCutDisk

# Create the active wafer
Shape BRIK Q0L1ActiveWaferOuterBox
Q0L1ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorQ0L1HalfHeight

Shape TUBE Q0L1ActiveWaferCutDisk
Q0L1ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorQ0L1HalfHeight

Shape Intersection Q0L1ActiveWafer
Q0L1ActiveWafer.Parameters Q0L1ActiveWaferOuterBox Q0L1ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction Q0L1GuardRing_AlmostThere
Q0L1GuardRing_AlmostThere.Parameters Q0L1WholeWafer Q0L1ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection Q0L1GuardRing
Q0L1GuardRing.Parameters Q0L1WaferOuterBox Q0L1GuardRing_AlmostThere

# Al dead layer on top
Shape BRIK Q0L1stripsAl1
Q0L1stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L1WaferCutDisk1
Q0L1WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L1AlDead1
Q0L1AlDead1.Parameters Q0L1stripsAl1 Q0L1WaferCutDisk1

Volume Q0L1stripsAl
Q0L1stripsAl.Material Aluminium
Q0L1stripsAl.Visibility 1
Q0L1stripsAl.Color 7
Q0L1stripsAl.Shape Q0L1AlDead1
Q0L1stripsAl.Mother Q0L1SingleDetector
Q0L1stripsAl.Position {-0.6555} {0.0} {0.80025+DetectorQ0L1HalfHeight-0.75}

Shape BRIK Q0L1stripsAl2
Q0L1stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE Q0L1WaferCutDisk2
Q0L1WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection Q0L1AlDead2
Q0L1AlDead2.Parameters Q0L1stripsAl2 Q0L1WaferCutDisk2

# Al dead layer on the bottom
Volume Q0L1stripsAlbot
Q0L1stripsAlbot.Material Aluminium
Q0L1stripsAlbot.Visibility 1
Q0L1stripsAlbot.Color 7
Q0L1stripsAlbot.Shape Q0L1AlDead2
Q0L1stripsAlbot.Mother Q0L1SingleDetector
Q0L1stripsAlbot.Position {-0.6555} {0.0} {-0.80025-DetectorQ0L1HalfHeight+0.75}


# Handles

Volume Q0L1GeDead1
Q0L1GeDead1.Material Germanium
Q0L1GeDead1.Visibility 1
Q0L1GeDead1.Color 6
Q0L1GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

Q0L1GeDead1.Copy Q0L1GeDead1_01
Q0L1GeDead1.Copy Q0L1GeDead1_02

Q0L1GeDead1_01.Mother Q0L1SingleDetector
Q0L1GeDead1_01.Position  {3.785}  {0.0}  {-0.698-DetectorQ0L1HalfHeight+0.75}
Q0L1GeDead1_01.Rotation 90.0  0.0 -90.0

Q0L1GeDead1_02.Mother Q0L1SingleDetector
Q0L1GeDead1_02.Position  {-5.096}  {0.0}  {-0.698-DetectorQ0L1HalfHeight+0.75}
Q0L1GeDead1_02.Rotation 90.0  0.0  90.0

Volume Q0L1GeDead2
Q0L1GeDead2.Material Germanium
Q0L1GeDead2.Visibility 1
Q0L1GeDead2.Color 6
Q0L1GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

Q0L1GeDead2.Copy Q0L1GeDead2_01
Q0L1GeDead2.Copy Q0L1GeDead2_02

Q0L1GeDead2_01.Mother Q0L1SingleDetector
Q0L1GeDead2_01.Position  {3.913}  {0.0}  {-0.398-DetectorQ0L1HalfHeight+0.75}
Q0L1GeDead2_01.Rotation 90.0  0.0 -90.0

Q0L1GeDead2_02.Mother Q0L1SingleDetector
Q0L1GeDead2_02.Position  {-5.224}   {0.0}  {-0.398-DetectorQ0L1HalfHeight+0.75}
Q0L1GeDead2_02.Rotation 90.0  0.0  90.0


