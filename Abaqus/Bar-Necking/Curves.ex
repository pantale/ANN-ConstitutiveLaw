# Global parameters
Parameters, xrange=7, xname=$Elongation\ of\ the\ end\ of\ the\ bar\ (mm)$, marksnumber=15, title=$Bar\ Necking\ Benchmark\ Test$, crop=True

# Temperature curve
Temperature, yname=$Temperature\ (^{\circ}C)$, removename=-temp, legendlocate=bottomright, BarNecking_ANN-15-7_temp.plot, BarNecking_ANN-7-4_temp.plot, BarNecking_BI_temp.plot, BarNecking_VH_temp.plot

# Plastic strain curve
plasticStrain, yname=$Equivalent\ plastic\ strain\ \overline{\varepsilon}^{p}$, removename=-peeq, legendlocate=bottomright, BarNecking_ANN-15-7_peeq.plot, BarNecking_ANN-7-4_peeq.plot, BarNecking_BI_peeq.plot, BarNecking_VH_peeq.plot

# von Mises equivalent stress curve
vonMises, yname=$von\ Mises\ stress\ \overline{\sigma}\ (MPa)$, removename=-mises, legendlocate=bottomright, BarNecking_ANN-15-7_mises.plot, BarNecking_ANN-7-4_mises.plot, BarNecking_BI_mises.plot, BarNecking_VH_mises.plot

# TimeStep curve
timeStep, yname=$Time\ increment\ \Delta t\ (s)$, removename=-dt, legendlocate=topright, BarNecking_ANN-15-7_dt.plot, BarNecking_ANN-7-4_dt.plot, BarNecking_BI_dt.plot, BarNecking_VH_dt.plot

