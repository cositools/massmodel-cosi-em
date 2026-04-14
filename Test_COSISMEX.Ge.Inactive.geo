# A single germanium detector volume
# COSI SMEX model
#These constants were used to make the detector sit nicely in the mother volume
#Constant Xshift -0.627
Constant Xshift 1.342
Constant Yshift 0.991
Constant Zshift 0.0
#Constant Zshift -0.4

Volume SingleDetector
SingleDetector.Material vacuum
#SingleDetector.Shape BRIK  5.3025  4.791  1.07
#SingleDetector.Shape BRIK  7.7025  6.791  2.17
SingleDetector.Shape BRIK  6.1225  5.791  {DetectorHalfHeight+.9+.4}
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

####################### Testing different volumes - Nicole



#Dummy approximation of the preload hardware 
# 304 Stainless Steel
Volume Preload
Preload.Material steel_304
Preload.Visibility 1
Preload.Color 71
Preload.Shape TUBE 0.0 0.255 0.3365 0.0 360.0

Preload.Copy Preload1
Preload.Copy Preload2
Preload.Copy Preload3
Preload.Copy Preload4

Preload1.Position {3.9485+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload1.Mother SingleDetector
Preload2.Position {3.9485+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload2.Mother SingleDetector
Preload3.Position {-5.253+Xshift}  {3.306+Yshift}  {-0.8715+Zshift}
Preload3.Mother SingleDetector
Preload4.Position {-5.253+Xshift}  {-3.306+Yshift}  {-0.8715+Zshift}
Preload4.Mother SingleDetector