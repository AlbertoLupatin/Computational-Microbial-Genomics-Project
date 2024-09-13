#!/bin/bash

CONDA_BASE=$( conda info --base )
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate prokka

prokka -h

for f in /albertolupatin/Desktop/Genomics/Project/Samples/*
do
	mag=$( basename $f .fna)
	mkdir -p prokka_output/${mag}
	#echo $mag

	prokka /Users/albertolupatin/Desktop/Genomics/Project/Samples/${mag}.fna \
		--outdir prokka_output/${mag} \
		--compliant \
		--prefix ${mag} \
		--force
	
done

conda deactivate
