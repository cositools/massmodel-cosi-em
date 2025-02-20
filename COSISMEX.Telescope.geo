# This is the telescope including BGO

Include COSISMEX.GlobalDimensions.geo

Volume ShieldedTelescope
ShieldedTelescope.Material vacuum
ShieldedTelescope.Visibility 1
ShieldedTelescope.Color 1
#ShieldedTelescope.Shape BRIK {BGOinnerX + 2*BGOsideThick+BGOWallFullThickness+2*PMTlength} {BGOinnerY + 2*BGOsideThick+BGOWallFullThickness+2*PMTlength} {ShieldedHeight}
ShieldedTelescope.Shape TUBS 0.0 OuterRadius { ShieldedHeight }


!********************************************
!              THE BGO shield
!********************************************

Volume BGObottom
BGObottom.Material al6061
BGObottom.Visibility 1
BGObottom.Color 3
BGObottom.Shape BRIK {BGOinnerX+2*BGOsideThick+BGOWallFullThicknessOutside} {BGOinnerY + 2*BGOsideThick+BGOWallFullThicknessOutside} {BGObottomThick+0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessBottom}
BGObottom.Mother ShieldedTelescope
BGObottom.Position 0.0 0.0 {-ShieldedHeight+0.5*BGOWallFullThickness+BGObottomThick+0.5*BGOWallFullThicknessBottom}

Volume BGObottomACTIVE
BGObottomACTIVE.Material BGOMaterial
BGObottomACTIVE.Visibility 1
BGObottomACTIVE.Color 4
BGObottomACTIVE.Shape BRIK {BGOinnerX+2*BGOsideThick} {BGOinnerY + 2*BGOsideThick} {BGObottomThick}
BGObottomACTIVE.Mother BGObottom
BGObottomACTIVE.Position 0.0 0.0 { -0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessBottom }


Constant BGObottomGap 0.25
Constant BGObottomGapP1Distance 8.5

Constant BGOsideGap 0.5


Constant BGObottomCenterSquareGap 2.85 
Constant BGObottomSideSquareGap 3.8

Volume BGObottomACTIVE_CenterGap
BGObottomACTIVE_CenterGap.Material al6061
BGObottomACTIVE_CenterGap.Visibility 1
BGObottomACTIVE_CenterGap.Color 4
BGObottomACTIVE_CenterGap.Shape BOX  BGObottomCenterSquareGap BGObottomCenterSquareGap BGObottomThick
BGObottomACTIVE_CenterGap.Mother BGObottomACTIVE
BGObottomACTIVE_CenterGap.Position 0.0 0.0 0.0

Volume BGObottomACTIVE_SideGap
BGObottomACTIVE_SideGap.Material al6061
BGObottomACTIVE_SideGap.Visibility 1
BGObottomACTIVE_SideGap.Color 4
BGObottomACTIVE_SideGap.Shape BRIK BGObottomSideSquareGap BGObottomSideSquareGap BGObottomThick
BGObottomACTIVE_SideGap.Mother BGObottomACTIVE
BGObottomACTIVE_SideGap.Position { BGObottomCenterSquareGap + BGObottomSideSquareGap + 2*BGObottomGap } { BGObottomCenterSquareGap + BGObottomSideSquareGap + 2*BGObottomGap }  0.0



Volume BGObottomACTIVE_Gap
BGObottomACTIVE_Gap.Material al6061
BGObottomACTIVE_Gap.Visibility 1
BGObottomACTIVE_Gap.Color 4
BGObottomACTIVE_Gap.Shape BOX { BGOinnerX+2*BGOsideThick } { BGObottomGap } { BGObottomThick }

BGObottomACTIVE_Gap.Copy BGObottomACTIVE_Gap_P1
BGObottomACTIVE_Gap_P1.Mother BGObottomACTIVE
BGObottomACTIVE_Gap_P1.Position 0.0 { BGObottomCenterSquareGap + BGObottomGap }  0.0

BGObottomACTIVE_Gap.Copy BGObottomACTIVE_Gap_P2
BGObottomACTIVE_Gap_P2.Mother BGObottomACTIVE
BGObottomACTIVE_Gap_P2.Position 0.0 { BGObottomCenterSquareGap + BGObottomGap + BGObottomGapP1Distance }  0.0

BGObottomACTIVE_Gap.Copy BGObottomACTIVE_Gap_M1
BGObottomACTIVE_Gap_M1.Mother BGObottomACTIVE
BGObottomACTIVE_Gap_M1.Position 0.0 { -BGObottomCenterSquareGap + -BGObottomGap }  0.0

BGObottomACTIVE_Gap.Copy BGObottomACTIVE_Gap_M2
BGObottomACTIVE_Gap_M2.Mother BGObottomACTIVE
BGObottomACTIVE_Gap_M2.Position 0.0 { -BGObottomCenterSquareGap - 3*BGObottomGap - 2*BGObottomSideSquareGap }  0.0


