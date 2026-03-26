#Z-wall

Include ACS_ZPanel.200.geo.setup

Volume ACSWrapper
ACSWrapper.Shape BRIK 1000 1000 1000
ACSWrapper.Material Vacuum
ACSWrapper.Visibility 0
ACSWrapper.Position 0 0 0.064355
ACSWrapper.Rotation 0 0 0
ACSWrapper.Virtual True
ACSWrapper.Mother WorldVolume

#Other passive walls

Include ACS_YWall_Q03.200.geo.setup
Include ACS_YWall_Q12.200.geo.setup
Include ACS_XWall_Q23.200.geo.setup

Volume ACSX01WallWrapper
ACSX01WallWrapper.Shape BRIK 1000 1000 1000
ACSX01WallWrapper.Material Vacuum
ACSX01WallWrapper.Visibility 0
ACSX01WallWrapper.Position -0.038699 0 0.052320
ACSX01WallWrapper.Rotation 0 0 0
ACSX01WallWrapper.Virtual True
ACSX01WallWrapper.Mother ACSWrapper

#Active wall in EM Cryostat (X01 wall)

Include ACS_XWall_Q01_NRL_CAD.200.geo.setup
Include BGO_X1_0.200.geo.setup
Include BGO_X1_1.200.geo.setup
Include BGO_X1_2.200.geo.setup

