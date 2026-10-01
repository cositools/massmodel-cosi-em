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
#Include BGO_X1_0.200.geo.setup
#Include BGO_X1_1.200.geo.setup
#Include BGO_X1_2.200.geo.setup

Volume BGO_X0_0_Crystal
BGO_X0_0_Crystal.Shape BRIK 1.163999 5.916999 9.700000
BGO_X0_0_Crystal.Material BGO
BGO_X0_0_Crystal.Position -18.906020 12.303555 19.228526
BGO_X0_0_Crystal.Rotation 0 0 0
BGO_X0_0_Crystal.Visibility 1
BGO_X0_0_Crystal.Color 6
BGO_X0_0_Crystal.Mother ACSX01WallWrapper

Volume BGO_X0_1_Crystal
BGO_X0_1_Crystal.Shape BRIK 1.163999 5.916999 9.700000
BGO_X0_1_Crystal.Material BGO
BGO_X0_1_Crystal.Position -18.906021 0.048055 19.228526
BGO_X0_1_Crystal.Rotation 0 0 0
BGO_X0_1_Crystal.Visibility 1
BGO_X0_1_Crystal.Color 6
BGO_X0_1_Crystal.Mother ACSX01WallWrapper

Volume BGO_X0_2_Crystal
BGO_X0_2_Crystal.Shape BRIK 1.163999 5.916999 9.699998
BGO_X0_2_Crystal.Material BGO
BGO_X0_2_Crystal.Position -18.905974 -12.207246 19.228500
BGO_X0_2_Crystal.Rotation 0 0 0
BGO_X0_2_Crystal.Visibility 1
BGO_X0_2_Crystal.Color 6
BGO_X0_2_Crystal.Mother ACSX01WallWrapper

