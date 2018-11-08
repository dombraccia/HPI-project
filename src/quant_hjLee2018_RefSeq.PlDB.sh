#!/bin/bash
for fn in ERR2265{592..644};
do
samp=`basename ${fn}`
echo "Processing sample ${samp}"
reference_location=../reference_data
sample_location=../sample_data/hjLee_2018
salmon quant -i ${reference_location}/GRCh38.p12_and_PlDB40_index -l A \
	-1 ${sample_location}/raw/${samp}/${samp}_1.fastq.gz \
	-2 ${sample_location}/raw/${samp}/${samp}_2.fastq.gz \ 
	-p 8 -o ${sample_location}/processed/${samp}_quant
done 
