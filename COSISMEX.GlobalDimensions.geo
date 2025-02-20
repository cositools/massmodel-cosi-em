# This file contains all GLOBAL dimensions important beyond individual sub-directories

#######################################################
# Cryostat

Constant SCSideEffectiveThickness 0.89
Constant SCHeight  46.3
Constant SCRadius  {50.8}

Constant OuterRadius { (SCRadius+SCSideEffectiveThickness) / cos(30*TMath::DegToRad()) } 

#######################################################
# Cryostat

# Fillers
# Defined this as the distance between the IRShield and the inner cryostat wall
# AJ - 4/30/23 Don't know the exact dimension for this, need to verify it and can then use it to define the cryostat distance. Assuming the cryostat outer wall and the IRshields are the right dimensions, it should be 3.4075
Constant CryostatXSpiel 2.195
Constant CryostatYSpiel 2.195
Constant CryostatZSpiel 0.1

# Exact
Constant CryostatXYFullThickness 0.158
# Exact
Constant CryostatZTopFullThickness 0.317
# Guesstimated
Constant CryostatZBottomFullThickness 1.651

# unsure of CryostatXSpiel dimension so I'm doing the cryostat dimensions based off what I know they should be
# Current 4/24/23 - Should be 33.02 / 2
#Constant CryostatOuterX { 0.5 * IRShieldX + CryostatXSpiel + CryostatXYFullThickness }
Constant CryostatOuterX { 33.02/2 }
# Current 4/24/23 - Should be: 29.451 / 2
#Constant CryostatOuterY { 0.5 * IRShieldY + CryostatYSpiel + CryostatXYFullThickness }
Constant CryostatOuterY { 29.451/2 }
# Current 4/24/23 - Should be 16.51 / 2
Constant CryostatOuterZ  { ( 16.192 + CryostatZTopFullThickness) / 2.0 }

# Cryostat baseplate
# Don't have the final cryostat design yet so these dimensions can't be directly tied to anything
# these are half dimensions
Constant CryoBaseX 22.86
Constant CryoBaseY 21.082
Constant CryoBaseZ 0.3175


Constant CryoLidZ 1.2075

#This is the lifted part on the cryostat base which makes up the bottom of the cryostat
# This is half dimensions
Constant CryoBaseStageX CryostatOuterX
Constant CryoBaseStageY CryostatOuterY
Constant CryoBaseStageZ 0.8255


#Echo "Cryostat Outer X (16.9): CryostatOuterX"
#Echo "Cryostat Outer Y (15.1): CryostatOuterY"
#Echo "Cryostat Outer Z (9): CryostatOuterZ"

Constant BaseFill 0.0   // this was 1.5 for v1 with bottom electr.

Constant Cryostat_Interior_Halfheight { CryostatOuterZ - 0.5*(CryostatZTopFullThickness+CryostatZBottomFullThickness) }

Constant CryostatZPos { ShieldedHeight - 0.5*BGOWallFullThicknessTop - CryostatOuterZ }
Echo "Cryo Z: CryostatZPos"

#nickle strike thickness in the cryostat/throughout
Constant Ni_Strike_Thick .0005


#######################################################
# Detectors

Constant NLayers 4

Constant allDetX {2*5.3025 + 0.05}
Constant allDetY {2*0.4 + 2*4.791 + 0.05}
Constant allDetZ {NLayers * 2.54 * 0.5}

#Constant DetX {5.3025 - .6535}
Constant DetX {5.3025 - 0.53}
#Constant DetY {4.791 + 0.1035}
Constant DetY {4.791 + 0.474}

# Exact: 4.4
Constant DetXHalfGap { 1.4 + 0.5* ColdfingerDepth }
# Exact: 0.9
Constant DetYHalfGap 0.45

Echo "Detector X gap (2.2): DetXHalfGap"
Echo "Detector Y gap (0.45): DetYHalfGap"

