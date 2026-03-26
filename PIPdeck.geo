Volume PIPDeckWrapper
PIPDeckWrapper.Shape BRIK 1000 1000 1000
PIPDeckWrapper.Material Vacuum
PIPDeckWrapper.Visibility 0
PIPDeckWrapper.Position 0 0 -0.246093
PIPDeckWrapper.Rotation 0 0 0
PIPDeckWrapper.Virtual True
PIPDeckWrapper.Mother WorldVolume

Include PIP_Deck.10.geo.setup

Volume PIPDeckLegsWrapper
PIPDeckLegsWrapper.Shape BRIK 1000 1000 1000
PIPDeckLegsWrapper.Material Vacuum
PIPDeckLegsWrapper.Visibility 0
PIPDeckLegsWrapper.Position 0 0 0
PIPDeckLegsWrapper.Rotation 0 0 30
PIPDeckLegsWrapper.Virtual True
PIPDeckLegsWrapper.Mother PIPDeckWrapper

Include Short_Term_PIP_Stand_Leg_1.200.geo.setup
Include Short_Term_PIP_Stand_Leg_2.200.geo.setup
Include Short_Term_PIP_Stand_Leg_3.200.geo.setup
