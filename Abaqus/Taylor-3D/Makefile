CPUS=2

all:
	# Clean the CPU log file
	@rm -f CPU-Times.log
	# Run Abaqus build-in model
	abaqus job=Taylor_BI input=Taylor double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF
	echo "Built-In" >> CPU-Times.log
	tail -n8 Taylor_BI.sta | head -n1 >> CPU-Times.log
	# VUMAT Analytical Newton-Raphson
	#abaqus job=Taylor_VA input=Taylor_V user=../VUMAT-NR.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF
	#echo "NR" >> CPU-Times.log
	#tail -n8 Taylor_VA.sta | head -n1 >> CPU-Times.log
	# VUHARD routine
	abaqus job=Taylor_VH user=../VUHARD.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF
	echo "VUHard" >> CPU-Times.log
	tail -n8 Taylor_VH.sta | head -n1 >> CPU-Times.log
	# ANN routine
	abaqus job=Taylor_ANN-7-4 input=Taylor_VH user=../VUHARD-ANN-3-7-4-1-sigmoid.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF
	echo "ANN-7-4" >> CPU-Times.log
	tail -n8 Taylor_ANN-7-4.sta | head -n1 >> CPU-Times.log
	# ANN routine
	abaqus job=Taylor_ANN-15-7 input=Taylor_VH user=../VUHARD-ANN-3-15-7-1-sigmoid.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF
	echo "ANN-15-7" >> CPU-Times.log
	tail -n8 Taylor_ANN-15-7.sta | head -n1 >> CPU-Times.log
	# Clean files
	@for FILE in $(FILES_TARGET); do rm -f $$FILE.abq $$FILE.com $$FILE.dat $$FILE.mdl $$FILE.msg $$FILE.pac $$FILE.prt $$FILE.res $$FILE.sel $$FILE.sta $$FILE.stt ; done
	abaqus python Extract.py
	#replaceInFile "Taylor_VA_*.plot" Taylor_VA_ VUMAT-
	replaceInFile "Taylor_BI_*.plot" Taylor_BI_ Built-in-
	replaceInFile "Taylor_VH_*.plot" Taylor_VH_ Analytical-
	replaceInFile "Taylor_ANN-7-4_*.plot" Taylor_ANN-7-4_ 3-7-4-1-sig-
	replaceInFile "Taylor_ANN-15-7_*.plot" Taylor_ANN-15-7_ 3-15-7-1-sig-
	python3 Curves.py 

clean:
	@echo "Cleaning: $(PWD)"
	@rm -f Taylor*.abq Taylor*.com Taylor*.log Taylor*.mdl Taylor*.msg Taylor*.pac Taylor*.prt Taylor*.res Taylor*.sel Taylor*.stt Taylor*.dat Taylor*.sta

subclean: clean

