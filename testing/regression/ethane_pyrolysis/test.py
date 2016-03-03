from rmgpy.tools.observablesRegression import ObservablesTestCase
from rmgpy.quantity import Quantity

# Conditions
reactorType = 'IdealGasReactor'
molFracList=[{'CC': 0.05, '[Ar]': 0.95}]
Plist=Quantity([278643.8],'Pa')
Tlist=Quantity([1500,1750,2000],'K')
terminationTime = Quantity(5e-5,'s')

# Create observables test case and compare the old and new models

minimal = ObservablesTestCase(title = 'Ethane Pyrolysis',
                              oldDir = 'old',
                              newDir = 'new',
                              observables = {'species':['CC','[CH3]']})

minimal.generateConditions(reactorType = reactorType,
                           reactionTime = terminationTime,
                           molFracList = molFracList,
                           Tlist = Tlist,
                           Plist = Plist)

minimal.compare(plot = True)
