# Built-in model
Variable, job=BarNecking_BI, value=MISES, name=mises, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_BI, value=PEEQ, name=peeq, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_BI, value=TEMP, name=temp, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_BI, value=DT, name=dt, region=Assembly ASSEMBLY

# VUHARD routine
Variable, job=BarNecking_VH, value=MISES, name=mises, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_VH, value=PEEQ, name=peeq, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_VH, value=TEMP, name=temp, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_VH, value=DT, name=dt, region=Assembly ASSEMBLY

# VUMAT Analytical Newton-Raphson
#Variable, job=BarNecking_VA, value=MISES, name=mises, region=Element CYLINDER-1.200 Int Point 1
#Variable, job=BarNecking_VA, value=SDV1, name=peeq, region=Element CYLINDER-1.200 Int Point 1
#Variable, job=BarNecking_VA, value=TEMP, name=temp, region=Element CYLINDER-1.200 Int Point 1
#Variable, job=BarNecking_VA, value=DT, name=dt, region=Assembly ASSEMBLY

# VUMAT Numerical Newton-Raphson
Variable, job=BarNecking_ANN-7-4, value=MISES, name=mises, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_ANN-7-4, value=PEEQ, name=peeq, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_ANN-7-4, value=TEMP, name=temp, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_ANN-7-4, value=DT, name=dt, region=Assembly ASSEMBLY

# VUMAT Numerical Newton-Raphson
Variable, job=BarNecking_ANN-15-7, value=MISES, name=mises, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_ANN-15-7, value=PEEQ, name=peeq, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_ANN-15-7, value=TEMP, name=temp, region=Element CYLINDER-1.200 Int Point 1
Variable, job=BarNecking_ANN-15-7, value=DT, name=dt, region=Assembly ASSEMBLY

