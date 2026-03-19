Include UpdatedHolderQ1L0_withButtons.200.geo.setup
#Include HolderQ1L0_withButtons.200.geo.setup

#Joints and Isolators
Include IndiumJointQ1L0_Holderside_Top.1.geo.setup
Include IsolatorQ1L0_Holderside.10.geo.setup
Include IndiumJointQ1L0_Holderside_Bottom.1.geo.setup
Include IndiumJointQ1L0_Capside_Top.1.geo.setup
Include IsolatorQ1L0_Capside.10.geo.setup
Include IndiumJointQ1L0_Capside_Bottom.1.geo.setup

#Holder Clamps

Volume DetectorHolderClampWrapper
DetectorHolderClampWrapper.Shape BRIK 1000 1000 1000
DetectorHolderClampWrapper.Material Vacuum
DetectorHolderClampWrapper.Visibility 0
DetectorHolderClampWrapper.Position 0 0 -0.002001
DetectorHolderClampWrapper.Rotation 0 0 0
DetectorHolderClampWrapper.Virtual True
DetectorHolderClampWrapper.Mother DetectorStackWrapper

Include Detector_Holder_ClampQ1L0_HVside.50.geo.setup
Include Detector_Holder_ClampQ1L0_LVside.50.geo.setup

Volume DetectorHolderClampPadWrapper
DetectorHolderClampPadWrapper.Shape BRIK 1000 1000 1000
DetectorHolderClampPadWrapper.Material Vacuum
DetectorHolderClampPadWrapper.Visibility 0
DetectorHolderClampPadWrapper.Position 0 0 0.003369
DetectorHolderClampPadWrapper.Rotation 0 0 0
DetectorHolderClampPadWrapper.Virtual True
DetectorHolderClampPadWrapper.Mother DetectorHolderClampWrapper

Include Detector_Holder_Clamp_PadQ1L0_HVside.10.geo.setup
Include Detector_Holder_Clamp_PadQ1L0_LVside.10.geo.setup

Volume IndiumGasketWrapper
IndiumGasketWrapper.Shape BRIK 1000 1000 1000
IndiumGasketWrapper.Material Vacuum
IndiumGasketWrapper.Visibility 0
IndiumGasketWrapper.Position 0.005581 0 0
IndiumGasketWrapper.Rotation 0 0 0
IndiumGasketWrapper.Virtual True
IndiumGasketWrapper.Mother DetectorStackWrapper

Indium_GasketQ1L0_DetectorHoldertoColdFinder.100.geo.setup

#Include LV (dc) interposer board

Volume LVInterposerDWrapper
LVInterposerDWrapper.Shape BRIK 1000 1000 1000
LVInterposerDWrapper.Material Vacuum
LVInterposerDWrapper.Visibility 0
LVInterposerDWrapper.Position 0 0 0
LVInterposerDWrapper.Rotation 0 0 0
LVInterposerDWrapper.Virtual True
LVInterposerDWrapper.Mother DetectorStackWrapper

Include InterposerQ1L0_dc_detector_pcb.20.geo.setup

Volume LVInterposerTWrapper
LVInterposerTWrapper.Shape BRIK 1000 1000 1000
LVInterposerTWrapper.Material Vacuum
LVInterposerTWrapper.Visibility 0
LVInterposerTWrapper.Position 0 {-0.018204-0.003228} 0
LVInterposerTWrapper.Rotation 0 0 0
LVInterposerTWrapper.Virtual True
LVInterposerTWrapper.Mother DetectorStackWrapper

Include InterposerQ1L0_dc_terminal_pcb.100.geo.setup

Volume LVInterposerTConnectorWrapper
LVInterposerTConnectorWrapper.Shape BRIK 1000 1000 1000
LVInterposerTConnectorWrapper.Material Vacuum
LVInterposerTConnectorWrapper.Visibility 0
LVInterposerTConnectorWrapper.Position 0 -0.007925 0
LVInterposerTConnectorWrapper.Rotation 0 0 0
LVInterposerTConnectorWrapper.Virtual True
LVInterposerTConnectorWrapper.Mother LVInterposerTWrapper

Include InterposerQ1L0_dc_terminal_connector_holderside.20.geo.setup
Include InterposerQ1L0_dc_terminal_connector_capside.20.geo.setup

#Include HV (ac) interposer board

Volume HVInterposerDWrapper
HVInterposerDWrapper.Shape BRIK 1000 1000 1000
HVInterposerDWrapper.Material Vacuum
HVInterposerDWrapper.Visibility 0
HVInterposerDWrapper.Position 0 0 0.00184
HVInterposerDWrapper.Rotation 0 0 0
HVInterposerDWrapper.Virtual True
HVInterposerDWrapper.Mother DetectorStackWrapper

Include InterposerQ1L0_ac_detector_pcb.20.geo.setup

Volume HVInterposerTWrapper
HVInterposerTWrapper.Shape BRIK 1000 1000 1000
HVInterposerTWrapper.Material Vacuum
HVInterposerTWrapper.Visibility 0
HVInterposerTWrapper.Position -0.007285 0 0
HVInterposerTWrapper.Rotation 0 0 0
HVInterposerTWrapper.Virtual True
HVInterposerTWrapper.Mother DetectorStackWrapper

Include InterposerQ1L0_ac_terminal_pcb.100.geo.setup
Include InterposerQ1L0_ac_terminal_connector_nside.20.geo.setup
Include InterposerQ1L0_ac_terminal_connector_fside.20.geo.setup

Volume HVInterposerTCapacitorWrapper
HVInterposerTCapacitorWrapper.Shape BRIK 1000 1000 1000
HVInterposerTCapacitorWrapper.Material Vacuum
HVInterposerTCapacitorWrapper.Visibility 0
HVInterposerTCapacitorWrapper.Position 0.006119 0 0
HVInterposerTCapacitorWrapper.Rotation 0 0 0
HVInterposerTCapacitorWrapper.Virtual True
HVInterposerTCapacitorWrapper.Mother HVInterposerTWrapper

Include InterposerQ1L0_ac_capacitors.100.geo.setup