#Checking detector positions
#original:
#Constant DetZPos { ColdfingerBasePosZ + ColdfingerBaseHeight + 0.5*2.54 -1.0165-.698}
#The below should place the center of the detector bottom to be level with the cryobaseplate
#Constant DetZPos { (-CryostatOuterZ - CryoLidZ)}
#This should place the center of the detector volume to be at the center of the DHB frame
#Constant DetZPos { - CryoLidZ+ColdfingerBasePosZ+0.5*CryostatXYFullThickness}
#this should place it to the top of the DHB frame
#Constant DetZPos { - CryoLidZ+ColdfingerBasePosZ+0.5*CryostatXYFullThickness + DHB_HalfHeight}
#The center of the detector to the top of the DHB frame should be 1.15 cm
Constant DetZPos { - CryoLidZ+ColdfingerBasePosZ+0.5*CryostatXYFullThickness + DHB_HalfHeight+1.15}
Constant IngotRadius { 2* 2.54}
Constant DetectorHalfHeight 0.75
Constant DetectorHalfWidth 4.025
Constant GuardRingSize      0.3

#######################################################
# Detector Holder Base
Constant DHB_HalfWidth   {0.5*1.27}
#The side along x has a larger bigger width than the other side so I added another constant
Constant DHB_HalfWidth_AlongY   {0.5*0.635}
Constant DHB_HalfWidth_AlongX   {0.5*0.752}
Constant DHB_HalfHeight  {0.5*ColdfingerBaseHeight}
Constant DHB_IRShield_Gap  0.05
Constant DHB_CentStrucBase_HalfHeight 1.429
Constant DHB_CentStrucBase_HalfWidth 0.7935
Constant DHB_CentStrucArms_HalfHeight {5.1435-.0028}
Constant DHB_CentStrucArms_HalfLength 1.7465
Constant DHB_CentStrucArmsTabs_HalfHeight 1.397
Constant DHB_CentStrucArmsTabs_HalfLength 0.3745
Constant DHB_DetSidePost_HalfWidth 0.275
#The below dimension was just adjusted so that no overlaps would occur but should be around .34
Constant DHB_DetSidePost_HalfLength 0.04
Constant DHB_DetSidePost_HalfHeight 4.7435


#######################################################
# IRShield

Constant IRShieldMaterial al6061
#Not sure what IRShieldGapZ is so it has not been updated
Constant IRShieldGapZ 0.7
Constant IRShieldPosZ { -Cryostat_Interior_Halfheight + IRShieldGapZ }
Constant IRShieldThickness 0.0702
Constant IRShieldOuterSideThicknessX 0.11077
Constant IRShieldOuterSideThicknessY 0.0976
Constant IRShieldOuterTopHalfThickness 0.0754
Constant IRShieldOuterBottomFullThickness 0.092

#Constant IRShieldX  26.09 05/01
Constant IRShieldX  26.63
#Constant IRShieldY  22.382 05/01
Constant IRShieldY  22.9822
#Constant IRShieldZ  14.6 05/01
Constant IRShieldZ  13.072
Constant IRShieldHoleX 8.017
Constant IRShieldHoleZ 0.317
Constant IRShieldSideY_Hole1_Zpos 0.927
Constant IRShieldSideY_Zspace 2.223
Constant IRShieldSideY_Xpos 2.774
Constant IRShieldSideY_Hole2_Zpos 2.619
Constant IRShield_TopTabX 11.965
Constant IRShield_TopTabY 1.041
Constant IRShield_CircHole_Rad 0.7145
Constant IRShield_CircHole_ZPos 0.8545
Constant IRShield_RecHoleX 2.619
Constant IRShield_RecHoleZ 0.159
Constant IRShieldSideX_Xpos 2.514
Constant IRShieldX_CircHole_Zpos 0.0225
Constant IRShieldSideX_TopTabX 0.5205
Constant IRShieldSideX_TopTabY 10.16
Constant IRShieldSideY_TopTabX 5.868
Constant IRShieldSideX_BotTabX 0.977
Constant IRShieldSideY_BotTabX 13.275
Constant IRShieldBot_CentHoleRad 2.064
Constant IRShieldBot_CircsRad 0.7145
#Adding in the outer IR shields
Constant OuterIRShieldX 29.87
Constant OuterIRShieldY 26.32
Constant OuterIRShieldZ 15.25

#IR Side Shield Tabs on the IR shields along Y. The Y dimension will be the thickness of the IR shield
Constant IRShieldSideX 1.041
Constant IRShieldSideZ 12.596
#######################################################
# The cold finger


Constant ColdfingerDepth        1.6
#Constant ColdfingerSpireHeight 10.1
Constant ColdfingerSpireHeight 9.487
#Constant ColdfingerBaseHeight   3.3
Constant ColdfingerBaseHeight   2.032
Constant ColdfingerLength      20.9 
Constant ColdfingerSpireLength  3.5 

