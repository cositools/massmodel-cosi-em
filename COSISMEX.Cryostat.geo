# This is the cryostat model



Volume Telescope
Telescope.Material vacuum
Telescope.Visibility 1
Telescope.Color 67
#Telescope.Shape MainBlockMinusCorner1
Telescope.Shape BRIK {CryostatOuterX} {CryostatOuterY} {CryostatOuterZ + CryoLidZ + CryoBaseStageZ}  
Telescope.Position 0.0 0.0 {-ShieldedHeight -.71 - BGOBotZ + 2*CryoBaseZ+ CryoBaseStageZ + CryostatOuterZ + CryoLidZ + 2*1.605}
#Telescope.Position 0.0 0.0 {-ShieldedHeight+ 2*CryoBaseZ+ CryoBaseStageZ + CryostatOuterZ + CryoLidZ + 2*1.605}
Telescope.Mother ShieldedTelescope

All around Crystat
# 2/10 0.001 inch gold 5 microns
# same Ni

#on cryostat and IR shield

#Fasteners = screws 10% nickel

#################################################################################################################
# The cryostat hull


Constant Au_Strike_AverageThickness 0.0005
Constant Ni_Strike_AverageThickness 0.0005
Constant Safety 0.00001


# Side walls first:

# Do first Ag strike
# Do then Ni strike
# Do the Al

# Ag strike

Shape BRIK CryostatBlock_Ag
CryostatBlock_Ag.Parameters CryostatOuterX CryostatOuterY CryostatOuterZ

Shape BRIK CryostatCavity_Ag
CryostatCavity_Ag.Parameters { CryostatOuterX - 2*CryostatXYFullThickness } { CryostatOuterY - 2*CryostatXYFullThickness } { CryostatOuterZ + Safety }

Orientation CryostatCavityOri
CryostatCavityOri.Position 0.0 0.0 0.0

Shape SUBTRACTION CryostatSide_Ag
CryostatSide_Ag.Parameters CryostatBlock_Ag CryostatCavity_Ag CryostatCavityOri

Volume CryostatSideWalls
CryostatSideWalls.Material gold
CryostatSideWalls.Visibility 1
CryostatSideWalls.Color 4
CryostatSideWalls.Shape CryostatSide_Ag
CryostatSideWalls.Position 0.0 0.0 {-CryoLidZ + CryoBaseStageZ}
CryostatSideWalls.Mother Telescope


# Ni strike

Shape BRIK CryostatBlock_Ni
CryostatBlock_Ni.Parameters { CryostatOuterX - Au_Strike_AverageThickness } { CryostatOuterY - Au_Strike_AverageThickness } { CryostatOuterZ - Au_Strike_AverageThickness }

Shape BRIK CryostatCavity_Ni
CryostatCavity_Ni.Parameters { CryostatOuterX - 2*CryostatXYFullThickness + Au_Strike_AverageThickness } { CryostatOuterY - 2*CryostatXYFullThickness + Au_Strike_AverageThickness } { CryostatOuterZ + Safety }

Shape SUBTRACTION CryostatSide_Ni
CryostatSide_Ni.Parameters CryostatBlock_Ni CryostatCavity_Ni CryostatCavityOri

Volume Cryostat_Ni
Cryostat_Ni.Material Nickel
Cryostat_Ni.Visibility 1
Cryostat_Ni.Color 6
Cryostat_Ni.Shape CryostatSide_Ni
Cryostat_Ni.Position 0.0 0.0 0.0
Cryostat_Ni.Mother CryostatSideWalls


# Al interior

Shape BRIK CryostatBlock_Al
CryostatBlock_Al.Parameters { CryostatOuterX - Au_Strike_AverageThickness - Ni_Strike_AverageThickness } { CryostatOuterY - Au_Strike_AverageThickness - Ni_Strike_AverageThickness } { CryostatOuterZ - Au_Strike_AverageThickness - Ni_Strike_AverageThickness }

