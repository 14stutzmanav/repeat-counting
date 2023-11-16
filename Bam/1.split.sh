#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --mem=8G

module load samtools
module load bamtools

files=*repeats_trim.bam

for file in $files; do
    bamtools split -in $file -reference
done 