#Constant ColdfingerBasePosZ  { -Cryostat_Interior_Halfheight + IRShieldGapZ + IRShieldThickness }
# Constant ColdfingerBasePosZ  { -Cryostat_Interior_Halfheight + IRShieldGapZ + IRShieldThickness +1.2}
Constant ColdfingerBasePosZ  { -Cryostat_Interior_Halfheight + IRShieldGapZ + IRShieldThickness + 1.0165}


#######################################################
# Radiators

Constant LowerRadiatorHalfDepth    { 0.5 * 0.2 * 2.54 + 0.06 * 2.54 }
Constant LowerRadiatorHalfHeight   { 0.5 * 4.5 * 2.54 }
Constant RadiatorHalfWidth         { 0.5 * 11 * 2.54 }
Constant LowerRadiatorZPos         { DetZPos + 1.5*2.54 }

Constant UpperRadiatorHalfDepth    { 0.5 * 0.06 * 2.54 }
Constant UpperRadiatorHalfHeight   { 0.5 * ( 6.74 - 6.0 ) * 2.54 }
Constant UpperRadiatorZPos         { LowerRadiatorZPos + LowerRadiatorHalfHeight + UpperRadiatorHalfHeight }

Constant TopRadiatorHalfLength   { 0.5 * 6.82 * 2.54 }
Constant TopRadiatorZPos         { LowerRadiatorZPos  + LowerRadiatorHalfHeight + 2*UpperRadiatorHalfHeight + UpperRadiatorHalfDepth }



#######################################################
# FrontEndElectronics

Constant ElectronicsDepth 1.2
Constant ElectronicsHeight 5.5
Constant ElectronicsWidth 2.5  



#######################################################
# ACS
#
# AJ: Updated the dimensions according to ACS CAD titled COSI_ACS_Top_Assembly_20231114.stp
#
#
Constant BGOMaterial bgo

# Space fromt Cryostat to inner ACS Walls
Constant CryoToACS 0.76

# ACS inner dimensions defined by what's inside
#Constant BGOinnerX { CryostatOuterX + CryoToACS }  
#BGOinnerX updated 12/5/23
Constant BGOinnerX { 6*CrystalWrapping + 2*BGOcrystalGap + 2*BGOWallSideThicknessY + 6*BGOXLength }
Constant BGOinnerY { CryostatOuterY + CryoToACS }
Constant BGOinnerZ {allDetZ+2.0+BaseFill}

# ACS outer dimensions:
Constant BGOouterX {BGOinnerX + 2*BGOsideThick + BGOWallFullThickness + BGOWallFullThicknessOutside }
#Constant BGOouterY { BGOinnerY + 2*BGOsideThick + BGOWallFullThickness + BGOWallFullThicknessOutside }  
# 12/04/23
Constant BGOouterY { 6*CrystalWrapping + 4*BGOWallSideThicknessX + 6*BGOYLength + 2*BGOcrystalGap}
#Constant BGOouterY { 2*BGOWallSideThickness + 2*BGOWallFullThickness + 4*BGOsideThick + 2*BGOinnerY }

// Outer BGO shield (HALF thicknesses & half heigths given)

# Active BGO thicknesses
#Constant BGObottomThick 1.25
#Updated 2/8/24
#Updated again 10/11/24 to reflect bottom BGO thickness of 2.4 cm
Constant BGObottomThick {0.5 * 2.4}
Constant BGOsideThick {0.5 * 2.3}
#Pre- ACS EPR the crystal height was 19.8 cm but at EPR it was noted that lowering it by 4 mm would increase our field of view. 
#Constant BGOsideHigh {0.5 * 19.8}
#Post-EPR/PDR shield crystal height
Constant BGOsideHigh {0.5 * 19.4}
Constant BGOXLength {0.5 * 11.1}
Constant BGOYLength {0.5 * 11.8}


# No longer used (was not BGO but plastic)
Constant BGOtopThick  0.0

# ACS holes
Constant BGOBottomRoundHoleRadius 1.0
Constant BGOBottomDogHouseHoleHalfXY  2.9

