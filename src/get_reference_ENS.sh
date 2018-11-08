#!/bin/bash
# this script will download the reference transcriptomes of human (GRCh38.12)
# and Plasmodium falciparum and save them in HPI-project/reference_data

# downloading human reference transcriptome (GRCh38.p12) from Ensembl
wget ftp://ftp.ensembl.org/pub/release-94/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz -P ../reference_data/

# downloading the Plasmodium falciparum reference transcriptome from Ensembl 
wget ftp://ftp.ensemblgenomes.org/pub/protists/release-41/fasta/plasmodium_falciparum/cdna/Plasmodium_falciparum.EPr1.cdna.all.fa.gz -P ../reference_data/

# unzipping gzipped reference data files
gzip -d ../reference_data/*.gz

# concatenating all reference transcriptome .fa files to one multi-fa file for indexing by salmon
cat ../reference_data/Homo_sapiens.GRCh38.cdna.all.fa ../reference_data/Plasmodium_falciparum.EPr1.cdna.all.fa  > ../reference_data/GRCh38.p12_and_Plfc.fa

# indexing all reference transcriptomes using Salmon
salmon index -t ../reference_data/GRCh38.p12_and_Plfc.fa -i ../reference_data/GRCh38.p12_and_Plfc_index
