#!/bin/bash
for fn in ERR2265{592..644};
do
samp=`basename ${fn}`
echo "Processing sample ${samp}"
reference_location=/fs/cbcb-scratch/dbraccia/HPI-project/reference_data
salmon quant -i $reference_location/pfc_index_PlDB40 -l A 
	-1 ${samp}/${samp}_1.fastq.gz 
	-2 ${samp}/${samp}_2.fastq.gz 
	-p 8 -o quants/${samp}_quant
done 
