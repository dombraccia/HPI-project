#!/bin/bash
# this script will download the reference transcriptomes of human (GRCh38.12)
# and Plasmodium falciparum and save them in HPI-project/reference_data

# downloading human reference transcriptome (GRCh38.p12) from NCBI's RefSeq project
wget ftp://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_rna.fna.gz -P ../reference_data/

# downloading the Plasmodium falciparum reference transcriptome (release 40) from plasmodb.org
wget http://plasmodb.org/common/downloads/release-40/Pfalciparum/fasta/PlasmoDB-40_Pfalciparum_ESTs.fasta -P ../reference_data/

# unzipping gzipped reference data files
gzip -d ../reference_data/*.gz

# concatenating all reference transcriptome .fa files to one multi-fa file for indexing by salmon
cat ../reference_data/GRCh38_latest_rna.fna ../reference_data/PlasmoDB-40_Pfalciparum_ESTs.fasta > ../reference_data/GRCh38.p12_and_PlDB40.fasta 

# indexing all reference transcriptomes using Salmon
salmon index -t ../reference_data/GRCh38.p12_and_PlDB40.fasta -i ../reference_data/GRCh38.p12_and_PlDB40_index 

