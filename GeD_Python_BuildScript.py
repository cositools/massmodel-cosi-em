
#read in the template for the GeD definition
f = open("COSISMEX.Ge.DetectorBuild.geo.template","r")
gedtemplate = f.read()
f.close()

IngotRadius = 2*2.54
DetectorHalfHeight = [0.75, 0.75]
DetectorHalfWidth = 4.025
GuardRingSize = 0.3

fnames = []

detlines = ['']
triggerlines = [ '' ]

for i,detheight in enumerate(DetectorHalfHeight):

	lines = ['Constant DetectorHalfHeight ' + str(detheight),\
			'Constant IngotRadius ' + str(IngotRadius),\
			'Constant DetectorHalfWidth ' + str(DetectorHalfWidth),\
			'Constant GuardRingSize ' + str(GuardRingSize),\
			'']

	fname = 'COSISMEX.Ge.DetectorBuild.Q0D' + str(i) + '.geo'; fnames.append(fname)
	fout = open(fname,'w')
	fout.writelines(map(lambda x:x + '\n',lines))
	fout.write( gedtemplate.replace('QQQQ', 'Q0D'+str(i)) )
	fout.close()


	#add in the detector + trigger info
#	detector = 'Detector' + str(i)
#	trigger = detector + '_Trigger'
#	grtrigger = detector + '_GRTrigger'
#	detlines = ["Include " + fname + '\n']
#	detlines += ['Strip3D ' + detector,\
#				 detector + '.DetectorVolume ' + ged_wafer,\
#				 detector + '.SensitiveVolume ' + ged_wafer,\
#				 detector + '.StructuralPitch 0.0 0.0 0.0',\
#				 detector + '.StructuralOffset 0.0 0.0 0.0',\
#				 detector + '.Offset 0.32 0.32',\
#				 detector + '.StripNumber 37 37',\
#				 detector + '.EnergyResolution Gauss 0 0 1.02',\
#				 detector + '.EnergyResolution Gauss 100 100 1.02',\
#				 detector + '.EnergyResolution Gauss 300 300 1.04',\
#				 detector + '.EnergyResolution Gauss 1000 1000 1.07',\
#				 detector + '.EnergyResolution Gauss 3000 3000 1.15',\
#				 detector + '.EnergyResolution Gauss 10000 10000 1.42',\
#				 detector + '.DepthResolution 100 0.02',\
#				 detector + '.NoiseThreshold 15.0',\
#				 detector + '.TriggerThreshold 40.0',\
#				 detector + '.GuardringEnergyResolution 100 1.5',\
#				 detector + '.GuardringEnergyResolution 1000 1.5',\
#				 detector + '.GuardringTriggerThreshold 40',\
#				 detector + '.FailureRate 0.0',\
#				 '']
#	triggerlines = [ 'Trigger ' + trigger,\
#				 trigger + '.Veto False',\
#				 trigger + '.TriggerByChannel True',\
#				 trigger + '.Detector ' + detector + ' 1',\
#				 '',\
#				 'Trigger ' + grtrigger,\
#				 grtrigger + '.Veto True',\
#				 grtrigger + '.TriggerByDetector True',\
#				 grtrigger + '.GuardringDetector ' + detector + ' 1',\
#				 '']
#
#	# Write the individual .det files
#	fname = 'GeD_DetectorBuild_' + str(i) + '.det'
#	fout = open(fname,'w')

#	fout.writelines(map(lambda x:x + '\n',detlines))
#	fout.writelines(map(lambda x:x + '\n',triggerlines))
#	fout.close()



# Now write the tigger criteria file
#fout = open('GeD_TriggerCriteria.det','w')
#fout.writelines(map(lambda x:x + '\n',triggerlines))
#fout.close()