Volume BGOsideX
BGOsideX.Material al6061
BGOsideX.Visibility 1
BGOsideX.Color 3
BGOsideX.Shape BRIK {BGOsideThick + 0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessOutside} {BGOinnerY + 2*BGOsideThick+BGOWallFullThickness} {BGOsideHigh + 0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness}

BGOsideX.Copy BGOsideX_1
BGOsideX_1.Mother ShieldedTelescope
BGOsideX_1.Position {BGOinnerX + (BGOsideThick + 0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessOutside) } 0.0 {+ShieldedHeight - (BGOsideHigh + 0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness)}


BGOsideX.Copy BGOsideX_2
BGOsideX_2.Mother ShieldedTelescope
BGOsideX_2.Rotation 0 0 180
BGOsideX_2.Position {-(BGOinnerX + (BGOsideThick + 0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessOutside))} 0.0 {+ShieldedHeight - (BGOsideHigh + 0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness)}

Volume BGOsideX_ACTIVE
BGOsideX_ACTIVE.Material BGOMaterial
BGOsideX_ACTIVE.Visibility 1
BGOsideX_ACTIVE.Color 4
BGOsideX_ACTIVE.Shape BRIK {BGOsideThick} {BGOinnerY + 2*BGOsideThick} { BGOsideHigh }
BGOsideX_ACTIVE.Mother BGOsideX
BGOsideX_ACTIVE.Position { + 0.5*BGOWallFullThickness - 0.5*BGOWallFullThicknessOutside } 0.0 { -0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness }

Volume BGOsideX_GAP
BGOsideX_GAP.Material al6061
BGOsideX_GAP.Visibility 1
BGOsideX_GAP.Color 4
BGOsideX_GAP.Shape BRIK  {BGOsideThick} {BGOinnerY + 2*BGOsideThick} { BGOsideGap }
BGOsideX_GAP.Mother BGOsideX_ACTIVE
BGOsideX_GAP.Position 0.0 0.0 0.0


Volume BGOsideY
BGOsideY.Material al6061
BGOsideY.Visibility 1
BGOsideY.Color 3
BGOsideY.Shape BRIK {BGOinnerX - BGOWallFullThickness} {BGOsideThick + 0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessOutside} {BGOsideHigh + 0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness}

BGOsideY.Copy BGOsideY_1
BGOsideY_1.Mother ShieldedTelescope
BGOsideY_1.Position 0.0 {BGOinnerY + (BGOsideThick + 0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessOutside)} {+ShieldedHeight - (BGOsideHigh + 0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness)}

BGOsideY.Copy BGOsideY_2
BGOsideY_2.Mother ShieldedTelescope
BGOsideY_2.Rotation 0 0 180
BGOsideY_2.Position 0.0 {-(BGOinnerY + (BGOsideThick + 0.5*BGOWallFullThickness + 0.5*BGOWallFullThicknessOutside))} {+ShieldedHeight - (BGOsideHigh + 0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness)}

Volume BGOsideY_ACTIVE
BGOsideY_ACTIVE.Material BGOMaterial
BGOsideY_ACTIVE.Visibility 1
BGOsideY_ACTIVE.Color 4
BGOsideY_ACTIVE.Shape BRIK {BGOinnerX-2*BGOWallFullThickness} {BGOsideThick} {BGOsideHigh }
BGOsideY_ACTIVE.Mother BGOsideY
BGOsideY_ACTIVE.Position 0.0 { + 0.5*BGOWallFullThickness - 0.5*BGOWallFullThicknessOutside } { -0.5*BGOWallFullThicknessTop + 0.5*BGOWallFullThickness }

Volume BGOsideY_GAP
BGOsideY_GAP.Material al6061
BGOsideY_GAP.Visibility 1
BGOsideY_GAP.Color 4
BGOsideY_GAP.Shape BRIK {BGOinnerX-2*BGOWallFullThickness} {BGOsideThick} { BGOsideGap }
BGOsideY_GAP.Mother BGOsideY_ACTIVE
BGOsideY_GAP.Position 0.0 0.0 0.0


#################################################################################################################
# The electronics boxes outside

#Constant ASICboxXDist { CryostatOuterX + ElectronicsWidth + 2*LowerRadiatorHalfDepth }
#Constant ASICboxYDist { CryostatOuterY + ElectronicsWidth + 2*LowerRadiatorHalfDepth }
Constant ASICboxXDist { BGOouterX + ElectronicsWidth }
Constant ASICboxYDist { BGOouterY + ElectronicsWidth }


Volume ASICbox
ASICbox.Material al6061
ASICbox.Shape BRIK ElectronicsHeight ElectronicsWidth ElectronicsDepth
ASICbox.Visibility 1

Volume ASICboxVacuum
ASICboxVacuum.Material vacuum
ASICboxVacuum.Shape BRIK { ElectronicsHeight - 0.1 } {ElectronicsWidth-0.1} {ElectronicsDepth-0.1}
ASICboxVacuum.Visibility 1
ASICboxVacuum.Mother ASICbox
ASICboxVacuum.Position 0.0 0.0 0.0