# ACS cover thickness 
#Constant BGOWallFullThickness 0.305
#The BGOWallFullThickness is actually probable .254 cm but in order to make the dimensions we increased it to .262
Constant BGOWallFullThickness 0.262
Constant BGOWallSideThicknessX {0.5 * 2.828}
#Constant BGOWallSideThicknessY {0.5 * 0.1064}
Constant BGOWallSideThicknessY {0.5 * 0.393}
#This is just here for a placement so I can look at the mass model
Constant BGOWallSideThickness {0.5 * 2.828}
#Constant BGOWallSideThicknessY {0.5 * 0.1064}
Constant BGOTopCloseoutPlate {0.5 * 0.605}
Constant BGOBotCloseoutPlate {0.5 * 0.605}
Constant BGOBotShieldSipmPlateThick {0.5 *0.535}

####
Constant BGOWallFullThicknessTop 1.44
Constant BGOWallFullThicknessOutside 1.5
Constant BGOWallFullThicknessBottom 0.4

# PMT information
Constant PMTlength 8.3
Constant PMTthick  2.80

# Rename: ShieldedHalfHeight
#Constant ShieldedHeight { 0.5 *(BGOWallFullThicknessTop + 2*BGOsideHigh + BGOWallFullThickness + BGOWallFullThickness + 2*BGObottomThick + BGOWallFullThicknessBottom) }
#Constant ShieldedHeight { 1.605+BGOWallFullThickness+BGOsideHigh+CryoBaseZ+0.535 }
#Believe this 1.605 needs to be updated to 1,4634  which is the halfthickness of the bottom shield
Constant ShieldedHeight { BGOBotZ+BGOWallFullThickness+BGOsideHigh+CryoBaseZ+0.535 }

#Half Thickness of bottom shield
Constant BGOBotZ {BGObottomThick+CrystalWrapping+BGOWallFullThickness}

# Bottom Shield BGO crystals 
# These are all different sizes which makes this not very fun... sincerely, Alyson
# These are in half lengths
Constant BotBGOWidth1 {0.5 * 8.0645}
Constant BotBGOLength1 {0.5 * 19.8}
Constant BotBGOWidth2 {0.5 * 6.4609}
Constant BotBGOLength2 {0.5 * 17.134}
Constant BotBGOWidth3 {0.5 * 6.4609}
Constant BotBGOLength3 {0.5 * 17.134}
Constant BotBGOWidth4 {0.5 * 6.25602}
Constant BotBGOLength4 {0.5 * 19.8}
Constant BotBGOWidth5 {0.5 * 6.25602}
Constant BotBGOLength5 {0.5 * 19.8}
Constant BotBGOWidth6 {0.5 * 8.0645}
Constant BotBGOLength6 {0.5 * 19.8}
Constant BotBGOWidth7 {0.5 * 6.4609}
Constant BotBGOLength7 {0.5 * 17.134}
Constant BotBGOWidth8 {0.5 * 6.4609}
Constant BotBGOLength8 {0.5 * 17.134}
Constant BotBGOWidth9 {0.5 * 6.25602}
Constant BotBGOLength9 {0.5 * 19.8}
Constant BotBGOWidth10 {0.5 * 6.25602}
Constant BotBGOLength10 {0.5 * 19.8}

# Thickness of teflon wrapping on crystals on all sides
# This is a full thickness but is easier this way since it is on all sides
Constant CrystalWrapping 0.1

# Hole for Cold strap through bottom shield
Constant ColdStrapHoleLength 5.08
Constant ColdStrapHoleWidth 11.6713

# Hole for the frangibolt
#No longer exists - 12/6/23
Constant FrangBoltHoleRad 1.0

# Gaps from the BGO to the edge of the housing for the bottom shield
Constant BotBGOtoHouseGapX 2.298
#Constant BotBGOtoHouseGapY 3.30924
Constant BotBGOtoHouseGapY 3.21

# Gaps between the crystals that is created by the aluminum walls
# true gap is this plus .2 cm for .1cm of tyvek wrapping on either side of the crystal
# Full distance
Constant BGOcrystalGap .26
Constant BGOcrystalGapz .3

####################################

## CAD MODEL MEASUREMENTS BELOW ## 
# All measurements currently taken manually w/ a ruler function in SolidWorks (needs refining)
############################
## Solar panels ## 

# Units: cm 
Constant PanelLength 123.44
Constant PanelWidth 49.53
Constant PanelDepth 2.54

# Deployable solar array: same panel Dimmensions; 
Constant PanelSeparation 10

# Mounting point for solar panel 
Constant DriveLength_1 86.1 
Constant DriveLength_2 20.3
Constant DriveHeight 21.4 
Constant DriveDepth 1.718

