#!bin/bash

# this script should be used to download the data from HJ Lee et al. 2018 Science Translational Medicine Paper 

# get metadata and move to sample_data/hjLee2018 folder
wget https://www.ebi.ac.uk/arrayexpress/files/E-MTAB-6413/E-MTAB-6413.sdrf.txt
mv E-MTAB-6413.sdrf.txt metadata_hjLee2018.txt

# get raw read files
cut -f 65 metadata_hjLee2018.txt | tail -n 106 > sample_links.txt
wget -i sample_links.txt -P ../sample_data/hjLee_2018/raw

# removing all temporary files/moving files to appropriate directory
rm sample_links.txt
mv metadata_hjLee2018.txt ../sample_data/hjLee_2018

