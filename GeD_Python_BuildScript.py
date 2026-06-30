
#read in the template for the GeD definition
f_geo = open("COSISMEX.Ge.DetectorBuild.geo.template","r")
ged_geo_template = f_geo.read()
f_geo.close()

f_det_anl = open("COSISMEX.Ge.DetectorBuild.det.template","r")
ged_det_anl_template = f_det_anl.read()
f_det_anl.close()




#Listed for GeD_0 (HP52217-1), GeD_1 (Mirion "good EM1" (M61574))
#TODO Read parameters from file
CrystalDiameter_A = [10.10, 9.97]
HandleSpan_B = [9.6, 9.54]
DetectorWidthX_C = [8.0, 8.03]
DetectorWidthY_D = [8.0, 8.04]
DetectorHeight_E = [1.5, 1.49]
HandleThickness_F = [0.6, 0.61]
HandleBridgeThickness_G = [0.13, 0.13] 
GuardRingSize = 0.3

fnames = []

detlines = ['']
triggerlines = [ '' ]

#TODO generalize to 16 detectors to get Q#L# with modulo of 4
for i,detheight in enumerate(DetectorHeight_E):

	lines = ['Constant CrystalDiameter_Q0_L' + str(i) + ' ' + str(CrystalDiameter_A[i]),\
			'Constant HandleSpan_Q0_L' + str(i) + ' ' + str(HandleSpan_B[i]),\
			'Constant DetectorWidthX_Q0_L' + str(i) + ' ' + str(DetectorWidthX_C[i]),\
			'Constant DetectorWidthY_Q0_L' + str(i) + ' ' + str(DetectorWidthY_D[i]),\
			'Constant DetectorHeight_Q0_L' + str(i) + ' ' + str(DetectorHeight_E[i]),\
			'Constant HandleThickness_Q0_L' + str(i) + ' ' + str(HandleThickness_F[i]),\
			'Constant HandleBridgeThickness_Q0_L' + str(i) + ' ' + str(HandleBridgeThickness_G[i]),\
			'Constant GuardRingSize_Q0_L' + str(i) + ' ' + str(GuardRingSize),\
			'']

	fname = 'COSISMEX.Ge.Q0L' + str(i) + '.geo'; fnames.append(fname)
	fout = open(fname,'w')
	fout.writelines(map(lambda x:x + '\n',lines))
	fout.write( ged_geo_template.replace('QQ_QQ', 'Q0_L'+str(i)) )
	fout.close()

	fname = 'COSISMEX.Ge.Q0L' + str(i) + '.det'; fnames.append(fname)
	fout = open(fname,'w')
	fout.write( ged_det_anl_template.replace('QQ_QQ', 'Q0_L'+str(i)).replace('QQQQ', 'Q0L'+str(i)).replace('GeD_X', 'GeD_'+str(i)) )
	fout.close()


print(fnames)


