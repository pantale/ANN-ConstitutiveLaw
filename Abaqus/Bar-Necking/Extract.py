from odbAccess import *
from string import *
import fpformat
import sys

# Fill the history variable
def fillHistory(history):
    tm=[]
    ps=[]
    for time, pos in history:
        tm.append(time)
        ps.append(pos)
    return tm,ps

def rawReadLineNumber(file,number):
     # Read the whole file
    FRead=open(file, "r")
    lines = FRead.readlines()
    FRead.close()
    return lines[number-1]
    
def rawRead(file):
    # Read the whole file
    FRead=open(file, "r")
    lines = FRead.readlines()
    FRead.close()
    # Split lines of file
    #lines=content.split('\n')
    # remove empty lines and informations after #
    lines = [x.partition('#')[0] for x in lines if (x and x.partition('#')[0])]
    return lines    
    
# Parse the arguments of Abaqus
pyFile=[x for x in sys.argv if '.py' in x][0].split('.py')[0]

# Get the name of the different files 
pyExtract=pyFile+'.ex'
FRead=open(pyExtract, "r")
content = FRead.read()
FRead.close()
lines=content.split('\n')

vName=[]
vValue=[]
vRegion=[]
vJob=[]

lines=rawRead(pyFile+'.ex')
for line in lines:
    # Split and strip line
    lineItems=[x.strip() for x in line.split(',')]
    # Extraction des parametres du mimizer
    if (lineItems[0]=='Variable'):
        for item in lineItems:
            item=[x.strip() for x in item.split('=')]
            if (item[0]=='value'):
				vValue.append(item[1])
            if (item[0]=='name'):
				vName.append(item[1])
            if (item[0]=='region'):
				vRegion.append(item[1])
            if (item[0]=='job'):
				vJob.append(item[1])


for var in range (0,len(vName)):
	# Get the Odb object
	jobFile=vJob[var]
	odb=openOdb(path=jobFile+".odb")
	# Get the step 1
	step1 = odb.steps['Step-1']
	print("Extracting "+vName[var]+" from "+jobFile)
	region=step1.historyRegions[vRegion[var]]
	time, data = fillHistory(region.historyOutputs[vValue[var]].data)
	outFile=jobFile+'_'+vName[var]+'.plot'
	dispFile=open(outFile,'w')
	dispFile.write("#DynELA_plot :"+jobFile+'_'+vName[var]+"\n")
	dispFile.write("#plotted :"+jobFile+'_'+vName[var]+"\n")
	for i in range (0,len(time)):
		dispFile.write(str(time[i])+" "+str(data[i])+"\n")
	dispFile.close()

