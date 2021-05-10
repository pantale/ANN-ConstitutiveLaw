CPUS = 2

all:
	# Clean the CPU log file
	@rm -f CPU-Times.log
	# Run Abaqus build-in model
	echo "Built-In" >> CPU-Times.log
	for number in 1 2 3 4 5 6 7 8 9 10 ; do \
	abaqus job=BarNecking_BI input=BarNecking double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF ;\
	tail -n8 BarNecking_BI.sta | head -n1 >> CPU-Times.log ;\
	done
	# VUMAT Analytical Newton-Raphson
	#abaqus job=BarNecking_VA input=BarNecking_V user=../VUMAT-NR.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF
	#echo "NR" >> CPU-Times.log
	#tail -n8 BarNecking_VA.sta | head -n1 >> CPU-Times.log
	# VUHARD routine
	echo "VUHard" >> CPU-Times.log
	for number in 1 2 3 4 5 6 7 8 9 10 ; do \
	abaqus job=BarNecking_VH user=../VUHARD.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF ;\
	tail -n8 BarNecking_VH.sta | head -n1 >> CPU-Times.log ;\
	done
	# ANN routine
	echo "ANN-7-4" >> CPU-Times.log
	for number in 1 2 3 4 5 6 7 8 9 10 ; do \
	abaqus job=BarNecking_ANN-7-4 input=BarNecking_VH user=../VUHARD-ANN-3-7-4-1-sigmoid.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF ;\
	tail -n8 BarNecking_ANN-7-4.sta | head -n1 >> CPU-Times.log ;\
	done
	# ANN routine
	echo "ANN-15-7" >> CPU-Times.log
	for number in 1 2 3 4 5 6 7 8 9 10 ; do \
	abaqus job=BarNecking_ANN-15-7 input=BarNecking_VH user=../VUHARD-ANN-3-15-7-1-sigmoid.f double=both cpus=$(CPUS) mp_mode=threads interactive ask_delete=OFF ;\
	tail -n8 BarNecking_ANN-15-7.sta | head -n1 >> CPU-Times.log ;\
	done
	# Clean files
	@for FILE in $(FILES_TARGET); do rm -f $$FILE.abq $$FILE.com $$FILE.dat $$FILE.mdl $$FILE.msg $$FILE.pac $$FILE.prt $$FILE.res $$FILE.sel $$FILE.sta $$FILE.stt ; done
	abaqus python Extract.py
	#replaceInFile "BarNecking_VA_*.plot" BarNecking_VA_ VUMAT-
	replaceInFile "BarNecking_BI_*.plot" BarNecking_BI_ Built-in-
	replaceInFile "BarNecking_VH_*.plot" BarNecking_VH_ Analytical-
	replaceInFile "BarNecking_ANN-7-4_*.plot" BarNecking_ANN-7-4_ 3-7-4-1-sig-
	replaceInFile "BarNecking_ANN-15-7_*.plot" BarNecking_ANN-15-7_ 3-15-7-1-sig-
	python3 Curves.py 

clean:
	@echo "Cleaning: $(PWD)"
	@rm -f BarNecking*.abq BarNecking*.com BarNecking*.log BarNecking*.mdl BarNecking*.msg BarNecking*.pac BarNecking*.prt BarNecking*.res BarNecking*.sel BarNecking*.stt BarNecking*.dat BarNecking*.sta

subclean: clean