Volume ASICboxElectr
ASICboxElectr.Material DIB_Electronic_DensityControlled
ASICboxElectr.Shape BRIK { ElectronicsHeight -0.1-0.4} {ElectronicsWidth-0.1-0.5} {ElectronicsDepth-0.1}
ASICboxElectr.Visibility 1
ASICboxElectr.Mother ASICboxVacuum
ASICboxElectr.Position 0.0 0.0 0.0


For Z  NLayers 0  2.54
   ASICbox.Copy ASICbox1_Copy%Z
   ASICbox1_Copy%Z.Mother ShieldedTelescope
   ASICbox1_Copy%Z.Position {-0.5*allDetX-0.5} {-ASICboxYDist} $Z

   ASICbox.Copy ASICbox2_Copy%Z
   ASICbox2_Copy%Z.Mother ShieldedTelescope
   ASICbox2_Copy%Z.Position {0.5*allDetX+0.5} {-ASICboxYDist} $Z

   ASICbox.Copy ASICbox3_Copy%Z
   ASICbox3_Copy%Z.Mother ShieldedTelescope
   ASICbox3_Copy%Z.Position {-0.5*allDetX-0.5} {ASICboxYDist} $Z

   ASICbox.Copy ASICbox4_Copy%Z
   ASICbox4_Copy%Z.Mother ShieldedTelescope
   ASICbox4_Copy%Z.Position {0.5*allDetX+0.5} {ASICboxYDist} $Z


   ASICbox.Copy ASICbox5_Copy%Z
   ASICbox5_Copy%Z.Mother ShieldedTelescope
   ASICbox5_Copy%Z.Rotation 0.0 0.0 90.0
   ASICbox5_Copy%Z.Position {ASICboxXDist} {-0.5*allDetY-0.5} $Z

   ASICbox.Copy ASICbox6_Copy%Z
   ASICbox6_Copy%Z.Mother ShieldedTelescope
   ASICbox6_Copy%Z.Rotation 0.0 0.0 90.0
   ASICbox6_Copy%Z.Position {ASICboxXDist} {0.5*allDetY+0.5} $Z

   ASICbox.Copy ASICbox7_Copy%Z
   ASICbox7_Copy%Z.Mother ShieldedTelescope
   ASICbox7_Copy%Z.Rotation 0.0 0.0 90.0
   ASICbox7_Copy%Z.Position {-ASICboxXDist} {-0.5*allDetY-0.5} $Z

   ASICbox.Copy ASICbox8_Copy%Z
   ASICbox8_Copy%Z.Mother ShieldedTelescope
   ASICbox8_Copy%Z.Rotation 0.0 0.0 90.0
   ASICbox8_Copy%Z.Position {-ASICboxXDist} {0.5*allDetY+0.5} $Z

Done



#######################################################
# Some electronics boxes


Material UpperDeckElectronicsMaterialDensityControlled
UpperDeckElectronicsMaterialDensityControlled.Density 1.2
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass H 0.0124
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass C 0.1969
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass N 0.018
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass O 0.1349
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass C 0.005
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Al 0.2578
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Si 0.005
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Ca 0.0056
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Ti 0.0135
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Cr 0.0003
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Fe 0.0693
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Ni 0.0364
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Cu 0.1245
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Zn 0.0406
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Sn 0.0032
UpperDeckElectronicsMaterialDensityControlled.ComponentByMass Ta 0.0766


Constant UpperDeckElectronicsXYZHalfSize 6.5

Volume UpperDeckElectronics
UpperDeckElectronics.Shape Box UpperDeckElectronicsXYZHalfSize UpperDeckElectronicsXYZHalfSize UpperDeckElectronicsXYZHalfSize
UpperDeckElectronics.Material UpperDeckElectronicsMaterialDensityControlled
UpperDeckElectronics.Visibility 1
UpperDeckElectronics.Color 7

UpperDeckElectronics.Copy UpperDeckElectronicsMM
UpperDeckElectronicsMM.Position -30 -30 { -ShieldedHeight + UpperDeckElectronicsXYZHalfSize }
UpperDeckElectronicsMM.Mother ShieldedTelescope

UpperDeckElectronics.Copy UpperDeckElectronicsMP
UpperDeckElectronicsMP.Position -30 +30 { -ShieldedHeight + UpperDeckElectronicsXYZHalfSize }
UpperDeckElectronicsMP.Mother ShieldedTelescope

UpperDeckElectronics.Copy UpperDeckElectronicsPP
UpperDeckElectronicsPP.Position +30 +30 { -ShieldedHeight + UpperDeckElectronicsXYZHalfSize }
UpperDeckElectronicsPP.Mother ShieldedTelescope

UpperDeckElectronics.Copy UpperDeckElectronicsPM
UpperDeckElectronicsPM.Position +30 -30 { -ShieldedHeight + UpperDeckElectronicsXYZHalfSize }
UpperDeckElectronicsPM.Mother ShieldedTelescope


