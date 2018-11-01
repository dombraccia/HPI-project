#!/bin/bash
# this script will download the reference transcriptomes of human (GRCh38.12)
# and Plasmodium falciparum and save them in HPI-project/reference_data

# downloading human reference transcriptome (GRCh38.12) from ensembl.org
wget ftp://ftp.ensembl.org/pub/release-94/fasta/homo_sapiens/cdna/* -P ../reference_data/GRCh38.p12_cDNA #cDNA ref
wget ftp://ftp.ensembl.org/pub/release-94/fasta/homo_sapiens/ncrna/* -P ../reference_data/GRCh38.p12_ncRNA/ # ncRNA ref

# downloading the Plasmodium falciparum reference transcriptome (release 40) from plasmodb.org
wget http://plasmodb.org/common/downloads/release-40/Pfalciparum/fasta/PlasmoDB-40_Pfalciparum_ESTs.fasta -P ../reference_data/pfc_ref_transcriptome_PlDB40

# indexing all reference transcriptomes using Salmon
salmon index -t ../reference_data/GRCh38.p12_cDNA/Homo_sapiens.GRCh38.cdna.all.fa.gz -i ../reference_data/GRCh38.p12_cDNA_index 

salmon index -t ../reference_data/GRCh38.p12_ncRNA/Homo_sapiens.GRCh38.ncrna.fa.gz -i ../reference_data/GRCh38.p12_ncrna_index

salmon index -t ../reference_data/pfc_ref_transcriptome_PlDB40/PlasmoDB-40_Pfalciparum_ESTs.fasta -i ../reference_data/pfc_ref_transcriptome_PlDB40_index

