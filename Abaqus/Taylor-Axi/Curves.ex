# Global parameters
Parameters, xname=$Time\ (s)$, marksnumber=15, title=$Taylor\ Axi\ Benchmark\ Test$, crop=True

# Temperature curve
Temperature, yname=$Temperature\ (^{\circ}C)$, removename=-Temperature, legendlocate=bottomright, Taylor_ANN-15-7_Temperature.plot, Taylor_ANN-7-4_Temperature.plot, Taylor_BI_Temperature.plot, Taylor_VH_Temperature.plot

# Plastic strain curve
plasticStrain, yname=$Equivalent\ plastic\ strain\ \overline{\varepsilon}^{p}$, removename=-PlasticStrain, legendlocate=bottomright, Taylor_ANN-15-7_PlasticStrain.plot, Taylor_ANN-7-4_PlasticStrain.plot, Taylor_BI_PlasticStrain.plot, Taylor_VH_PlasticStrain.plot

# von Mises equivalent stress curve
vonMises, yname=$von\ Mises\ stress\ \overline{\sigma}\ (MPa)$, removename=-vonMises, legendlocate=topright, Taylor_ANN-15-7_vonMises.plot, Taylor_ANN-7-4_vonMises.plot, Taylor_BI_vonMises.plot, Taylor_VH_vonMises.plot

# TimeStep curve
timeStep, yname=$Time\ increment\ \Delta t\ (s)$, removename=-timeStep, legendlocate=topright, Taylor_ANN-15-7_timeStep.plot, Taylor_ANN-7-4_timeStep.plot, Taylor_BI_timeStep.plot, Taylor_VH_timeStep.plot

# Kinetic energy curve
kineticEnergy, yname=$Kinetic\ energy$, removename=-kineticEnergy, legendlocate=topright, Taylor_ANN-15-7_kineticEnergy.plot, Taylor_ANN-7-4_kineticEnergy.plot, Taylor_BI_kineticEnergy.plot, Taylor_VH_kineticEnergy.plot

# Height history
height, yname=$Height\ H_f\ (mm)$, removename=-height, Taylor_ANN-15-7_height.plot, Taylor_ANN-7-4_height.plot, Taylor_BI_height.plot, Taylor_VH_height.plot

# Radius history
radius, yname=$Radius\ R_f\ (mm)$, removename=-radius, legendlocate=bottomright, Taylor_ANN-15-7_radius.plot, Taylor_ANN-7-4_radius.plot, Taylor_BI_radius.plot, Taylor_VH_radius.plot