Shape BRIK CryostatCavity_Al
CryostatCavity_Al.Parameters { CryostatOuterX - 2*CryostatXYFullThickness + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { CryostatOuterY - 2*CryostatXYFullThickness + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { CryostatOuterZ + Safety }

Shape SUBTRACTION CryostatSide_Al
CryostatSide_Al.Parameters CryostatBlock_Al CryostatCavity_Al CryostatCavityOri

Volume Cryostat_Al
Cryostat_Al.Material al6061
Cryostat_Al.Visibility 1
Cryostat_Al.Color 6
Cryostat_Al.Shape CryostatSide_Al
Cryostat_Al.Position 0.0 0.0 0.0
Cryostat_Al.Mother Cryostat_Ni





# The crystat lid

Constant FeedthroughHalfWidthX 4.267
Constant FeedthroughHalfWidthY 0.7745
Constant FeedthroughHalfWidthZ { CryostatXYFullThickness + Safety }
Constant FeedThroughXYPosition 6.372
Constant FeedThroughHalfWidthGap 2.276


# Step 1: Au strike

Shape BRIK CryostatLidBlock_Au
CryostatLidBlock_Au.Parameters CryostatOuterX CryostatOuterY CryoLidZ

Shape BRIK CryostatLidCavity_Au
CryostatLidCavity_Au.Parameters { CryostatOuterX - CryostatXYFullThickness } { CryostatOuterY - CryostatXYFullThickness } {CryoLidZ - 0.5 * CryostatXYFullThickness + Safety}

Orientation CryostatLidCavityOri_Au
CryostatLidCavityOri_Au.Position 0.0 0.0 { - 0.5 * CryostatXYFullThickness}

Shape SUBTRACTION CryostatLidMinusCavity_Au
CryostatLidMinusCavity_Au.Parameters CryostatLidBlock_Au CryostatLidCavity_Au CryostatLidCavityOri_Au


# Next, make the 8 holes out the top lid, then add in the feedthroughs
Shape BRIK FeedThroughHoleX_Au
FeedThroughHoleX_Au.Parameters FeedthroughHalfWidthX FeedthroughHalfWidthY { 0.5 * CryostatXYFullThickness + Safety }


Orientation FeedThroughHole1Ori_Au
FeedThroughHole1Ori_Au.Position { CryostatOuterX - FeedthroughHalfWidthX-FeedThroughXYPosition} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough1_Au
CryoLidMinusFeedthrough1_Au.Parameters CryostatLidMinusCavity_Au FeedThroughHoleX_Au FeedThroughHole1Ori_Au


Orientation FeedThroughHole2Ori_Au
FeedThroughHole2Ori_Au.Position {-CryostatOuterX+FeedthroughHalfWidthX+FeedThroughXYPosition} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough2_Au
CryoLidMinusFeedthrough2_Au.Parameters CryoLidMinusFeedthrough1_Au FeedThroughHoleX_Au FeedThroughHole2Ori_Au


Orientation FeedThroughHole3Ori_Au
FeedThroughHole3Ori_Au.Position {-CryostatOuterX+FeedthroughHalfWidthX+FeedThroughXYPosition} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough3_Au
CryoLidMinusFeedthrough3_Au.Parameters CryoLidMinusFeedthrough2_Au FeedThroughHoleX_Au FeedThroughHole3Ori_Au


Orientation FeedThroughHole4Ori_Au
FeedThroughHole4Ori_Au.Position {+CryostatOuterX-FeedthroughHalfWidthX-FeedThroughXYPosition} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough4_Au
CryoLidMinusFeedthrough4_Au.Parameters CryoLidMinusFeedthrough3_Au FeedThroughHoleX_Au FeedThroughHole4Ori_Au



Shape BRIK FeedThroughHoleY_Au
FeedThroughHoleY_Au.Parameters FeedthroughHalfWidthY FeedthroughHalfWidthX { 0.5 * CryostatXYFullThickness + Safety }


Orientation FeedThroughHoleY1Ori_Au
FeedThroughHoleY1Ori_Au.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-FeedthroughHalfWidthX-4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY1_Au
CryoLidMinusFeedthroughY1_Au.Parameters CryoLidMinusFeedthrough4_Au FeedThroughHoleY_Au FeedThroughHoleY1Ori_Au

Orientation FeedThroughHoleY2Ori_Au
FeedThroughHoleY2Ori_Au.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {-CryostatOuterY+FeedthroughHalfWidthX+4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY2_Au
CryoLidMinusFeedthroughY2_Au.Parameters CryoLidMinusFeedthroughY1_Au FeedThroughHoleY_Au FeedThroughHoleY2Ori_Au

Orientation FeedThroughHoleY3Ori_Au
FeedThroughHoleY3Ori_Au.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {-14.7255+FeedthroughHalfWidthX+4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY3_Au
CryoLidMinusFeedthroughY3_Au.Parameters CryoLidMinusFeedthroughY2_Au FeedThroughHoleY_Au FeedThroughHoleY3Ori_Au

Orientation FeedThroughHoleY4Ori_Au
FeedThroughHoleY4Ori_Au.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {14.7255-FeedthroughHalfWidthX-4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY4_Au
CryoLidMinusFeedthroughY4_Au.Parameters CryoLidMinusFeedthroughY3_Au FeedThroughHoleY_Au FeedThroughHoleY4Ori_Au


Volume CryostatLid_Au
CryostatLid_Au.Material gold
CryostatLid_Au.Visibility 1
CryostatLid_Au.Color 4
#CryostatLid_Au.Shape CryostatLidBlock_Au
#CryostatLid_Au.Shape CryostatLidMinusCavity_Au
CryostatLid_Au.Shape CryoLidMinusFeedthroughY4_Au
CryostatLid_Au.Position 0.0 0.0 {CryostatOuterZ+CryoBaseStageZ}
CryostatLid_Au.Mother Telescope





# Step 2: Ni strike

Shape BRIK CryostatLidBlock_Ni
CryostatLidBlock_Ni.Parameters { CryostatOuterX - Au_Strike_AverageThickness } { CryostatOuterY - Au_Strike_AverageThickness } { CryoLidZ - Au_Strike_AverageThickness }

Shape BRIK CryostatLidCavity_Ni
CryostatLidCavity_Ni.Parameters { CryostatOuterX - CryostatXYFullThickness + Au_Strike_AverageThickness } { CryostatOuterY - CryostatXYFullThickness + Au_Strike_AverageThickness } { CryoLidZ - 0.5 * CryostatXYFullThickness + Safety}

Orientation CryostatLidCavityOri_Ni
CryostatLidCavityOri_Ni.Position 0.0 0.0 {-0.5*CryostatXYFullThickness + Au_Strike_AverageThickness }

Shape SUBTRACTION CryostatLidMinusCavity_Ni
CryostatLidMinusCavity_Ni.Parameters CryostatLidBlock_Ni CryostatLidCavity_Ni CryostatLidCavityOri_Ni


# Next, make the 8 holes out the top lid, then add in the feedthroughs
Shape BRIK FeedThroughHoleX_Ni
FeedThroughHoleX_Ni.Parameters { FeedthroughHalfWidthX + Au_Strike_AverageThickness } { FeedthroughHalfWidthY + Au_Strike_AverageThickness }  { 0.5 * CryostatXYFullThickness - Au_Strike_AverageThickness + Safety }


Orientation FeedThroughHole1Ori_Ni
FeedThroughHole1Ori_Ni.Position { CryostatOuterX - FeedthroughHalfWidthX-FeedThroughXYPosition} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough1_Ni
CryoLidMinusFeedthrough1_Ni.Parameters CryostatLidMinusCavity_Ni FeedThroughHoleX_Ni FeedThroughHole1Ori_Ni


Orientation FeedThroughHole2Ori_Ni
FeedThroughHole2Ori_Ni.Position {-CryostatOuterX+FeedthroughHalfWidthX+FeedThroughXYPosition} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough2_Ni
CryoLidMinusFeedthrough2_Ni.Parameters CryoLidMinusFeedthrough1_Ni FeedThroughHoleX_Ni FeedThroughHole2Ori_Ni


Orientation FeedThroughHole3Ori_Ni
FeedThroughHole3Ori_Ni.Position {-CryostatOuterX+FeedthroughHalfWidthX+FeedThroughXYPosition} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough3_Ni
CryoLidMinusFeedthrough3_Ni.Parameters CryoLidMinusFeedthrough2_Ni FeedThroughHoleX_Ni FeedThroughHole3Ori_Ni


Orientation FeedThroughHole4Ori_Ni
FeedThroughHole4Ori_Ni.Position {+CryostatOuterX-FeedthroughHalfWidthX-FeedThroughXYPosition} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough4_Ni
CryoLidMinusFeedthrough4_Ni.Parameters CryoLidMinusFeedthrough3_Ni FeedThroughHoleX_Ni FeedThroughHole4Ori_Ni



Shape BRIK FeedThroughHoleY_Ni
FeedThroughHoleY_Ni.Parameters { FeedthroughHalfWidthY + Au_Strike_AverageThickness } { FeedthroughHalfWidthX + Au_Strike_AverageThickness } { 0.5 * CryostatXYFullThickness - Au_Strike_AverageThickness + Safety }


Orientation FeedThroughHoleY1Ori_Ni
FeedThroughHoleY1Ori_Ni.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-FeedthroughHalfWidthX-4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY1_Ni
CryoLidMinusFeedthroughY1_Ni.Parameters CryoLidMinusFeedthrough4_Ni FeedThroughHoleY_Ni FeedThroughHoleY1Ori_Ni

Orientation FeedThroughHoleY2Ori_Ni
FeedThroughHoleY2Ori_Ni.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {-CryostatOuterY+FeedthroughHalfWidthX+4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY2_Ni
CryoLidMinusFeedthroughY2_Ni.Parameters CryoLidMinusFeedthroughY1_Ni FeedThroughHoleY_Ni FeedThroughHoleY2Ori_Ni

Orientation FeedThroughHoleY3Ori_Ni
FeedThroughHoleY3Ori_Ni.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {-14.7255+FeedthroughHalfWidthX+4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY3_Ni
CryoLidMinusFeedthroughY3_Ni.Parameters CryoLidMinusFeedthroughY2_Ni FeedThroughHoleY_Ni FeedThroughHoleY3Ori_Ni

Orientation FeedThroughHoleY4Ori_Ni
FeedThroughHoleY4Ori_Ni.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {14.7255-FeedthroughHalfWidthX-4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY4_Ni
CryoLidMinusFeedthroughY4_Ni.Parameters CryoLidMinusFeedthroughY3_Ni FeedThroughHoleY_Ni FeedThroughHoleY4Ori_Ni



Volume CryostatLid_Ni
CryostatLid_Ni.Material Nickel
CryostatLid_Ni.Visibility 1
CryostatLid_Ni.Color 3
#CryostatLid_Ni.Shape CryostatLidMinusCavity_Ni
CryostatLid_Ni.Shape CryoLidMinusFeedthroughY4_Ni
CryostatLid_Ni.Position 0.0 0.0 0.0
CryostatLid_Ni.Mother CryostatLid_Au



# Step 3: Al core

Shape BRIK CryostatLidBlock_Al
CryostatLidBlock_Al.Parameters { CryostatOuterX - Au_Strike_AverageThickness - Ni_Strike_AverageThickness } { CryostatOuterY - Au_Strike_AverageThickness - Ni_Strike_AverageThickness } { CryoLidZ - Au_Strike_AverageThickness - Ni_Strike_AverageThickness }

Shape BRIK CryostatLidCavity_Al
CryostatLidCavity_Al.Parameters { CryostatOuterX - CryostatXYFullThickness + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { CryostatOuterY - CryostatXYFullThickness + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { CryoLidZ - 0.5 * CryostatXYFullThickness + Safety}

Orientation CryostatLidCavityOri_Al
CryostatLidCavityOri_Al.Position 0.0 0.0 {-0.5*CryostatXYFullThickness + Au_Strike_AverageThickness + Ni_Strike_AverageThickness }

Shape SUBTRACTION CryostatLidMinusCavity_Al
CryostatLidMinusCavity_Al.Parameters CryostatLidBlock_Al CryostatLidCavity_Al CryostatLidCavityOri_Al


# Next, make the 8 holes out the top lid, then add in the feedthroughs
Shape BRIK FeedThroughHoleX_Al
FeedThroughHoleX_Al.Parameters { FeedthroughHalfWidthX + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { FeedthroughHalfWidthY + Au_Strike_AverageThickness + Ni_Strike_AverageThickness }  { 0.5 * CryostatXYFullThickness - Au_Strike_AverageThickness - Ni_Strike_AverageThickness + Safety }


Orientation FeedThroughHole1Ori_Al
FeedThroughHole1Ori_Al.Position { CryostatOuterX - FeedthroughHalfWidthX-FeedThroughXYPosition} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough1_Al
CryoLidMinusFeedthrough1_Al.Parameters CryostatLidMinusCavity_Al FeedThroughHoleX_Al FeedThroughHole1Ori_Al


Orientation FeedThroughHole2Ori_Al
FeedThroughHole2Ori_Al.Position {-CryostatOuterX+FeedthroughHalfWidthX+FeedThroughXYPosition} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough2_Al
CryoLidMinusFeedthrough2_Al.Parameters CryoLidMinusFeedthrough1_Al FeedThroughHoleX_Al FeedThroughHole2Ori_Al


Orientation FeedThroughHole3Ori_Al
FeedThroughHole3Ori_Al.Position {-CryostatOuterX+FeedthroughHalfWidthX+FeedThroughXYPosition} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough3_Al
CryoLidMinusFeedthrough3_Al.Parameters CryoLidMinusFeedthrough2_Al FeedThroughHoleX_Al FeedThroughHole3Ori_Al


Orientation FeedThroughHole4Ori_Al
FeedThroughHole4Ori_Al.Position {+CryostatOuterX-FeedthroughHalfWidthX-FeedThroughXYPosition} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthrough4_Al
CryoLidMinusFeedthrough4_Al.Parameters CryoLidMinusFeedthrough3_Al FeedThroughHoleX_Al FeedThroughHole4Ori_Al



Shape BRIK FeedThroughHoleY_Al
FeedThroughHoleY_Al.Parameters { FeedthroughHalfWidthY + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { FeedthroughHalfWidthX + Au_Strike_AverageThickness + Ni_Strike_AverageThickness } { 0.5 * CryostatXYFullThickness - Au_Strike_AverageThickness - Ni_Strike_AverageThickness + Safety }


Orientation FeedThroughHoleY1Ori_Al
FeedThroughHoleY1Ori_Al.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-FeedthroughHalfWidthX-4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY1_Al
CryoLidMinusFeedthroughY1_Al.Parameters CryoLidMinusFeedthrough4_Al FeedThroughHoleY_Al FeedThroughHoleY1Ori_Al

Orientation FeedThroughHoleY2Ori_Al
FeedThroughHoleY2Ori_Al.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {-CryostatOuterY+FeedthroughHalfWidthX+4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY2_Al
CryoLidMinusFeedthroughY2_Al.Parameters CryoLidMinusFeedthroughY1_Al FeedThroughHoleY_Al FeedThroughHoleY2Ori_Al

Orientation FeedThroughHoleY3Ori_Al
FeedThroughHoleY3Ori_Al.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {-14.7255+FeedthroughHalfWidthX+4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY3_Al
CryoLidMinusFeedthroughY3_Al.Parameters CryoLidMinusFeedthroughY2_Al FeedThroughHoleY_Al FeedThroughHoleY3Ori_Al

Orientation FeedThroughHoleY4Ori_Al
FeedThroughHoleY4Ori_Al.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {14.7255-FeedthroughHalfWidthX-4.588} { CryoLidZ - 0.5 * CryostatXYFullThickness }

Shape SUBTRACTION CryoLidMinusFeedthroughY4_Al
CryoLidMinusFeedthroughY4_Al.Parameters CryoLidMinusFeedthroughY3_Al FeedThroughHoleY_Al FeedThroughHoleY4Ori_Al



Volume CryostatLid_Al
CryostatLid_Al.Material al6061
CryostatLid_Al.Visibility 1
CryostatLid_Al.Color 2
#CryostatLid_Al.Shape CryostatLidMinusCavity_Al
CryostatLid_Al.Shape CryoLidMinusFeedthroughY4_Al
CryostatLid_Al.Position 0.0 0.0 0.0
CryostatLid_Al.Mother CryostatLid_Ni





Volume Cryostat_Interior
Cryostat_Interior.Material vacuum
Cryostat_Interior.Visibility 0
Cryostat_Interior.Color 67
Cryostat_Interior.Shape BRIK { CryostatOuterX -2*CryostatXYFullThickness } { CryostatOuterY - 2*CryostatXYFullThickness } {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness}
Cryostat_Interior.Position 0.0 0.0 {CryoBaseStageZ-0.5*CryostatXYFullThickness}
Cryostat_Interior.Mother Telescope



###################################################################################################
# Feedthrough assembly

Shape BRIK FeedthroughHolder
FeedthroughHolder.Parameters 5.156 1.702 0.635
Shape Brik FeedthroughSlot
FeedthroughSlot.Parameters FeedthroughHalfWidthX FeedthroughHalfWidthY 0.735

Orientation FeedthroughSlotOri
FeedthroughSlotOri.Position 0.0 0.0 0.0

Shape SUBTRACTION FeedthroughHolderMinusSlot
FeedthroughHolderMinusSlot.Parameters FeedthroughHolder FeedthroughSlot FeedthroughSlotOri

Volume FeedthroughAssem
FeedthroughAssem.Material al6061
FeedthroughAssem.Visibility 0
FeedthroughAssem.Color 96
FeedthroughAssem.Shape FeedthroughHolderMinusSlot

FeedthroughAssem.Copy FeedthroughAssem1
FeedthroughAssem1.Rotation 0.0 0.0 90.0
#FeedthroughAssem.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterY-FeedthroughHalfWidthX-4.588} {CryoLidZ-0.735-CryostatXYFullThickness}
FeedthroughAssem1.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterY-5.156-3.699} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem1.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem2
FeedthroughAssem2.Rotation 0.0 0.0 90.0
FeedthroughAssem2.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterY-3*5.156-3.699-1.429} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem2.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem3
FeedthroughAssem3.Rotation 0.0 0.0 90.0
FeedthroughAssem3.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-5.156-3.699} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem3.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem4
FeedthroughAssem4.Rotation 0.0 0.0 90.0
FeedthroughAssem4.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-3*5.156-3.699-1.429} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem4.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem5
FeedthroughAssem5.Position {CryostatOuterX-5.156-5.483} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem5.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem6
FeedthroughAssem6.Position {-CryostatOuterX+5.156+5.483} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem6.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem7
FeedthroughAssem7.Position {CryostatOuterX-5.156-5.483} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem7.Mother Cryostat_Interior

FeedthroughAssem.Copy FeedthroughAssem8
#FeedthroughAssem8.Position {-CryostatOuterX+5.156+5.483} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ+(CryoLidZ-0.635)-CryostatXYFullThickness}
FeedthroughAssem8.Position {-CryostatOuterX+5.156+5.483} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughAssem8.Mother Cryostat_Interior


# now add in the epoxy 
Volume FeedthroughEpoxy
FeedthroughEpoxy.Material Epoxy
FeedthroughEpoxy.Visibility 0
FeedthroughEpoxy.Color 86
FeedthroughEpoxy.Shape BRIK FeedthroughHalfWidthX FeedthroughHalfWidthY 0.3175

FeedthroughEpoxy.Copy FeedthroughEpoxy1
FeedthroughEpoxy1.Rotation 0.0 0.0 90.0
FeedthroughEpoxy1.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterY-5.156-3.699} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy1.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy2
FeedthroughEpoxy2.Rotation 0.0 0.0 90.0
FeedthroughEpoxy2.Position {CryostatOuterX-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterY-3*5.156-3.699-1.429} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy2.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy3
FeedthroughEpoxy3.Rotation 0.0 0.0 90.0
FeedthroughEpoxy3.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-5.156-3.699} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy3.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy4
FeedthroughEpoxy4.Rotation 0.0 0.0 90.0
FeedthroughEpoxy4.Position {-CryostatOuterX+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterY-3*5.156-3.699-1.429} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy4.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy5
FeedthroughEpoxy5.Position {CryostatOuterX-5.156-5.483} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy5.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy6
FeedthroughEpoxy6.Position {-CryostatOuterX+5.156+5.483} {CryostatOuterY-FeedthroughHalfWidthY-FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy6.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy7
FeedthroughEpoxy7.Position {CryostatOuterX-5.156-5.483} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy7.Mother Cryostat_Interior

FeedthroughEpoxy.Copy FeedthroughEpoxy8
FeedthroughEpoxy8.Position {-CryostatOuterX+5.156+5.483} {-CryostatOuterY+FeedthroughHalfWidthY+FeedThroughHalfWidthGap} {CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness-0.635}
FeedthroughEpoxy8.Mother Cryostat_Interior


##################################################################################
# Cryostat bottom and base
# Moved to the ACS geometry

#Shape BRIK CryoBigBase
#CryoBigBase.Parameters CryoBaseX CryoBaseY CryoBaseZ
#Shape BRIK CryoBaseStage
#CryoBaseStage.Parameters CryoBaseStageX CryoBaseStageY CryoBaseStageZ
#Orientation CryoBaseStageOri
#CryoBaseStageOri.Position 0.0 0.0 {(CryoBaseZ-CryoBaseStageZ)+2*CryoBaseStageZ}

#Shape UNION CryoBigBasePlusStage
#CryoBigBasePlusStage.Parameters CryoBigBase CryoBaseStage CryoBaseStageOri

#Shape TUBE CryoBaseFrangHole
#CryoBaseFrangeHole.Parametes 0.0 0.363 {2*CryoBaseStageZ+2*CryoBaseZ+.1} 0.0 360.0
#CryoBaseFrangeHole.Parametes 0.0 0.363 {2.386} 0.0 360.0
#Orientation CryoBaseFrangHoleOri
#CryoBaseFrangHoleOri.Position 0.0 0.0 0.0

#Shape Subtraction CryoBaseMinusFrangHole
#CryoBaseMinusFrangHole.Parameters CryoBigBasePlusStage CryoBaseFrangHole CryoBaseFrangHoleOri

#material is Al6061



Volume Cryostat_Stage_Au
Cryostat_Stage_Au.Material gold
Cryostat_Stage_Au.Visibility 1
Cryostat_Stage_Au.Color 3
Cryostat_Stage_Au.Shape BRIK CryoBaseStageX CryoBaseStageY CryoBaseStageZ
Cryostat_Stage_Au.Position 0.0 0.0 {-CryostatOuterZ - CryoLidZ}
#Cryostat_Stage.Position 0.0 0.0 {-CryostatOuterZ-CryoLidZ-0.5*CryostatXYFullThickness+CryoBaseStageZ}
Cryostat_Stage_Au.Mother Telescope

Volume Cryostat_Stage_Ni
Cryostat_Stage_Ni.Material Nickel
Cryostat_Stage_Ni.Visibility 1
Cryostat_Stage_Ni.Color 3
Cryostat_Stage_Ni.Shape BRIK { CryoBaseStageX - Au_Strike_AverageThickness } { CryoBaseStageY - Au_Strike_AverageThickness } { CryoBaseStageZ - Au_Strike_AverageThickness }
Cryostat_Stage_Ni.Position 0.0 0.0 0.0
Cryostat_Stage_Ni.Mother Cryostat_Stage_Au

Volume Cryostat_Stage_Al
Cryostat_Stage_Al.Material al6061
Cryostat_Stage_Al.Visibility 1
Cryostat_Stage_Al.Color 3
Cryostat_Stage_Al.Shape BRIK { CryoBaseStageX - Au_Strike_AverageThickness - Ni_Strike_AverageThickness } { CryoBaseStageY - Au_Strike_AverageThickness } { CryoBaseStageZ - Au_Strike_AverageThickness - Ni_Strike_AverageThickness }
Cryostat_Stage_Al.Position 0.0 0.0 0.0
Cryostat_Stage_Al.Mother Cryostat_Stage_Ni




#################################################################################################################
# The cold finger


#Constant ColdfingerMaterial   CarbonCyanateEster

#Volume ColdfingerBase
#ColdfingerBase.Material ColdfingerMaterial
#ColdfingerBase.Visibility 1 
#ColdfingerBase.Color 51
#ColdfingerBase.Shape BRIK  { 0.5*ColdfingerDepth } { 0.5*ColdfingerLength } { 0.5*ColdfingerBaseHeight }
#ColdfingerBase.Position 0 0 { ColdfingerBasePosZ + 0.5*ColdfingerBaseHeight }
#ColdfingerBase.Mother Cryostat

#Volume ColdfingerSpire
#ColdfingerSpire.Material ColdfingerMaterial
#ColdfingerSpire.Visibility 1
#ColdfingerSpire.Color 7
#ColdfingerSpire.Shape BRIK  { 0.5*ColdfingerDepth } { 0.5*ColdfingerSpireLength } { 0.5*ColdfingerSpireHeight }

#ColdfingerSpire.Copy ColdfingerSpireA
#ColdfingerSpireA.Position 0 { 0.5*ColdfingerLength - 0.5*ColdfingerSpireLength }  { ColdfingerBasePosZ + ColdfingerBaseHeight + 0.5 * ColdfingerSpireHeight }
#ColdfingerSpireA.Mother Cryostat

#ColdfingerSpire.Copy ColdfingerSpireB
#ColdfingerSpireB.Position 0 { -0.5*ColdfingerLength + 0.5*ColdfingerSpireLength }  { ColdfingerBasePosZ + ColdfingerBaseHeight + 0.5 * ColdfingerSpireHeight }
#ColdfingerSpireB.Mother Cryostat



####################################################################################################################################
#  Detector holder base

Constant DHB_HalfWidth   {0.5*1.27}
#The side along x has a larger bigger width than the other side so I added another constant
Constant DHB_HalfWidth_AlongY   {0.5*0.635}
Constant DHB_HalfWidth_AlongX   {0.5*0.752}
Constant DHB_HalfHeight  {0.5*ColdfingerBaseHeight}
Constant DHB_IRShield_Gap  0.05

Volume DHB_AlongY
DHB_AlongY.Material al6061
DHB_AlongY.Visibility 1 
DHB_AlongY.Color 1
DHB_AlongY.Shape BRIK DHB_HalfWidth_AlongY {0.5*IRShieldY} DHB_HalfHeight

DHB_AlongY.Copy DHB_AlongYPlus
#DHB_AlongYPlus.Position  { 0.5*IRShieldX - IRShieldThickness - DHB_HalfWidth} 0.0 { ColdfingerBasePosZ + DHB_HalfHeight }
DHB_AlongYPlus.Position  { (0.5*IRShieldX) - IRShieldSideX - DHB_IRShield_Gap - DHB_HalfWidth_AlongY } 0.0 {ColdfingerBasePosZ-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_AlongYPlus.Mother Cryostat_Interior


DHB_AlongY.Copy DHB_AlongYMinus
DHB_AlongYMinus.Position  { - 0.5*IRShieldX + IRShieldSideX + DHB_IRShield_Gap + DHB_HalfWidth_AlongY} 0.0 {ColdfingerBasePosZ-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_AlongYMinus.Mother Cryostat_Interior

Constant DHB_AlongX_HalfSizeX { 0.5*(IRShieldX - 2*IRShieldSideX - 4*DHB_HalfWidth_AlongY - 2*DHB_IRShield_Gap) }

Volume DHB_AlongX
DHB_AlongX.Material al6061
DHB_AlongX.Visibility 1
DHB_AlongX.Color 6
DHB_AlongX.Shape BRIK DHB_AlongX_HalfSizeX DHB_HalfWidth_AlongX  DHB_HalfHeight

DHB_AlongX.Copy DHB_AlongXOutDown
#DHB_AlongXOutDown.Position { 0.5*ColdfingerDepth + DHB_AlongX_HalfSizeX } { 0.5*IRShieldY - IRShieldThickness - DHB_HalfWidth} { ColdfingerBasePosZ + DHB_HalfHeight }
DHB_AlongXOutDown.Position { 0.0 } { 0.5*IRShieldY - DHB_HalfWidth_AlongX} {ColdfingerBasePosZ-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_AlongXOutDown.Mother Cryostat_Interior

DHB_AlongX.Copy DHB_AlongXInDown
DHB_AlongXInDown.Position { 0.0 } { - 0.5*IRShieldY + DHB_HalfWidth_AlongX} {ColdfingerBasePosZ-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_AlongXInDown.Mother Cryostat_Interior

#Middle Base is thicker than the other two
Volume DHB_AlongXMiddleDown
DHB_AlongXMiddleDown.Material al7075
DHB_AlongXMiddleDown.Visibility 1
DHB_AlongXMiddleDown.Color 6
DHB_AlongXMiddleDown.Shape BRIK DHB_AlongX_HalfSizeX DHB_HalfWidth  {DHB_HalfHeight-.4}
DHB_AlongXMiddleDown.Position { 0.0 } { 0.0 } {ColdfingerBasePosZ-CryoLidZ+0.5*CryostatXYFullThickness-.2}
DHB_AlongXMiddleDown.Mother Cryostat_Interior

#Center structure material is al7075
Volume DHB_CentStrucBase
DHB_CentStrucBase.Material al7075
DHB_CentStrucBase.Visibility 1
DHB_CentStrucBase.Color 3
DHB_CentStrucBase.Shape BRIK DHB_CentStrucBase_HalfWidth {0.5*(0.5*IRShieldY - 2*DHB_HalfWidth_AlongX-DHB_HalfWidth)} DHB_CentStrucBase_HalfHeight

DHB_CentStrucBase.Copy DHB_CentStrucBase_PosY
DHB_CentStrucBase_PosY.Position 0.0 {0.5*IRShieldY -0.5*(0.5*IRShieldY - 2*DHB_HalfWidth_AlongX-DHB_HalfWidth)-2*DHB_HalfWidth_AlongX } {ColdfingerBasePosZ+(DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucBase_PosY.Mother Cryostat_Interior

DHB_CentStrucBase.Copy DHB_CentStrucBase_NegY
DHB_CentStrucBase_NegY.Position 0.0 {- 0.5*IRShieldY +0.5*(0.5*IRShieldY - 2*DHB_HalfWidth_AlongX-DHB_HalfWidth)+2*DHB_HalfWidth_AlongX } {ColdfingerBasePosZ+(DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucBase_NegY.Mother Cryostat_Interior

#The Center Structure base that connects the two sides over the middle base rod
Volume DHB_CentStrucBase_Bridge
DHB_CentStrucBase_Bridge.Material al7075
DHB_CentStrucBase_Bridge.Visibility 1
DHB_CentStrucBase_Bridge.Color 3
DHB_CentStrucBase_Bridge.Shape BRIK DHB_CentStrucBase_HalfWidth DHB_HalfWidth {DHB_CentStrucBase_HalfHeight-DHB_HalfHeight}
DHB_CentStrucBase_Bridge.Position {0.0} {0.0} {ColdfingerBasePosZ+(DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)+DHB_CentStrucBase_HalfHeight-(DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucBase_Bridge.Mother Cryostat_Interior

Volume DHB_CentStrucArms
DHB_CentStrucArms.Material al7075
DHB_CentStrucArms.Visibility 1
DHB_CentStrucArms.Color 3
DHB_CentStrucArms.Shape BRIK DHB_CentStrucBase_HalfWidth DHB_CentStrucArms_HalfLength DHB_CentStrucArms_HalfHeight

DHB_CentStrucArms.Copy DHB_CentStrucArms_PosY
DHB_CentStrucArms_PosY.Position 0.0 { 0.5*IRShieldY - DHB_HalfWidth_AlongX - DHB_HalfWidth_AlongX - DHB_CentStrucArms_HalfLength } {ColdfingerBasePosZ+(2.0*DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)+DHB_CentStrucArms_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucArms_PosY.Mother Cryostat_Interior

DHB_CentStrucArms.Copy DHB_CentStrucArms_NegY
DHB_CentStrucArms_NegY.Position 0.0 {- 0.5*IRShieldY + DHB_HalfWidth_AlongX + DHB_HalfWidth_AlongX + DHB_CentStrucArms_HalfLength } {ColdfingerBasePosZ+(2.0*DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)+DHB_CentStrucArms_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucArms_NegY.Mother Cryostat_Interior


#Now need to add the added mass that are at the top of the arms. 
#This should also be the material of aluminum 7075
Volume DHB_CentStrucArmsTabs
DHB_CentStrucArmsTabs.Material al7075
DHB_CentStrucArmsTabs.Visibility 0
DHB_CentStrucArmsTabs.Color 3
DHB_CentStrucArmsTabs.Shape BRIK DHB_CentStrucBase_HalfWidth DHB_CentStrucArmsTabs_HalfLength DHB_CentStrucArmsTabs_HalfHeight

DHB_CentStrucArmsTabs.Copy DHB_CentStrucArmsTabs_PosY
DHB_CentStrucArmsTabs_PosY.Position 0.0 {0.5*IRShieldY - DHB_HalfWidth_AlongX - DHB_HalfWidth_AlongX +DHB_CentStrucArmsTabs_HalfLength} {ColdfingerBasePosZ+(2.0*DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)+2*DHB_CentStrucArms_HalfHeight-DHB_CentStrucArmsTabs_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucArmsTabs_PosY.Mother Cryostat_Interior

DHB_CentStrucArmsTabs.Copy DHB_CentStrucArmsTabs_NegY
DHB_CentStrucArmsTabs_NegY.Position 0.0 {-0.5*IRShieldY + DHB_HalfWidth_AlongX + DHB_HalfWidth_AlongX - DHB_CentStrucArmsTabs_HalfLength} {ColdfingerBasePosZ+(2.0*DHB_CentStrucBase_HalfHeight-DHB_HalfHeight)+2*DHB_CentStrucArms_HalfHeight-DHB_CentStrucArmsTabs_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_CentStrucArmsTabs_NegY.Mother Cryostat_Interior

#Renaming DHB_Spire to DHB_DetSidePost since it is titled side post in the CAD
#The material here should be al7075
# The width of this part is smaller than it should be but may be okay when accounting for total mass
Volume DHB_DetSidePost
DHB_DetSidePost.Material al7075
DHB_DetSidePost.Visibility 1
DHB_DetSidePost.Color 67
DHB_DetSidePost.Shape BRIK DHB_DetSidePost_HalfWidth DHB_DetSidePost_HalfLength DHB_DetSidePost_HalfHeight

DHB_DetSidePost.Copy DHB_DetSidePost_PosX
DHB_DetSidePost_PosX.Position {DHB_AlongX_HalfSizeX-1.496} 0.0 {ColdfingerBasePosZ+DHB_HalfHeight+DHB_DetSidePost_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_DetSidePost_PosX.Mother Cryostat_Interior

DHB_DetSidePost.Copy DHB_DetSidePost_NegX
DHB_DetSidePost_NegX.Position {-DHB_AlongX_HalfSizeX+1.496} 0.0 {ColdfingerBasePosZ+DHB_HalfHeight+DHB_DetSidePost_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_DetSidePost_NegX.Mother Cryostat_Interior


#Detector spider and stack skewer in the center of the holder base
#The spider is Al7075 while the rods are 304 stainless steel
Volume DHB_SkewBaseBlock
DHB_SkewBaseBlock.Material al7075 
DHB_SkewBaseBlock.Visibility 1
DHB_SkewBaseBlock.Color 7
DHB_SkewBaseBlock.Shape BRIK 0.5715 0.3685 0.413

DHB_SkewBaseBlock.Copy DHB_SkewBaseBlock_PosX
DHB_SkewBaseBlock_PosX.Position {DHB_CentStrucBase_HalfWidth+0.5715} {0.0} {ColdfingerBasePosZ+DHB_HalfHeight+.413-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_SkewBaseBlock_PosX.Mother Cryostat_Interior

DHB_SkewBaseBlock.Copy DHB_SkewBaseBlock_NegX
DHB_SkewBaseBlock_NegX.Position {-DHB_CentStrucBase_HalfWidth-0.5715} {0.0} {ColdfingerBasePosZ+DHB_HalfHeight+.413-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_SkewBaseBlock_NegX.Mother Cryostat_Interior

#Revisit this, I think the CAD model is wrong
#Volume DHB_SkewBase
#DHB_SkewBase.Material al7075
#DHB_SkewBase.Visibility 1
#DHB_SkewBase.Color 7
#DHB_SkewBase.Shape BRIK 0.216 0.2285 0.4395

#DHB_SkewBase.Copy DHB_SkewBase1
#DHB_SkewBase1.Position {DHB_CentStrucBase_HalfWidth+0.5715+.5715-.216} {0.3685+0.2285} {ColdfingerBasePosZ+DHB_HalfHeight+0.4395-CryoLidZ+0.5*CryostatXYFullThickness}
#DHB_SkewBase1.Mother Cryostat_Interior

#DHB_SkewBase.Copy DHB_SkewBase2
#DHB_SkewBase2.Position {DHB_CentStrucBase_HalfWidth+0.5715+.5715-.216} {-0.3685-0.2285} {ColdfingerBasePosZ+DHB_HalfHeight+0.4395-CryoLidZ+0.5*CryostatXYFullThickness}
#DHB_SkewBase2.Mother Cryostat_Interior

#DHB_SkewBase.Copy DHB_SkewBase3
#DHB_SkewBase3.Position {-DHB_CentStrucBase_HalfWidth-0.5715-.5715+.216} {-0.3685-0.2285} {ColdfingerBasePosZ+DHB_HalfHeight+0.4395-CryoLidZ+0.5*CryostatXYFullThickness}
#DHB_SkewBase3.Mother Cryostat_Interior

#DHB_SkewBase.Copy DHB_SkewBase4
#DHB_SkewBase4.Position {-DHB_CentStrucBase_HalfWidth-0.5715-.5715+.216} {0.3685+0.2285} {ColdfingerBasePosZ+DHB_HalfHeight+0.4395-CryoLidZ+0.5*CryostatXYFullThickness}
#DHB_SkewBase4.Mother Cryostat_Interior

#Now add the rods
Volume DHB_Skewer
#DHB_Skewer.Material steel_304
DHB_Skewer.Material A286
DHB_Skewer.Visibility 1
DHB_Skewer.Color 7
DHB_Skewer.Shape TUBS 0.0 0.1 4.972 0.0 360.0

DHB_Skewer.Copy DHB_Skewer1
DHB_Skewer1.Position {DHB_CentStrucBase_HalfWidth+0.5715+.5715-.166} {0.3685+0.4085} {ColdfingerBasePosZ+DHB_HalfHeight+2*0.5395+4.972-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_Skewer1.Mother Cryostat_Interior

DHB_Skewer.Copy DHB_Skewer2
DHB_Skewer2.Position {DHB_CentStrucBase_HalfWidth+0.5715+.5715-.166} {-0.3685-0.4085} {ColdfingerBasePosZ+DHB_HalfHeight+2*0.5395+4.972-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_Skewer2.Mother Cryostat_Interior

DHB_Skewer.Copy DHB_Skewer3
DHB_Skewer3.Position {-DHB_CentStrucBase_HalfWidth-0.5715-.5715+.166} {-0.3685-0.4085} {ColdfingerBasePosZ+DHB_HalfHeight+2*0.5395+4.972-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_Skewer3.Mother Cryostat_Interior

DHB_Skewer.Copy DHB_Skewer4
DHB_Skewer4.Position {-DHB_CentStrucBase_HalfWidth-0.5715-0.5715+0.166} {0.3685+0.4085} {ColdfingerBasePosZ+DHB_HalfHeight+2*0.5395+4.972-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_Skewer4.Mother Cryostat_Interior

#Spider
#removing for now because its causing problems
Shape BRIK SpiderBlock 
SpiderBlock.Parameters 2.0385 0.9145 0.1015
Shape TUBS Rod_Hole1
Rod_Hole1.Parameters 0.0 0.3 0.11 0.0 360.0
Orientation Rod_Hole1_Ori
Rod_Hole1_Ori.Position 1.7215 0.5975 0.0

Shape Subtraction SpiderBlockMinusHole1
SpiderBlockMinusHole1.Parameters SpiderBlock Rod_Hole1 Rod_Hole1_Ori 

Shape TUBS Rod_Hole2 
Rod_Hole2.Parameters 0.0 0.3 0.11 0.0 360.0
Orientation Rod_Hole2_Ori
Rod_Hole2_Ori.Position -1.7215 0.5975 0.0

Shape Subtraction SpiderBlockMinusHole2
SpiderBlockMinusHole2.Parameters SpiderBlockMinusHole1 Rod_Hole2 Rod_Hole2_Ori

Shape TUBS Rod_Hole3
Rod_Hole3.Parameters 0.0 0.3 0.11 0.0 360.0
Orientation Rod_Hole3_Ori
Rod_Hole3_Ori.Position 1.7215 -0.5975 0.0

Shape Subtraction SpiderBlockMinusHole3
SpiderBlockMinusHole3.Parameters SpiderBlockMinusHole2 Rod_Hole3 Rod_Hole3_Ori

Shape TUBS Rod_Hole4
Rod_Hole4.Parameters 0.0 0.3 0.11 0.0 360.0
Orientation Rod_Hole4_Ori
Rod_Hole4_Ori.Position -1.7215 -0.5975 0.0

Shape Subtraction SpiderBlockMinusHole4
SpiderBlockMinusHole4.Parameters SpiderBlockMinusHole3 Rod_Hole4 Rod_Hole4_Ori

#Removing this for now because it is causing problems
Volume DHB_Spider
DHB_Spider.Material al7075
DHB_Spider.Visibility 1
DHB_Spider.Color 7
DHB_Spider.Shape SpiderBlockMinusHole4
DHB_Spider.Position 0.0 0.0 {ColdfingerBasePosZ+DHB_HalfHeight+2*0.5395+2*4.972+0.1015-0.521-CryoLidZ+0.5*CryostatXYFullThickness+.123}
DHB_Spider.Mother Cryostat_Interior


#Now adding the four blocks around the center where the two bases meet
#This should be al7075
Volume DHB_BaseBlock
DHB_BaseBlock.Material al7075
DHB_BaseBlock.Visibility 1
DHB_BaseBlock.Color 6
DHB_BaseBlock.Shape BRIK 0.5715 0.362 0.597

DHB_BaseBlock.Copy DHB_BaseBlock1
DHB_BaseBlock1.Position { DHB_CentStrucBase_HalfWidth+0.5715}  {DHB_HalfWidth+0.362 } { ColdfingerBasePosZ-(DHB_HalfHeight-0.597)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_BaseBlock1.Mother Cryostat_Interior

DHB_BaseBlock.Copy DHB_BaseBlock2
DHB_BaseBlock2.Position { DHB_CentStrucBase_HalfWidth+0.5715}  {-DHB_HalfWidth-0.362 } { ColdfingerBasePosZ -(DHB_HalfHeight-0.597)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_BaseBlock2.Mother Cryostat_Interior


DHB_BaseBlock.Copy DHB_BaseBlock3
DHB_BaseBlock3.Position {-DHB_CentStrucBase_HalfWidth-0.5715}  {-DHB_HalfWidth-0.362 } { ColdfingerBasePosZ -(DHB_HalfHeight-0.597)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_BaseBlock3.Mother Cryostat_Interior

DHB_BaseBlock.Copy DHB_BaseBlock4
DHB_BaseBlock4.Position {-DHB_CentStrucBase_HalfWidth-0.5715}  {DHB_HalfWidth+0.362 } { ColdfingerBasePosZ -(DHB_HalfHeight-0.597)-CryoLidZ+0.5*CryostatXYFullThickness}
DHB_BaseBlock4.Mother Cryostat_Interior

#This should be bronze
Volume CagingStud
CagingStud.Material bronze_544
CagingStud.Visibility 1
CagingStud.Color 14
CagingStud.Shape TUBS 0.357 0.635 0.47 0.0 360.0

CagingStud.Copy CagingStud1
CagingStud1.Mother Cryostat_Interior
CagingStud1.Position {0.5*IRShieldX-4.6235} 0.0 {ColdfingerBasePosZ-.47-DHB_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}

CagingStud.Copy CagingStud2
CagingStud2.Mother Cryostat_Interior
CagingStud2.Position {-0.5*IRShieldX+4.6235} 0.0 {ColdfingerBasePosZ-.47-DHB_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}

CagingStud.Copy CagingStud3
CagingStud3.Mother Cryostat_Interior
CagingStud3.Position 0.0 {-0.5*IRShieldY+2.841} {ColdfingerBasePosZ-.47-DHB_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}

CagingStud.Copy CagingStud4
CagingStud4.Mother Cryostat_Interior
CagingStud4.Position 0.0 {0.5*IRShieldY-2.841} {ColdfingerBasePosZ-.47-DHB_HalfHeight-CryoLidZ+0.5*CryostatXYFullThickness}

#Bellville stake assembly cage
#This should be A286 stainless steel
Volume Bellville_Assem
Bellville_Assem.Material steel_a286
Bellville_Assem.Visibility 1
Bellville_Assem.Color 12
Bellville_Assem.Shape TUBS 0.0 1.2605 0.8635 0.0 360.0
Bellville_Assem.Position {0.0} {0.0} {ColdfingerBasePosZ-2*.8635-(DHB_HalfHeight-.8635)-CryoLidZ+0.5*CryostatXYFullThickness}
Bellville_Assem.Mother Cryostat_Interior

###################################################################################################################
# The detectors

Constant DetDepth {(-CryostatOuterZ - CryoLidZ - CryoBaseStageZ)-15}

For Z  NLayers  { DetZPos }  {2.5660}
   SingleDetector.Copy SingleDetector_Copy%Z_Q3
   SingleDetector_Copy%Z_Q3.Mother Cryostat_Interior
   SingleDetector_Copy%Z_Q3.Rotation 0.0 0.0 180.0
   SingleDetector_Copy%Z_Q3.Position {DetX + DetXHalfGap} {DetY+DetYHalfGap} {$Z}

   SingleDetector.Copy SingleDetector_Copy%Z_Q2
   SingleDetector_Copy%Z_Q2.Mother Cryostat_Interior
   SingleDetector_Copy%Z_Q2.Rotation 180.0 0.0 180.0
   SingleDetector_Copy%Z_Q2.Position {DetX + DetXHalfGap} {-(DetY+DetYHalfGap)} {$Z}

   SingleDetector.Copy SingleDetector_Copy%Z_Q1
   SingleDetector_Copy%Z_Q1.Mother Cryostat_Interior
   SingleDetector_Copy%Z_Q1.Rotation 0.0 0.0 0.0
   SingleDetector_Copy%Z_Q1.Position {-DetX-DetXHalfGap} {-(DetY+DetYHalfGap)} {$Z}
Done

#Now make Q0 with two active detectors
For Z  2  { DetZPos}  {2.5660}
   SingleDetector.Copy SingleDetector_Copy%Z_Q0
   SingleDetector_Copy%Z_Q0.Mother Cryostat_Interior
   SingleDetector_Copy%Z_Q0.Rotation 180.0 0.0 0.0
   SingleDetector_Copy%Z_Q0.Position {-DetX - DetXHalfGap} {DetY+DetYHalfGap} {$Z}
Done

DetectorQ0D0.Mother Cryostat_Interior
DetectorQ0D0.Rotation 180 0 0
DetectorQ0D0.Position {-DetX - DetXHalfGap} {DetY + DetYHalfGap} {DetZPos + 2.566*3}

DetectorQ0D1.Mother Cryostat_Interior
DetectorQ0D1.Rotation 180 0 0
DetectorQ0D1.Position {-DetX - DetXHalfGap} {DetY + DetYHalfGap} {DetZPos + 2.566*2}


##########################################################
## IR shields
# Updated by Alyson Joens on 03/04/23
#It looks like the X and Y sides of the IR shield have gotten slightly biggger(~.5 cm) in this new step file.
# Going to leave it as it was before until I verify with Brad that the dimensions have in fact changed because
# this measurement is tied to others and would require adjustment. If it has indeed changed did the dimenstions of the DHB also change?
# Using the step file COSI-SMX-SPC-MEC-000 Spectrometer Assy_Rad.STEP for the measurements of everything except the holes which I will use
# COSI-SMX-DET-MEC-320 Thermal Shield Assy.STEP for.


# Starting with the IRShield on the Y side
# Holes on the left side that start closer to the top of the shields
Shape BRIK IRShieldY_Block
IRShieldY_Block.Parameters { 0.5*IRShieldX } { 0.5 * IRShieldThickness } { 0.5 * IRShieldZ }
Shape BRIK IRShield_Hole1
IRShield_Hole1.Parameters { 0.5*IRShieldHoleX} { 0.5*IRShieldThickness+.01} {0.5*IRShieldHoleZ} 
Orientation IRShield_Hole1Ori
IRShield_Hole1Ori.Position {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-2.774 } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-0.927 }

Shape Subtraction IRShieldBlockMinusHole1
IRShieldBlockMinusHole1.Parameters IRShieldY_Block IRShield_Hole1 IRShield_Hole1Ori

Orientation IRShield_Hole2Ori
IRShield_Hole2Ori.Position {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-2.774 } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-0.927-IRShieldHoleZ-IRShieldSideY_Zspace }

Shape Subtraction IRShieldBlockMinusHole2
IRShieldBlockMinusHole2.Parameters IRShieldBlockMinusHole1 IRShield_Hole1 IRShield_Hole2Ori

Orientation IRShield_Hole3Ori
IRShield_Hole3Ori.Position {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-IRShieldSideY_Xpos } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole1_Zpos-2*IRShieldHoleZ-2*IRShieldSideY_Zspace }

Shape Subtraction IRShieldBlockMinusHole3
IRShieldBlockMinusHole3.Parameters IRShieldBlockMinusHole2 IRShield_Hole1 IRShield_Hole3Ori

Orientation IRShield_Hole4Ori
IRShield_Hole4Ori.Position {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-IRShieldSideY_Xpos } {0.0} {( 0.5 * IRShieldZ )-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole1_Zpos-3*IRShieldHoleZ-3*IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockMinusHole4
IRShieldBlockMinusHole4.Parameters IRShieldBlockMinusHole3 IRShield_Hole1 IRShield_Hole4Ori


# Holes on the other side that are further from the top
Orientation IRShield_Hole5Ori
IRShield_Hole5Ori.Position {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideY_Xpos } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos}

Shape Subtraction IRShieldBlockMinusHole5
IRShieldBlockMinusHole5.Parameters IRShieldBlockMinusHole4 IRShield_Hole1 IRShield_Hole5Ori

Orientation IRShield_Hole6Ori
IRShield_Hole6Ori.Position {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideY_Xpos } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos-IRShieldHoleZ-IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockMinusHole6
IRShieldBlockMinusHole6.Parameters IRShieldBlockMinusHole5 IRShield_Hole1 IRShield_Hole6Ori

Orientation IRShield_Hole7Ori
IRShield_Hole7Ori.Position {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideY_Xpos } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos-2*IRShieldHoleZ-2*IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockMinusHole7
IRShieldBlockMinusHole7.Parameters IRShieldBlockMinusHole6 IRShield_Hole1 IRShield_Hole7Ori

Orientation IRShield_Hole8Ori
IRShield_Hole8Ori.Position {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideY_Xpos } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos-3*IRShieldHoleZ-3*IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockMinusHole8
IRShieldBlockMinusHole8.Parameters IRShieldBlockMinusHole7 IRShield_Hole1 IRShield_Hole8Ori

# Small rectangular hole for the DHB_Arm to pop out
Shape BRIK IRShield_RecHole
IRShield_RecHole.Parameters {0.5*IRShield_RecHoleX} {0.5 * IRShieldThickness+.1} {0.5*IRShield_RecHoleZ}
Orientation IRShield_RecHoleOri
IRShield_RecHoleOri.Position {0.0} {0.0} { 0.5 * IRShieldZ - 0.5*IRShield_RecHoleZ}

Shape Subtraction IRShieldBlockMinusRecHole
IRShieldBlockMinusRecHole.Parameters IRShieldBlockMinusHole8 IRShield_RecHole IRShield_RecHoleOri

# Circle hole
Shape TUBS IRShield_CircHole
IRShield_CircHole.Parameters 0.0 IRShield_CircHole_Rad {0.5 * IRShieldThickness+.1} 0.0 360.0
Orientation IRShield_CircHoleOri
IRShield_CircHoleOri.Rotation 90.0 0.0 0.0
IRShield_CircHoleOri.Position {0.0} {0.0} { 0.5 * IRShieldZ-IRShield_RecHoleZ-IRShield_CircHole_Rad-IRShield_CircHole_ZPos}

Shape Subtraction IRShieldBlockMinusCircHole
IRShieldBlockMinusCircHole.Parameters IRShieldBlockMinusRecHole IRShield_CircHole IRShield_CircHoleOri

Volume IRShieldSidePosY
IRShieldSidePosY.Material al6061
IRShieldSidePosY.Visibility 1
IRShieldSidePosY.Color 15
IRShieldSidePosY.Shape IRShieldBlockMinusCircHole
#IRShieldSidePosY.Position  0 { 0.5*IRShieldY + 0.5 * IRShieldThickness} { IRShieldPosZ + 0.5* IRShieldZ -DHB_HalfHeight}
IRShieldSidePosY.Position  0 { 0.5*IRShieldY + 0.5 * IRShieldThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSidePosY.Mother Cryostat_Interior

Volume IRShieldSideNegY
IRShieldSideNegY.Material al6061
IRShieldSideNegY.Visibility 0
IRShieldSideNegY.Color 15
IRShieldSideNegY.Shape IRShieldBlockMinusCircHole
IRShieldSideNegY.Position  {0.0} {- 0.5*IRShieldY - 0.5 * IRShieldThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideNegY.Rotation 0.0 0.0 180.0
IRShieldSideNegY.Mother Cryostat_Interior


# The Au and Ni strikes are a crude approximation since we for the moment ignore the feedthroughs
# Plus they are just on one side but with double the size:

Volume IRShieldSidePosYAu
IRShieldSidePosYAu.Material gold
IRShieldSidePosYAu.Visibility 1
IRShieldSidePosYAu.Color 8
IRShieldSidePosYAu.Shape BRIK { 0.5*IRShieldX } { Au_Strike_AverageThickness } { 0.5 * IRShieldZ }
IRShieldSidePosYAu.Position  0 { 0.5*IRShieldY + IRShieldThickness + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSidePosYAu.Mother Cryostat_Interior

Volume IRShieldSidePosYNi
IRShieldSidePosYNi.Material Nickel
IRShieldSidePosYNi.Visibility 1
IRShieldSidePosYNi.Color 8
IRShieldSidePosYNi.Shape BRIK { 0.5*IRShieldX } { Ni_Strike_AverageThickness } { 0.5 * IRShieldZ }
IRShieldSidePosYNi.Position  0 { 0.5*IRShieldY + IRShieldThickness + Ni_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSidePosYNi.Mother Cryostat_Interior


Volume IRShieldSideNegYAu
IRShieldSideNegYAu.Material gold
IRShieldSideNegYAu.Visibility 1
IRShieldSideNegYAu.Color 8
IRShieldSideNegYAu.Shape BRIK { 0.5*IRShieldX } { Au_Strike_AverageThickness } { 0.5 * IRShieldZ }
IRShieldSideNegYAu.Position  0 {- 0.5*IRShieldY - IRShieldThickness-2*Ni_Strike_AverageThickness - Au_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideNegYAu.Mother Cryostat_Interior


Volume IRShieldSideNegYNi
IRShieldSideNegYNi.Material Nickel
IRShieldSideNegYNi.Visibility 1
IRShieldSideNegYNi.Color 8
IRShieldSideNegYNi.Shape BRIK { 0.5*IRShieldX } { Ni_Strike_AverageThickness } { 0.5 * IRShieldZ }
IRShieldSideNegYNi.Position  0 {- 0.5*IRShieldY - IRShieldThickness-Ni_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideNegYNi.Mother Cryostat_Interior


# Now for the IR Shields on the X side
Shape BRIK IRShieldX_Block
IRShieldX_Block.Parameters { 0.5 * IRShieldThickness } { 0.5 * IRShieldY } { 0.5 * IRShieldZ }
Shape BRIK IRShieldX_Hole1
IRShieldX_Hole1.Parameters { 0.5*IRShieldThickness+.01} { 0.5*IRShieldHoleX} {0.5*IRShieldHoleZ}
Orientation IRShieldX_Hole1Ori
IRShieldX_Hole1Ori.Position {0.0} {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-IRShieldSideX_Xpos} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole1_Zpos}

Shape Subtraction IRShieldBlockXMinusHole1
IRShieldBlockXMinusHole1.Parameters IRShieldX_Block IRShieldX_Hole1 IRShieldX_Hole1Ori

Orientation IRShieldX_Hole2Ori
#IRShield_Hole2Ori.Position {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-2.774 } {0.0} {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-0.927-IRShieldHoleZ-IRShieldSideY_Zspace }
IRShieldX_Hole2Ori.Position {0.0} {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-IRShieldSideX_Xpos} {( 0.5 * IRShieldZ )-(0.5*IRShieldHoleZ)-IRShieldHoleZ-IRShieldSideY_Hole1_Zpos-IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockXMinusHole2
IRShieldBlockXMinusHole2.Parameters IRShieldBlockXMinusHole1 IRShieldX_Hole1 IRShieldX_Hole2Ori

Orientation IRShieldX_Hole3Ori
IRShieldX_Hole3Ori.Position {0.0} {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-IRShieldSideX_Xpos } {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole1_Zpos-2*IRShieldHoleZ-2*IRShieldSideY_Zspace }

Shape Subtraction IRShieldBlockXMinusHole3
IRShieldBlockXMinusHole3.Parameters IRShieldBlockXMinusHole2 IRShieldX_Hole1 IRShieldX_Hole3Ori

Orientation IRShieldX_Hole4Ori
IRShieldX_Hole4Ori.Position {0.0} {(0.5*IRShieldX)- (0.5*IRShieldHoleX)-IRShieldSideX_Xpos } {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole1_Zpos-3*IRShieldHoleZ-3*IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockXMinusHole4
IRShieldBlockXMinusHole4.Parameters IRShieldBlockXMinusHole3 IRShieldX_Hole1 IRShieldX_Hole4Ori


# Holes on the other side that are further from the top
Orientation IRShieldX_Hole5Ori
IRShieldX_Hole5Ori.Position {0.0} {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideX_Xpos } {( 0.5 * IRShieldZ )-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos}

Shape Subtraction IRShieldBlockXMinusHole5
IRShieldBlockXMinusHole5.Parameters IRShieldBlockXMinusHole4 IRShieldX_Hole1 IRShieldX_Hole5Ori

Orientation IRShieldX_Hole6Ori
IRShieldX_Hole6Ori.Position {0.0} {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideX_Xpos } {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos-IRShieldHoleZ-IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockXMinusHole6
IRShieldBlockXMinusHole6.Parameters IRShieldBlockXMinusHole5 IRShieldX_Hole1 IRShieldX_Hole6Ori

Orientation IRShieldX_Hole7Ori
IRShieldX_Hole7Ori.Position {0.0} {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideX_Xpos } {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos-2*IRShieldHoleZ-2*IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockXMinusHole7
IRShieldBlockXMinusHole7.Parameters IRShieldBlockXMinusHole6 IRShieldX_Hole1 IRShieldX_Hole7Ori

Orientation IRShieldX_Hole8Ori
IRShieldX_Hole8Ori.Position {0.0} {-(0.5*IRShieldX)+ (0.5*IRShieldHoleX)+IRShieldSideX_Xpos } {( 0.5 * IRShieldZ)-(0.5*IRShieldHoleZ)-IRShieldSideY_Hole2_Zpos-3*IRShieldHoleZ-3*IRShieldSideY_Zspace}

Shape Subtraction IRShieldBlockXMinusHole8
IRShieldBlockXMinusHole8.Parameters IRShieldBlockXMinusHole7 IRShieldX_Hole1 IRShieldX_Hole8Ori

# Circle hole
Orientation IRShieldX_CircHoleOri
IRShieldX_CircHoleOri.Rotation 0.0 90.0 0.0
IRShieldX_CircHoleOri.Position {0.0} {0.0} {-0.5*IRShieldZ  + IRShield_CircHole_Rad + IRShieldX_CircHole_Zpos}

Shape Subtraction IRShieldBlockXMinusCircHole
IRShieldBlockXMinusCircHole.Parameters IRShieldBlockXMinusHole8 IRShield_CircHole IRShieldX_CircHoleOri

Volume IRShieldSidePosX
IRShieldSidePosX.Material al6061
IRShieldSidePosX.Visibility 1
IRShieldSidePosX.Color 15
IRShieldSidePosX.Shape IRShieldBlockXMinusCircHole
IRShieldSidePosX.Rotation 0.0 0.0 180.0
IRShieldSidePosX.Position { 0.5*IRShieldX + 0.5 * IRShieldThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSidePosX.Mother Cryostat_Interior

Volume IRShieldSideNegX
IRShieldSideNegX.Material al6061
IRShieldSideNegX.Visibility 1
IRShieldSideNegX.Color 15
IRShieldSideNegX.Shape IRShieldBlockXMinusCircHole
IRShieldSideNegX.Position {- 0.5*IRShieldX - 0.5 * IRShieldThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideNegX.Mother Cryostat_Interior


# The Au and Ni strikes are a crude approximation since we for the moment ignore the feedthroughs
# Plus they are just on one side but with double the size:

Volume IRShieldSidePosXAu
IRShieldSidePosXAu.Material gold
IRShieldSidePosXAu.Visibility 1
IRShieldSidePosXAu.Color 8
IRShieldSidePosXAu.Shape BRIK  { Au_Strike_AverageThickness } { 0.5 * IRShieldY } { 0.5 * IRShieldZ }
IRShieldSidePosXAu.Position  { 0.5*IRShieldX - IRShieldThickness - 2*Ni_Strike_AverageThickness - Au_Strike_AverageThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSidePosXAu.Mother Cryostat_Interior

Volume IRShieldSidePosXNi
IRShieldSidePosXNi.Material Nickel
IRShieldSidePosXNi.Visibility 1
IRShieldSidePosXNi.Color 8
IRShieldSidePosXNi.Shape BRIK  { Ni_Strike_AverageThickness } { 0.5 * IRShieldY } { 0.5 * IRShieldZ }
IRShieldSidePosXNi.Position  { 0.5*IRShieldX - IRShieldThickness - Ni_Strike_AverageThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSidePosXNi.Mother Cryostat_Interior


Volume IRShieldSideNegXAu
IRShieldSideNegXAu.Material gold
IRShieldSideNegXAu.Visibility 1
IRShieldSideNegXAu.Color 8
IRShieldSideNegXAu.Shape BRIK { Au_Strike_AverageThickness } { 0.5 * IRShieldY } { 0.5 * IRShieldZ }
IRShieldSideNegXAu.Position  {- 0.5*IRShieldX + IRShieldThickness + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness} 0.0 {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideNegXAu.Mother Cryostat_Interior


Volume IRShieldSideNegXNi
IRShieldSideNegXNi.Material Nickel
IRShieldSideNegXNi.Visibility 1
IRShieldSideNegXNi.Color 8
IRShieldSideNegXNi.Shape BRIK { Ni_Strike_AverageThickness } { 0.5 * IRShieldY } { 0.5 * IRShieldZ }
IRShieldSideNegXNi.Position  {- 0.5*IRShieldX + IRShieldThickness + Ni_Strike_AverageThickness} 0.0 {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideNegXNi.Mother Cryostat_Interior


## IR shield top

# Now will add tabs to the top and sides of all IR Shields, starting with the IR shields on the posX and negX side
Volume IRShieldSideX_TopTab
IRShieldSideX_TopTab.Material al6061
IRShieldSideX_TopTab.Visibility 1
IRShieldSideX_TopTab.Color 15
IRShieldSideX_TopTab.Shape BRIK IRShieldSideX_TopTabX IRShieldSideX_TopTabY {.5*IRShieldThickness}

IRShieldSideX_TopTab.Copy IRShieldSideX_TopTabNegX
#May need to remove one of the IR shield thicknesses here. Just going to do it then check
IRShieldSideX_TopTabNegX.Position {- 0.5*IRShieldX - 0.5 * IRShieldThickness+IRShieldSideX_TopTabX} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideX_TopTabNegX.Mother Cryostat_Interior

IRShieldSideX_TopTab.Copy IRShieldSideX_TopTabPosX
#IRShieldSideX_TopTabPosX.Position { 0.5*IRShieldX +0.5 * IRShieldThickness-IRShieldSideX_TopTabX} {0.0} {IRShieldPosZ + 0.5* IRShieldZ -IRShieldThickness-DHB_HalfHeight+ 0.5 * IRShieldZ}
IRShieldSideX_TopTabPosX.Position { 0.5*IRShieldX +0.5 * IRShieldThickness-IRShieldSideX_TopTabX} {0.0}{(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideX_TopTabPosX.Mother Cryostat_Interior

#IR Shield on the Y side
Volume IRShieldSideY_TopTab
IRShieldSideY_TopTab.Material al6061
IRShieldSideY_TopTab.Visibility 1
IRShieldSideY_TopTab.Color 15
IRShieldSideY_TopTab.Shape BRIK IRShieldSideY_TopTabX IRShieldSideX_TopTabX {.5*IRShieldThickness}

IRShieldSideY_TopTab.Copy IRShieldSideY_TopTab1NegY
#IRShieldSideY_TopTab1NegY.Position {0.5*IRShieldX-IRShieldSideY_TopTabX} {- 0.5*IRShieldY - 0.5 * IRShieldThickness+IRShieldSideX_TopTabX} { IRShieldPosZ + IRShieldZ -IRShieldThickness-DHB_HalfHeight}
IRShieldSideY_TopTab1NegY.Position {0.5*IRShieldX-IRShieldSideY_TopTabX} {- 0.5*IRShieldY - 0.5 * IRShieldThickness+IRShieldSideX_TopTabX} {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideY_TopTab1NegY.Mother Cryostat_Interior

IRShieldSideY_TopTab.Copy IRShieldSideY_TopTab2NegY
IRShieldSideY_TopTab2NegY.Position {-0.5*IRShieldX+IRShieldSideY_TopTabX} {- 0.5*IRShieldY - 0.5 * IRShieldThickness+IRShieldSideX_TopTabX} {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideY_TopTab2NegY.Mother Cryostat_Interior

IRShieldSideY_TopTab.Copy IRShieldSideY_TopTab1PosY
IRShieldSideY_TopTab1PosY.Position {-0.5*IRShieldX+IRShieldSideY_TopTabX} { 0.5*IRShieldY + 0.5 * IRShieldThickness-IRShieldSideX_TopTabX} {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideY_TopTab1PosY.Mother Cryostat_Interior

IRShieldSideY_TopTab.Copy IRShieldSideY_TopTab2PosY
IRShieldSideY_TopTab2PosY.Position {0.5*IRShieldX-IRShieldSideY_TopTabX} { 0.5*IRShieldY + 0.5 * IRShieldThickness-IRShieldSideX_TopTabX} {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideY_TopTab2PosY.Mother Cryostat_Interior

# Now for the IR Shields on the bottom
Volume IRShieldSideX_BotTab
IRShieldSideX_BotTab.Material al6061
IRShieldSideX_BotTab.Visibility 1
IRShieldSideX_BotTab.Color 15
IRShieldSideX_BotTab.Shape BRIK { IRShieldSideX_BotTabX } { IRShieldSideX_TopTabY } {.5*IRShieldThickness}

IRShieldSideX_BotTab.Copy IRShieldSideX_BotTabNegX
#IRShieldSideX_BotTabNegX.Position {- 0.5*IRShieldX - 0.5 * IRShieldThickness+IRShieldSideX_BotTabX} {0.0} {- (IRShieldPosZ + IRShieldZ -IRShieldThickness+3*DHB_HalfHeight)}
IRShieldSideX_BotTabNegX.Position {- 0.5*IRShieldX - 0.5 * IRShieldThickness+IRShieldSideX_BotTabX} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight- 0.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideX_BotTabNegX.Mother Cryostat_Interior

IRShieldSideX_BotTab.Copy IRShieldSideX_BotTabPosX
IRShieldSideX_BotTabPosX.Position { 0.5*IRShieldX +0.5 * IRShieldThickness-IRShieldSideX_BotTabX} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight- 0.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideX_BotTabPosX.Mother Cryostat_Interior

#IR Shield on the bottom of the  Y side
Volume IRShieldSideY_BotTab
IRShieldSideY_BotTab.Material al6061
IRShieldSideY_BotTab.Visibility 1
IRShieldSideY_BotTab.Color 15
IRShieldSideY_BotTab.Shape BRIK {0.5*IRShieldX} IRShieldSideX_TopTabX {.5*IRShieldThickness}

IRShieldSideY_BotTab.Copy IRShieldSideY_BotTabNegY
#IRShieldSideY_BotTabNegY.Position {0.0} {- 0.5*IRShieldY - 0.5 * IRShieldThickness+IRShieldSideX_TopTabX} {-(IRShieldPosZ + IRShieldZ -IRShieldThickness+3*DHB_HalfHeight)}
IRShieldSideY_BotTabNegY.Position {0.0} {- 0.5*IRShieldY - 0.5 * IRShieldThickness+IRShieldSideX_TopTabX} {(ColdfingerBasePosZ-DHB_HalfHeight- 0.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideY_BotTabNegY.Mother Cryostat_Interior

IRShieldSideY_BotTab.Copy IRShieldSideY_BotTabPosY
IRShieldSideY_BotTabPosY.Position {0.0} {0.5*IRShieldY + 0.5 * IRShieldThickness - IRShieldSideX_TopTabX} {(ColdfingerBasePosZ-DHB_HalfHeight- 0.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldSideY_BotTabPosY.Mother Cryostat_Interior



# Bottom IR shield with the holes

# We make it 3 times, for the Au & Ni strike too

For X 3 1 1
Shape BRIK IRShieldBottom_Block_%X
IRShieldBottom_Block_%X.Parameters { 0.5*IRShieldX } { 0.5 * IRShieldY } {0.5 * IRShieldThickness }

Shape TUBS IRShieldBot_CentHole_%X
IRShieldBot_CentHole_%X.Parameters 0.0 IRShieldBot_CentHoleRad {IRShieldThickness +0.1} 0.0 360.0
Orientation IRShieldBot_CentHoleOri_%X
IRShieldBot_CentHoleOri_%X.Position 0.0 0.0 0.0

Shape SUBTRACTION IRShieldBotBlockMinusCentHole_%X
IRShieldBotBlockMinusCentHole_%X.Parameters IRShieldBottom_Block_%X IRShieldBot_CentHole_%X IRShieldBot_CentHoleOri_%X

#Now the four smaller holes
Shape TUBS IRShieldBot_Hole1_%X
IRShieldBot_Hole1_%X.Parameters 0.0 IRShieldBot_CircsRad {IRShieldThickness +0.1} 0.0 360.0

Orientation IRShieldBot_Hole1Ori_%X
IRShieldBot_Hole1Ori_%X.Position {0.5*IRShieldX-4.6235} {0.0} {0.0}

Shape SUBTRACTION IRShieldBotBlockMinusCircHole1_%X
IRShieldBotBlockMinusCircHole1_%X.Parameters IRShieldBotBlockMinusCentHole_%X IRShieldBot_Hole1_%X IRShieldBot_Hole1Ori_%X

Orientation IRShieldBot_Hole2Ori_%X
IRShieldBot_Hole2Ori_%X.Position {-0.5*IRShieldX+4.6235} {0.0} {0.0}

Shape SUBTRACTION IRShieldBotBlockMinusCircHole2_%X
IRShieldBotBlockMinusCircHole2_%X.Parameters IRShieldBotBlockMinusCircHole1_%X IRShieldBot_Hole1_%X IRShieldBot_Hole2Ori_%X

Orientation IRShieldBot_Hole3Ori_%X
IRShieldBot_Hole3Ori_%X.Position {0.0} {-0.5*IRShieldY+2.841} {0.0}

Shape SUBTRACTION IRShieldBotBlockMinusCircHole3_%X
IRShieldBotBlockMinusCircHole3_%X.Parameters IRShieldBotBlockMinusCircHole2_%X IRShieldBot_Hole1_%X IRShieldBot_Hole3Ori_%X

Orientation IRShieldBot_Hole4Ori_%X
IRShieldBot_Hole4Ori_%X.Position {0.0} {0.5*IRShieldY-2.841} {0.0}

Shape SUBTRACTION IRShieldBotBlockMinusCircHole4_%X
IRShieldBotBlockMinusCircHole4_%X.Parameters IRShieldBotBlockMinusCircHole3_%X IRShieldBot_Hole1_%X IRShieldBot_Hole4Ori_%X

#Now the rectangular hole
Shape BRIK IRShieldBot_Rec_%X
IRShieldBot_Rec_%X.Parameters .7935 3.175 {0.5 * IRShieldThickness+.1}
Orientation IRShieldBot_RecOri_%X
IRShieldBot_RecOri_%X.Position {0.5*IRShieldY-2.286-3.175} {0.5*IRShieldX-.7935-6.766} {0.0}

Shape SUBTRACTION IRShieldBotBlockMinusRecHole_%X
IRShieldBotBlockMinusRecHole_%X.Parameters IRShieldBotBlockMinusCircHole4_%X IRShieldBot_Rec_%X IRShieldBot_RecOri_%X

Done

Volume IRShieldBottom
IRShieldBottom.Visibility 1
IRShieldBottom.Material al6061
IRShieldBottom.Color 2
IRShieldBottom.Shape IRShieldBotBlockMinusRecHole_1
#IRShieldBottom.Position 0 0 {(ColdfingerBasePosZ+DHB_HalfHeight+0.5 * IRShieldThickness)}
IRShieldBottom.Position 0 0 {(ColdfingerBasePosZ-DHB_HalfHeight- 1.5*IRShieldThickness)-CryoLidZ-0.5*CryostatXYFullThickness}
IRShieldBottom.Mother Cryostat_Interior

Volume IRShieldBottomNi
IRShieldBottomNi.Visibility 1
IRShieldBottomNi.Material Nickel
IRShieldBottomNi.Color 6
IRShieldBottomNi.Shape IRShieldBotBlockMinusRecHole_2
IRShieldBottomNi.Scale { 2* Ni_Strike_AverageThickness / IRShieldThickness } Z
IRShieldBottomNi.Position 0 0 {(ColdfingerBasePosZ-DHB_HalfHeight- 1.0*IRShieldThickness)-CryoLidZ-0.5*CryostatXYFullThickness + Ni_Strike_AverageThickness}
IRShieldBottomNi.Mother Cryostat_Interior


Volume IRShieldBottomAu
IRShieldBottomAu.Visibility 1
IRShieldBottomAu.Material gold
IRShieldBottomAu.Color 3
IRShieldBottomAu.Shape IRShieldBotBlockMinusRecHole_3
IRShieldBottomAu.Scale { 2* Au_Strike_AverageThickness / IRShieldThickness } Z
IRShieldBottomAu.Position 0 0 {(ColdfingerBasePosZ-DHB_HalfHeight- 1.0*IRShieldThickness)-CryoLidZ-0.5*CryostatXYFullThickness + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness}
IRShieldBottomAu.Mother Cryostat_Interior







# IR Shield Top

# We make it 3 times, for the Au & Ni strike too

For X 3 1 1

Shape BRIK IRShieldTopBlock_%X
IRShieldTopBlock_%X.Parameters { 0.5*IRShieldX } { 0.5 * IRShieldY } { 0.5 * IRShieldThickness }

Shape Brik IRShieldTopHole_%X
IRShieldTopHole_%X.Parameters {.1971*IRShieldX} {0.1931*IRShieldY} {0.5 * IRShieldThickness+ .1}
Orientation IRShieldTopHole1Ori_%X
IRShieldTopHole1Ori_%X.Position {.5*IRShieldX-0.1971*IRShieldX-2.127} {0.5 * IRShieldY-.1931*IRShieldY-1.98} {0.0}

Shape Subtraction IRShieldTopMinusHole1_%X
IRShieldTopMinusHole1_%X.Parameters IRShieldTopBlock_%X IRShieldTopHole_%X IRShieldTopHole1Ori_%X

Orientation IRShieldTopHole2Ori_%X
IRShieldTopHole2Ori_%X.Position {.5*IRShieldX-0.1971*IRShieldX-2.127} {-0.5 * IRShieldY+.1931*IRShieldY+1.98} {0.0}

Shape Subtraction IRShieldTopMinusHole2_%X
IRShieldTopMinusHole2_%X.Parameters IRShieldTopMinusHole1_%X IRShieldTopHole_%X IRShieldTopHole2Ori_%X

Orientation IRShieldTopHole3Ori_%X
IRShieldTopHole3Ori_%X.Position {-.5*IRShieldX+0.1971*IRShieldX+2.127} {0.5 * IRShieldY-.1931*IRShieldY-1.98} {0.0}

Shape Subtraction IRShieldTopMinusHole3_%X
IRShieldTopMinusHole3_%X.Parameters IRShieldTopMinusHole2_%X IRShieldTopHole_%X IRShieldTopHole3Ori_%X

Orientation IRShieldTopHole4Ori_%X
IRShieldTopHole4Ori_%X.Position {-.5*IRShieldX+0.1971*IRShieldX+2.127} {-0.5 * IRShieldY+.1931*IRShieldY+1.98} {0.0}

Shape Subtraction IRShieldTopMinusHole4_%X
IRShieldTopMinusHole4_%X.Parameters IRShieldTopMinusHole3_%X IRShieldTopHole_%X IRShieldTopHole4Ori_%X

Done


Volume IRShieldTop
IRShieldTop.Visibility 1
IRShieldTop.Material IRShieldMaterial
IRShieldTop.Color 2
IRShieldTop.Shape IRShieldTopMinusHole4_1
IRShieldTop.Position 0 0 {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+1.5*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness}
IRShieldTop.Mother Cryostat_Interior

Volume IRShieldTopNi
IRShieldTopNi.Visibility 1
IRShieldTopNi.Material Nickel
IRShieldTopNi.Color 6
IRShieldTopNi.Shape IRShieldTopMinusHole4_2
IRShieldTopNi.Scale { 2* Ni_Strike_AverageThickness / IRShieldThickness } Z
IRShieldTopNi.Position 0 0 {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+2.0*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness + Ni_Strike_AverageThickness}
IRShieldTopNi.Mother Cryostat_Interior

Volume IRShieldTopAu
IRShieldTopAu.Visibility 1
IRShieldTopAu.Material gold
IRShieldTopAu.Color 6
IRShieldTopAu.Shape IRShieldTopMinusHole4_3
IRShieldTopAu.Scale { 2* Au_Strike_AverageThickness / IRShieldThickness } Z
IRShieldTopAu.Position 0 0 {(ColdfingerBasePosZ-DHB_HalfHeight+IRShieldZ+2.0*IRShieldThickness)-CryoLidZ+0.5*CryostatXYFullThickness + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness}
IRShieldTopAu.Mother Cryostat_Interior


Constant IRShieldTopGapXY { 0.5 * 1.27 }
Constant IRShieldTopHoleSizeX  10.28
Constant IRShieldTopHoleSizeY   8.44 


#Volume IRShieldTopHole
#IRShieldTopHole.Visibility 0
#IRShieldTopHole.Material IRShieldMaterial
#IRShieldTopHole.Color 2
#IRShieldTopHole.Shape Box { 0.5*IRShieldTopHoleSizeX } { 0.5 * IRShieldTopHoleSizeY } { 0.5 * IRShieldThickness }

#IRShieldTopHole.Copy IRShieldTopHoleXPlusYPlus
#IRShieldTopHoleXPlusYPlus.Position { 0.5*IRShieldTopHoleSizeX + IRShieldTopGapXY } { 0.5*IRShieldTopHoleSizeY + IRShieldTopGapXY } 0
#IRShieldTopHoleXPlusYPlus.Mother IRShieldTop

#IRShieldTopHole.Copy IRShieldTopHoleXPlusYMinus
#IRShieldTopHoleXPlusYMinus.Position { 0.5*IRShieldTopHoleSizeX + IRShieldTopGapXY } { -0.5*IRShieldTopHoleSizeY - IRShieldTopGapXY } 0
#IRShieldTopHoleXPlusYMinus.Mother IRShieldTop

#IRShieldTopHole.Copy IRShieldTopHoleXMinusYPlus
#IRShieldTopHoleXMinusYPlus.Position { - 0.5*IRShieldTopHoleSizeX - IRShieldTopGapXY } { 0.5*IRShieldTopHoleSizeY + IRShieldTopGapXY } 0
#IRShieldTopHoleXMinusYPlus.Mother IRShieldTop

#IRShieldTopHole.Copy IRShieldTopHoleXMinusYMinus
#IRShieldTopHoleXMinusYMinus.Position { - 0.5*IRShieldTopHoleSizeX - IRShieldTopGapXY } { -0.5*IRShieldTopHoleSizeY - IRShieldTopGapXY } 0
#IRShieldTopHoleXMinusYMinus.Mother IRShieldTop



# Adding in Outer IR Shields

Volume OuterIRShieldSidePosY
OuterIRShieldSidePosY.Material al6061
OuterIRShieldSidePosY.Visibility 1
OuterIRShieldSidePosY.Color 15
OuterIRShieldSidePosY.Shape Brik {.5*OuterIRShieldX} {0.5*IRShieldOuterSideThicknessY} {.5*OuterIRShieldZ}
OuterIRShieldSidePosY.Position  0 { 0.5*OuterIRShieldY-0.5*IRShieldOuterSideThicknessY} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSidePosY.Mother Cryostat_Interior

#Nickel Strike on Outer IR Shield Y
Volume OuterIRShieldSidePosY_Ni
OuterIRShieldSidePosY_Ni.Material Nickel
OuterIRShieldSidePosY_Ni.Visibility 1
OuterIRShieldSidePosY_Ni.Color 6
OuterIRShieldSidePosY_Ni.Shape BRIK {.5*OuterIRShieldX} { Ni_Strike_AverageThickness } {.5*OuterIRShieldZ}
OuterIRShieldSidePosY_Ni.Position  0 { 0.5*OuterIRShieldY + Ni_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSidePosY_Ni.Mother Cryostat_Interior

#Nickel Strike on Outer IR Shield Y
Volume OuterIRShieldSidePosY_Au
OuterIRShieldSidePosY_Au.Material gold
OuterIRShieldSidePosY_Au.Visibility 1
OuterIRShieldSidePosY_Au.Color 6
OuterIRShieldSidePosY_Au.Shape BRIK {.5*OuterIRShieldX} { Au_Strike_AverageThickness} {.5*OuterIRShieldZ}
OuterIRShieldSidePosY_Au.Position  0 { 0.5*OuterIRShieldY + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSidePosY_Au.Mother Cryostat_Interior


Volume OuterIRShieldSideNegY
OuterIRShieldSideNegY.Material al6061
OuterIRShieldSideNegY.Visibility 1
OuterIRShieldSideNegY.Color 15
OuterIRShieldSideNegY.Shape Brik {.5*OuterIRShieldX} {.5*IRShieldOuterSideThicknessY} {.5*OuterIRShieldZ}
OuterIRShieldSideNegY.Position  {0.0} {- 0.5*OuterIRShieldY + 0.5 * IRShieldOuterSideThicknessY} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSideNegY.Rotation 0.0 0.0 180.0
OuterIRShieldSideNegY.Mother Cryostat_Interior


Volume OuterIRShieldSideNegY_Ni
OuterIRShieldSideNegY_Ni.Material Nickel
OuterIRShieldSideNegY_Ni.Visibility 1
OuterIRShieldSideNegY_Ni.Color 6
OuterIRShieldSideNegY_Ni.Shape BRIK {.5*OuterIRShieldX} {Ni_Strike_AverageThickness} {.5*OuterIRShieldZ}
OuterIRShieldSideNegY_Ni.Position  0 { -0.5*OuterIRShieldY - Ni_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSideNegY_Ni.Mother Cryostat_Interior


Volume OuterIRShieldSideNegY_Au
OuterIRShieldSideNegY_Au.Material gold
OuterIRShieldSideNegY_Au.Visibility 1
OuterIRShieldSideNegY_Au.Color 6
OuterIRShieldSideNegY_Au.Shape BRIK {.5*OuterIRShieldX} {Au_Strike_AverageThickness} {.5*OuterIRShieldZ}
OuterIRShieldSideNegY_Au.Position  0 { -0.5*OuterIRShieldY - 2*Ni_Strike_AverageThickness - Au_Strike_AverageThickness} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSideNegY_Au.Mother Cryostat_Interior




#Outer shield on the X sides
Volume OuterIRShieldSidePosX
OuterIRShieldSidePosX.Material al6061
OuterIRShieldSidePosX.Visibility 1
OuterIRShieldSidePosX.Color 15
OuterIRShieldSidePosX.Shape BRIK {.5*IRShieldOuterSideThicknessX} {.5*OuterIRShieldY} {.5*OuterIRShieldZ}
#OuterIRShieldSidePosX.Rotation 0.0 0.0 180.0
OuterIRShieldSidePosX.Position {0.5*OuterIRShieldX + 0.5*IRShieldOuterSideThicknessX} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSidePosX.Mother Cryostat_Interior

#Nickel Strike on Outer IR Shield X
Volume OuterIRShieldSidePosX_Ni
OuterIRShieldSidePosX_Ni.Material Nickel
OuterIRShieldSidePosX_Ni.Visibility 1
OuterIRShieldSidePosX_Ni.Color 6
OuterIRShieldSidePosX_Ni.Shape BRIK {Ni_Strike_AverageThickness} {.5*OuterIRShieldY} {.5*OuterIRShieldZ}
OuterIRShieldSidePosX_Ni.Position { 0.5*OuterIRShieldX + IRShieldOuterSideThicknessX + Ni_Strike_AverageThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSidePosX_Ni.Mother Cryostat_Interior

Volume OuterIRShieldSidePosX_Au
OuterIRShieldSidePosX_Au.Material gold
OuterIRShieldSidePosX_Au.Visibility 1
OuterIRShieldSidePosX_Au.Color 6
OuterIRShieldSidePosX_Au.Shape BRIK {Au_Strike_AverageThickness} {.5*OuterIRShieldY} {.5*OuterIRShieldZ}
OuterIRShieldSidePosX_Au.Position { 0.5*OuterIRShieldX + IRShieldOuterSideThicknessX + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSidePosX_Au.Mother Cryostat_Interior



Volume OuterIRShieldSideNegX
OuterIRShieldSideNegX.Material al6061
OuterIRShieldSideNegX.Visibility 1
OuterIRShieldSideNegX.Color 15
OuterIRShieldSideNegX.Shape BRIK {.5*IRShieldOuterSideThicknessX} {.5*OuterIRShieldY} {.5*OuterIRShieldZ}
OuterIRShieldSideNegX.Position {- 0.5*OuterIRShieldX - 0.5*IRShieldOuterSideThicknessX} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSideNegX.Mother Cryostat_Interior


Volume OuterIRShieldSideNegX_Ni
OuterIRShieldSideNegX_Ni.Material Nickel
OuterIRShieldSideNegX_Ni.Visibility 1
OuterIRShieldSideNegX_Ni.Color 6
OuterIRShieldSideNegX_Ni.Shape BRIK {Ni_Strike_AverageThickness} {.5*OuterIRShieldY} {.5*OuterIRShieldZ}
OuterIRShieldSideNegX_Ni.Position {-0.5*OuterIRShieldX - IRShieldOuterSideThicknessX - Ni_Strike_AverageThickness} {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSideNegX_Ni.Mother Cryostat_Interior


Volume OuterIRShieldSideNegX_Au
OuterIRShieldSideNegX_Au.Material gold
OuterIRShieldSideNegX_Au.Visibility 1
OuterIRShieldSideNegX_Au.Color 6
OuterIRShieldSideNegX_Au.Shape BRIK {Au_Strike_AverageThickness} {.5*OuterIRShieldY} {.5*OuterIRShieldZ}
OuterIRShieldSideNegX_Au.Position {-0.5*OuterIRShieldX - IRShieldOuterSideThicknessX - 2*Ni_Strike_AverageThickness - Au_Strike_AverageThickness } {0.0} {(ColdfingerBasePosZ-DHB_HalfHeight+.5*IRShieldZ)-CryoLidZ+0.5*CryostatXYFullThickness}
OuterIRShieldSideNegX_Au.Mother Cryostat_Interior



# Outer IR Shield top

For X 3 1 1
Shape BRIK OuterIRShieldTopBlock_%X
OuterIRShieldTopBlock_%X.Parameters { 0.5*OuterIRShieldX } { 0.5 * OuterIRShieldY } { IRShieldOuterTopHalfThickness }

Shape Brik OuterIRShieldTopHole_%X
OuterIRShieldTopHole_%X.Parameters {0.5*10.761} {0.5*8.89} {0.5 * IRShieldThickness+ .1}

Orientation OuterIRShieldTopHole1Ori_%X
OuterIRShieldTopHole1Ori_%X.Position {(.5*IRShieldX-0.1971*IRShieldX-2.127)} {0.5 * IRShieldY-.1931*IRShieldY-1.98} {0.0}

Shape Subtraction OuterIRShieldTopMinusHole1_%X
OuterIRShieldTopMinusHole1_%X.Parameters OuterIRShieldTopBlock_%X OuterIRShieldTopHole_%X OuterIRShieldTopHole1Ori_%X

Orientation OuterIRShieldTopHole2Ori_%X
OuterIRShieldTopHole2Ori_%X.Position {.5*IRShieldX-0.1971*IRShieldX-2.127} {-0.5 * IRShieldY+.1931*IRShieldY+1.98} {0.0}

Shape Subtraction OuterIRShieldTopMinusHole2_%X
OuterIRShieldTopMinusHole2_%X.Parameters OuterIRShieldTopMinusHole1_%X OuterIRShieldTopHole_%X OuterIRShieldTopHole2Ori_%X

Orientation OuterIRShieldTopHole3Ori_%X
OuterIRShieldTopHole3Ori_%X.Position {-.5*IRShieldX+0.1971*IRShieldX+2.127} {0.5 * IRShieldY-.1931*IRShieldY-1.98} {0.0}

Shape Subtraction OuterIRShieldTopMinusHole3_%X
OuterIRShieldTopMinusHole3_%X.Parameters OuterIRShieldTopMinusHole2_%X OuterIRShieldTopHole_%X OuterIRShieldTopHole3Ori_%X

Orientation OuterIRShieldTopHole4Ori_%X
OuterIRShieldTopHole4Ori_%X.Position {-.5*IRShieldX+0.1971*IRShieldX+2.127} {-0.5 * IRShieldY+.1931*IRShieldY+1.98} {0.0}

Shape Subtraction OuterIRShieldTopMinusHole4_%X
OuterIRShieldTopMinusHole4_%X.Parameters OuterIRShieldTopMinusHole3_%X OuterIRShieldTopHole_%X OuterIRShieldTopHole4Ori_%X
Done

Volume OuterIRShieldTopAl
OuterIRShieldTopAl.Visibility 1
OuterIRShieldTopAl.Material al6061
OuterIRShieldTopAl.Color 12
OuterIRShieldTopAl.Shape OuterIRShieldTopMinusHole4_1
OuterIRShieldTopAl.Position 0 0 {(ColdfingerBasePosZ - DHB_HalfHeight + 0.5*IRShieldZ) - CryoLidZ + 0.5*CryostatXYFullThickness + 0.5*OuterIRShieldZ + IRShieldOuterTopHalfThickness }
OuterIRShieldTopAl.Mother Cryostat_Interior

Volume OuterIRShieldTopNi
OuterIRShieldTopNi.Visibility 1
OuterIRShieldTopNi.Material Nickel
OuterIRShieldTopNi.Color 12
OuterIRShieldTopNi.Shape OuterIRShieldTopMinusHole4_2
OuterIRShieldTopNi.Scale { Ni_Strike_AverageThickness / IRShieldOuterTopHalfThickness} Z
OuterIRShieldTopNi.Position 0 0 {(ColdfingerBasePosZ - DHB_HalfHeight + 0.5*IRShieldZ) - CryoLidZ +  0.5*CryostatXYFullThickness + 0.5*OuterIRShieldZ + 2*IRShieldOuterTopHalfThickness + Ni_Strike_AverageThickness }
OuterIRShieldTopNi.Mother Cryostat_Interior

Volume OuterIRShieldTopAu
OuterIRShieldTopAu.Visibility 1
OuterIRShieldTopAu.Material gold
OuterIRShieldTopAu.Color 12
OuterIRShieldTopAu.Shape OuterIRShieldTopMinusHole4_3
OuterIRShieldTopAu.Scale { Au_Strike_AverageThickness / IRShieldOuterTopHalfThickness} Z
OuterIRShieldTopAu.Position 0 0 {(ColdfingerBasePosZ - DHB_HalfHeight + 0.5*IRShieldZ)-CryoLidZ + 0.5*CryostatXYFullThickness + 0.5*OuterIRShieldZ + 2*IRShieldOuterTopHalfThickness + 2*Ni_Strike_AverageThickness + Au_Strike_AverageThickness }
OuterIRShieldTopAu.Mother Cryostat_Interior







For X 3 1 1
Shape BRIK OuterIRShieldBottom_Block_%X
OuterIRShieldBottom_Block_%X.Parameters { 0.5*OuterIRShieldX } { 0.5 * OuterIRShieldY } {0.5*IRShieldOuterBottomFullThickness}

Shape TUBS OuterIRShieldBot_CentHole_%X
OuterIRShieldBot_CentHole_%X.Parameters 0.0 IRShieldBot_CentHoleRad {IRShieldThickness +0.1} 0.0 360.0

Orientation OuterIRShieldBot_CentHoleOri_%X
OuterIRShieldBot_CentHoleOri_%X.Position 0.0 0.0 0.0

Shape SUBTRACTION OuterIRShieldBotBlockMinusCentHole_%X
OuterIRShieldBotBlockMinusCentHole_%X.Parameters OuterIRShieldBottom_Block_%X OuterIRShieldBot_CentHole_%X OuterIRShieldBot_CentHoleOri_%X

#Now the four smaller holes
Shape TUBS OuterIRShieldBot_Hole1_%X
OuterIRShieldBot_Hole1_%X.Parameters 0.0 IRShieldBot_CircsRad {IRShieldThickness +0.1} 0.0 360.0
Orientation OuterIRShieldBot_Hole1Ori_%X
OuterIRShieldBot_Hole1Ori_%X.Position {0.5*IRShieldX-4.6235} {0.0} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusCircHole1_%X
OuterIRShieldBotBlockMinusCircHole1_%X.Parameters OuterIRShieldBotBlockMinusCentHole_%X OuterIRShieldBot_Hole1_%X OuterIRShieldBot_Hole1Ori_%X

Orientation OuterIRShieldBot_Hole2Ori_%X
OuterIRShieldBot_Hole2Ori_%X.Position {-0.5*IRShieldX+4.6235} {0.0} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusCircHole2_%X
OuterIRShieldBotBlockMinusCircHole2_%X.Parameters OuterIRShieldBotBlockMinusCircHole1_%X OuterIRShieldBot_Hole1_%X OuterIRShieldBot_Hole2Ori_%X

Orientation OuterIRShieldBot_Hole3Ori_%X
OuterIRShieldBot_Hole3Ori_%X.Position {0.0} {-0.5*IRShieldY+2.841} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusCircHole3_%X
OuterIRShieldBotBlockMinusCircHole3_%X.Parameters OuterIRShieldBotBlockMinusCircHole2_%X OuterIRShieldBot_Hole1_%X OuterIRShieldBot_Hole3Ori_%X

Orientation OuterIRShieldBot_Hole4Ori_%X
OuterIRShieldBot_Hole4Ori_%X.Position {0.0} {0.5*IRShieldY-2.841} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusCircHole4_%X
OuterIRShieldBotBlockMinusCircHole4_%X.Parameters OuterIRShieldBotBlockMinusCircHole3_%X OuterIRShieldBot_Hole1_%X OuterIRShieldBot_Hole4Ori_%X

#Now the rectangular hole
Shape BRIK OuterIRShieldBot_Rec_%X
OuterIRShieldBot_Rec_%X.Parameters .7935 3.175 {0.5 * IRShieldThickness+.1}
Orientation OuterIRShieldBot_RecOri_%X
OuterIRShieldBot_RecOri_%X.Position {0.5*IRShieldY-2.286-3.175} {0.5*IRShieldX-.7935-6.766} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusRecHole_%X
OuterIRShieldBotBlockMinusRecHole_%X.Parameters OuterIRShieldBotBlockMinusCircHole4_%X OuterIRShieldBot_Rec_%X OuterIRShieldBot_RecOri_%X

#rectangular cutouts for the flexures
Shape BRIK OuterIRShieldBot_Rec2_%X
OuterIRShieldBot_Rec2_%X.Parameters {1.7} {3*0.246} {0.5 * IRShieldThickness+.1}
Orientation OuterIRShieldBot_Rec2Ori_%X
#OuterIRShieldBot_Rec2Ori.Rotation 90 0 0
OuterIRShieldBot_Rec2Ori_%X.Position {0} {0.5*OuterIRShieldY-.446} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusRec2Hole_%X
OuterIRShieldBotBlockMinusRec2Hole_%X.Parameters OuterIRShieldBotBlockMinusRecHole_%X OuterIRShieldBot_Rec2_%X OuterIRShieldBot_Rec2Ori_%X

Shape BRIK OuterIRShieldBot_Rec3_%X
OuterIRShieldBot_Rec3_%X.Parameters {1.7} {3*0.246} {0.5 * IRShieldThickness+.1}
Orientation OuterIRShieldBot_Rec3Ori_%X
#OuterIRShieldBot_Rec2Ori_%X.Rotation 90 0 0
OuterIRShieldBot_Rec3Ori_%X.Position {0} {-0.5*OuterIRShieldY+.446} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusRec3Hole_%X
OuterIRShieldBotBlockMinusRec3Hole_%X.Parameters OuterIRShieldBotBlockMinusRec2Hole_%X OuterIRShieldBot_Rec3_%X OuterIRShieldBot_Rec3Ori_%X

Shape BRIK OuterIRShieldBot_Rec4_%X
OuterIRShieldBot_Rec4_%X.Parameters  {3*0.246} {1.7} {0.5 * IRShieldThickness+.1}
Orientation OuterIRShieldBot_Rec4Ori_%X
#OuterIRShieldBot_Rec4Ori_%X.Rotation 0 0 90
OuterIRShieldBot_Rec4Ori_%X.Position {-0.5*OuterIRShieldX+.756} {0.0} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusRec4Hole_%X
OuterIRShieldBotBlockMinusRec4Hole_%X.Parameters OuterIRShieldBotBlockMinusRec3Hole_%X OuterIRShieldBot_Rec4_%X OuterIRShieldBot_Rec4Ori_%X

Shape BRIK OuterIRShieldBot_Rec5_%X
OuterIRShieldBot_Rec5_%X.Parameters  {3*0.246} {1.7} {0.5 * IRShieldThickness+.1}

Orientation OuterIRShieldBot_Rec5Ori_%X
#OuterIRShieldBot_Rec5Ori_%X.Rotation 0 0 90
OuterIRShieldBot_Rec5Ori_%X.Position {0.5*OuterIRShieldX-.756} {0.0} {0.0}

Shape SUBTRACTION OuterIRShieldBotBlockMinusRec5Hole_%X
OuterIRShieldBotBlockMinusRec5Hole_%X.Parameters OuterIRShieldBotBlockMinusRec4Hole_%X OuterIRShieldBot_Rec5_%X OuterIRShieldBot_Rec5Ori_%X
Done

Volume OuterIRShieldBot
OuterIRShieldBot.Visibility 1
OuterIRShieldBot.Material al6061
OuterIRShieldBot.Color 12
OuterIRShieldBot.Shape OuterIRShieldBotBlockMinusRec5Hole_1
OuterIRShieldBot.Position 0 0 {(ColdfingerBasePosZ-1.5*IRShieldThickness)-0.5*CryostatXYFullThickness-OuterIRShieldX + IRShieldX}
OuterIRShieldBot.Mother Cryostat_Interior

Volume OuterIRShieldBotNi
OuterIRShieldBotNi.Visibility 1
OuterIRShieldBotNi.Material Nickel
OuterIRShieldBotNi.Color 6
OuterIRShieldBotNi.Shape OuterIRShieldBotBlockMinusRec5Hole_2
OuterIRShieldBotNi.Scale { 2*Ni_Strike_AverageThickness / IRShieldOuterBottomFullThickness} Z
OuterIRShieldBotNi.Position 0 0 {(ColdfingerBasePosZ-1.5*IRShieldThickness)-0.5*CryostatXYFullThickness-OuterIRShieldX + IRShieldX - 0.5*IRShieldOuterBottomFullThickness - Ni_Strike_AverageThickness }
OuterIRShieldBotNi.Mother Cryostat_Interior

Volume OuterIRShieldBotAu
OuterIRShieldBotAu.Visibility 1
OuterIRShieldBotAu.Material gold
OuterIRShieldBotAu.Color 7
OuterIRShieldBotAu.Shape OuterIRShieldBotBlockMinusRec5Hole_3
OuterIRShieldBotAu.Scale { 2*Au_Strike_AverageThickness / IRShieldOuterBottomFullThickness} Z
OuterIRShieldBotAu.Position 0 0 {(ColdfingerBasePosZ-1.5*IRShieldThickness)-0.5*CryostatXYFullThickness-OuterIRShieldX + IRShieldX - 0.5*IRShieldOuterBottomFullThickness - 2*Ni_Strike_AverageThickness - Au_Strike_AverageThickness}
OuterIRShieldBotAu.Mother Cryostat_Interior



# Flexure Towers

Volume FlexureTower
FlexureTower.Material al6061
FlexureTower.Visibility 1
FlexureTower.Color 51
FlexureTower.Shape BRIK 1.4 0.246 5.375

FlexureTower.Copy FlexureTower1
FlexureTower1.Position 0.0 {CryoBaseStageY-0.246-2} {-(CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness)+5.375}
FlexureTower1.Mother Cryostat_Interior

FlexureTower.Copy FlexureTower2
FlexureTower2.Position 0.0 {-CryoBaseStageY+0.246+2} {-(CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness)+5.375}
FlexureTower2.Mother Cryostat_Interior

Volume Flexure
Flexure.Material ti_5
Flexure.Visibility 1
Vlexure.Color 53
Flexure.Shape TUBE 0.0 2.125 {.315/2} 0.0 360.0

Flexure.Copy Flexure1
Flexure1.Rotation 90.0 0.0 0.0
Flexure1.Position 0.0 {CryoBaseStageY-0.246-2} {-(CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness)+2*5.375+2.125}
Flexure1.Mother Cryostat_Interior

Flexure.Copy Flexure2
Flexure2.Rotation 90.0 0.0 0.0
Flexure2.Position 0.0 {-CryoBaseStageY+0.246+2} {-(CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness)+2*5.375+2.125}
Flexure2.Mother Cryostat_Interior

Flexure.Copy Flexure3
Flexure3.Rotation 90.0 0.0 90.0
Flexure3.Position {-CryoBaseStageX+0.246+2.5} 0.0 {-(CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness)+2.125}
Flexure3.Mother Cryostat_Interior


Flexure.Copy Flexure4
Flexure4.Rotation 90.0 0.0 90.0
Flexure4.Position {CryoBaseStageX-0.246-2.5} 0.0 {-(CryostatOuterZ+CryoLidZ-0.5*CryostatXYFullThickness)+2.125}
Flexure4.Mother Cryostat_Interior


#moved the Ribbon Cable Guards to the ACS model