# Fudge Factor: panels end up inside of bus without this 
Constant PanelBias 10

#######################

## Reaction wheels ##
# Units: cm 
Constant WheelLength 17.526
Constant WheelWidth 17.526 
Constant WheelDepth 7.02


# The following measurements can probably be derived from trig, but I measured each in solidworks to be safe:
# Inner Edge-to-edge distance between top of wheels in tyhe  assembly 
Constant RW_Separation_Top 18.64

# Outer Edge-to-edge distance between top of wheels in the  assembly 
Constant RW_Separation_Bottom 40.46

# Height of RW Assmembly, from base to top 
Constant RW_Height 17.948 


# Torque rods 
# NOTE: Not in CAD model; component dimmensions identified from vendor spec sheet; placements by eye 
# Model: Zarm MT80-1 (from system block diagram)
# From  vendor spec sheet: 
    #  Mass: 4.1 kg 
    #  Diameter: 5cm 
    #  Length: 38.05cm
Constant MT_length 38.05 
Constant MT_radius 2.5 

## MAU Dimmensions  
# Maybe model as trapezoid?
Constant MAU_Depth 39.04 
Constant MAU_Length_1  22.74
Constant MAU_Length_2  20.07
Constant MAU_Height 11.3

# SADA 
Constant SADA_radius 5.05 
Constant SADA_length 25.05
Constant SADA_CoM_height 41.95

# SADE
Constant SADE_radius 8.55
Constant SADE_length 8.0
Constant SADE_CoM_height 12.2

# Battery
Constant batt_length 32.2
Constant batt_depth 6.73
Constant batt_width 18.6

#MSTB (?)
Constant MSTB_length 15
Constant MSTB_width 11.08
# TAM 
Constant TAM_length 9.88
Constant TAM_width 8.2 
Constant TAM_depth 3.4

#############################
## PIP Deck ## 
Constant PIP_depth 4.72

# Thickness to achive mass of ~9.69 kg: 0.225
Constant PIP_aluminum_thickness 0.20

# Determine mass of Aluminum interior (assuming honecomb of rho = 0.052)
#   Mass_PIP_interior = rho_honecomb_al*Volume_PIP = rho* (V_bottom + V_top)
#            = 0.052 * [(((105.7+58.3)/2)*41.656*4.72)+(((105.7+47.39)/2)*49.8856*4.72)]
#            = 1,776g = 1.76 kg  

# Determine mass of aluminum shell 
#  Mass_PIP_shell = rho_solid_al * (V_bottom_outer-V_bottom_inner) + (v_top_outer-v_top_inner)

# Breaking PIP into two separate trapezoids: 
# - TRD1: Bottom Trapezoid (solid)
# - TRD2: Top Trapezoid (w/ hole)
Constant PIP_TRD1_length_1 105.7
Constant PIP_TRD1_length_2 58.3
Constant PIP_TRD1_height 41.656

Constant PIP_TRD2_length_1 105.7
Constant PIP_TRD2_length_2 47.39
Constant PIP_TRD2_height 49.8856

# TRD2 Gap Dimmensions 
Constant PIP_TRD2_gap_height 5.08
Constant PIP_TRD2_gap_length 19.05




##########################
# DPM 
Constant DPM_length 11.86
Constant DPM_width 13.45
Constant DPM_height 13.625

# Mass check of DPM:
# From MEL: Housing mass of 0.19kg = 190 g
#  Volume of aluminum housing in this model: 
#     V_outer= [11.86+(2*0.15875)]*[13.45+(2*0.15875)]*[13.625+(2*0.15875)]
#               = 2,337.57 cm^3
#     V_inner = [11.86]*[13.45]*[13.625]
#               =2,173.41
#     V_total = V_outer-V_inner 
#             = 164.16 cm^3
#   Resulting mass for an aluminum alloy housing (rho = 2.6989):
#     M = 2.6989 g/cm^3 * 161.16 cm^3 = 434.95 g  [TOO HIGH]

# Tweak aluminum shell thickness until desired mas is reached: 
#    Setting thickness to 0.05cm gives mass of 136.72 g.
#
#    # Add in the bracket. Set thickness so that total masses add to 190g (about 0.11cm)
# M_bracket = [14.69cm*11.946cm*0.11cm] * 2.6969 g/cm^3 = 52.1g

# Resulting DPM housing mass: 136.72g+52.1g = 188.82g

Constant DPM_wall_thickness 0.05

