# A single germanium detector volume for the COSI EM Cryostat

#These constants were used to make the detector sit nicely in the mother volume
Constant Xshift 0
Constant Yshift 0
Constant Zshift 0

Volume SingleDetector
SingleDetector.Material Vacuum
#SingleDetector.Shape BRIK  6.1225  5.791  {DetectorHalfHeight+.9+.4}
SingleDetector.Shape BRIK  1000 1000 1000
SingleDetector.Visibility 0
SingleDetector.Virtual true

# Redoing this to follow EXACTLY what is done in special Max
# Create the whole wafer
Shape BRIK WaferOuterBox
WaferOuterBox.Parameters DetectorHalfWidth  DetectorHalfWidth  DetectorHalfHeight

Shape TUBE WaferCutDisk
WaferCutDisk.Parameters 0.0 IngotRadius DetectorHalfHeight

Shape Intersection WholeWafer
WholeWafer.Parameters WaferOuterBox WaferCutDisk

# Create the active wafer
Shape BRIK ActiveWaferOuterBox
ActiveWaferOuterBox.Parameters { DetectorHalfWidth - GuardRingSize }  { DetectorHalfWidth - GuardRingSize }  DetectorHalfHeight

Shape TUBE ActiveWaferCutDisk
ActiveWaferCutDisk.Parameters 0.0 { IngotRadius - GuardRingSize } DetectorHalfHeight

Shape Intersection ActiveWafer
ActiveWafer.Parameters ActiveWaferOuterBox ActiveWaferCutDisk

# Create the guard ring
Shape Subtraction GuardRing_AlmostThere
GuardRing_AlmostThere.Parameters WholeWafer ActiveWafer

# A little trick, to get the Strip detector to work: we have to do another intersection, so that the first volume is a box:
Shape Intersection GuardRing
GuardRing.Parameters WaferOuterBox GuardRing_AlmostThere

# Detector and Guard Ring

Volume D1_GeWafer
D1_GeWafer.Material active_ge_recoil
D1_GeWafer.Visibility 1
D1_GeWafer.Color 4
D1_GeWafer.Shape ActiveWafer
#Come back and check this. Need to figure out where the 0,0 point is and what we are offsetting
D1_GeWafer.Mother SingleDetector
D1_GeWafer.Position {-0.6555+Xshift} {0.0+Yshift} {Zshift}

Volume GeWaferGuardRing
GeWaferGuardRing.Material active_ge_recoil
GeWaferGuardRing.Visibility 1
GeWaferGuardRing.Color 3
GeWaferGuardRing.Shape GuardRing
GeWaferGuardRing.Position  {-0.6555+Xshift} {0.0+Yshift} {Zshift}
GeWaferGuardRing.Mother SingleDetector

# Al dead layer on top
Shape BRIK stripsAl1
stripsAl1.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk1
WaferCutDisk1.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead1
AlDead1.Parameters stripsAl1 WaferCutDisk1

Volume stripsAl
stripsAl.Material Aluminium
stripsAl.Visibility 1
stripsAl.Color 7
stripsAl.Shape AlDead1
stripsAl.Mother SingleDetector
stripsAl.Position {-0.6555+Xshift} {0.0+Yshift} {0.80025+Zshift}

Shape BRIK stripsAl2
stripsAl2.Parameters 3.71 3.71 0.00025
Shape TUBE WaferCutDisk2
WaferCutDisk2.Parameters 0.0 IngotRadius 0.00025

Shape Intersection AlDead2
AlDead2.Parameters stripsAl2 WaferCutDisk2

# Al dead layer on the bottom
Volume stripsAlbot
stripsAlbot.Material Aluminium
stripsAlbot.Visibility 1
stripsAlbot.Color 7
stripsAlbot.Shape AlDead2
stripsAlbot.Mother SingleDetector
stripsAlbot.Position {-0.6555+Xshift} {0.0+Yshift} {-0.80025+Zshift}


# Handles

Volume GeDead1
GeDead1.Material Germanium
GeDead1.Visibility 1
GeDead1.Color 6
GeDead1.Shape TRD1 1.569 3.05 0.102 0.4155

GeDead1.Copy GeDead1_01
GeDead1.Copy GeDead1_02

GeDead1_01.Mother SingleDetector
GeDead1_01.Position  {3.785+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
GeDead1_01.Rotation 90.0  0.0 -90.0

GeDead1_02.Mother SingleDetector
GeDead1_02.Position  {-5.096+Xshift}  {0.0+Yshift}  {-0.698+Zshift}
GeDead1_02.Rotation 90.0  0.0  90.0

Volume GeDead2
GeDead2.Material Germanium
GeDead2.Visibility 1
GeDead2.Color 6
GeDead2.Shape TRD1 1.569 2.766 0.198 0.2875

GeDead2.Copy GeDead2_01
GeDead2.Copy GeDead2_02

GeDead2_01.Mother SingleDetector
GeDead2_01.Position  {3.913+Xshift}  {0.0+Yshift}  {-0.398+Zshift}
GeDead2_01.Rotation 90.0  0.0 -90.0

GeDead2_02.Mother SingleDetector
GeDead2_02.Position  {-5.224+Xshift}   {0.0+Yshift}  {-0.398+Zshift}
GeDead2_02.Rotation 90.0  0.0  90.0

LVL5.Mother SingleDetector
LVL5.Shape BRIK 4.661 0.158 0.978
LVL5.Visibility 1
LVL5.Color 3
LVL5.Position {-0.8335+Xshift} {-6.127+Yshift} {-0.0365+Zshift}