Constant DPM_bracket_width 14.89
Constant DPM_bracket_length 11.946
Constant DPM_bracket_height 0.11

# Add in DPM electronics
# From MEL: 4x DPM units. Per unit:
#  0.20kg + 0.05kg + (2*0.05)+0.05kg =0.4kg = 400 g (Power Board+LVPS+Distribtuion Board+Harness)
# Using length and width above and density of 10 g/cm^3 [see "electr" in .mat file], resulting thickness of
#  l = 3100g / (10g/cm^3 *11.4*1)
#     = 1.38cm

#

Constant DPM_board_length 0.9
Constant DPM_board_width 4.4
Constant DPM_board_depth 10


## Readout Module ## 
Constant Readout_length 19.7
Constant Readout_width  11.4
Constant Readout_height 6.82

# Tune thickness according to MEL mass: 
# Housing Mass in MEL: 210g
# Mass in model:
#   M = M_outer - M_inner 
#     = 2.6989 g/cm^3 * [((19.7+2T)*(11.4+2T)*(6.82+2T)) - (19.7*11.4*6.82))]
#  Resulting thickness: ~0.088cm yields M of ~ 210g

Constant Readout_thickness 0.088

# Add in Readout electronics 
# From MEL: Mass of 1.2kg + 0.4kg + 1.5kg = 3.1kg = 3100g (Boards+LVPS+Harnessing)
# Using length and width above and density of 10 g/cm^3 [see "electr" in .mat file], resulting thickness of 
#  l = 3100g / (10g/cm^3 *11.4*1) 
#     = 1.38cm 

Constant Readout_electronics_depth 1.38
#######################
## Star Tracker 

## Star Tracker Baffle 
# Modeled as Trapezoidal Prism shell 
Constant ST_baffle_height 19.22
Constant ST_baffle_depth 13.83
Constant ST_baffle_length_1 14.83
Constant ST_baffle_length_2 5.00

Constant ST_baffle_thickness 0.1


###################
## Bipods 
# - Unit mass: 1.45 kg 
# - Num units: 3 
# - Material: "Biased M55J/RS-3C carbon composite tube"

# Current mass of each tripod:
    # Volume_outer = ((44.89+8.57)/2)*52.6*4.3 = 6045.79 cm^3
    # Volume_inner = ((21.79+6.76)/2)*44.43*4.3 = 2724.22 cm^3 

        # Mass = rho_carbon_cynate * (volume_outer - volume_inner)
        #  = 1.2 g/cm^3 * 3,318.5cm^3 = 3,889g 


    # Tweak thickness until unit mass of 1.45 kg achieved:
    # thickness = 1.62

# Model has hollowed out Trapzoidal Prism?
Constant bipod_outer_separation_bottom 44.89
Constant bipod_outer_separation_top 8.57
Constant bipod_outer_height 52.6
Constant bipod_depth 1.62



# Region to subtract: thickness of each bipod leg 
Constant bipod_inner_separation_bottom 21.78
Constant bipod_inner_separation_top 6.76
Constant bipod_inner_height 44.43

#########################
# Radiators 

# Placeholder: tweak for mass reason 
Constant radiator_thickness 0.57

Constant radiator_width 52
Constant radiator_length 48

Constant radiator_gap_length 11.74
Constant radiator_gap_width 9.525


##########
# BTO 

# Top housing 
Constant bto_housing_top_length 4.5 
Constant bto_housing_top_width 4.5 
Constant bto_housing_top_height 7.8

# Bottom Housing 


################
# omni Antenna 

# 

################
# gps antenna

# Aluminum enclosure 
Constant gps_housing_radius 1.91
Constant gps_housing_height 24.9 
# Fine tuned to get mass of 57.5g @ density of aluminum (2.6989g/cm^3)
Constant gps_housing_thickness 0.07

# Patch antenna 
Constant gps_patch_length 4.75
Constant gps_patch_width 4.75
Constant gps_patch_height 1.41

# Base plate 
Constant gps_base_length 4
Constant gps_base_width 4 
# Fine tuned to get mass of 4 g @ density of stainless steel (8 g/cm^3):
Constant gps_base_height 0.0315


###########################
# BTO electronics box 
Constant bto_box_thickness 0.42
Constant bto_box_length 10.2
Constant bto_box_width 10.2
Constant bto_box_height 9.31

Constant bto_box_electronics_height 0.658




