# Repeat Counting by Alignment
## Alexis Stutzman
###Winter-Spring 2024
This repository contains scripts used to align reads from fastq files to a known set of heterochromatic repeats in D. melanogaster. To briefly summarize, I made a custom fasta file, `repeats.fa`, that has all the repeats I’m interested in listed. Then, I aligned my RNAseq fastqs to that file, split the bams by repeat name, and then counted all the reads that mapped to those repeats. Here’s the way to run the files:
1. Submit snakefile to align everything to repeats. Currently, this is written to use Bowtie for alignment.
2. Once all the bam files are generated, copy the contents of helper-scripts to Bam and run them. The first helper script is called 1.split.sh and will divide the Bam files by repeat name.
3. Run the second helper script, 2.count.sh , to generate count count-[REPEAT].txt files and counts.tsv. The .txt files should be populated with numbers that give the count for the number of reads aligned to that repeat. Each line is a different Bam file and they’re listed in alphabetical order (apologies, adding row names is one thing I really need to do!). This script also outputs counts.tsv, which combines all the count-[REPEAT].txt files. Each column is a different repeat (again alphabetical order- so sorry) and each row is a different Bam file.


```
# STEP 1: align RNAseq fastqs to repeats.fa. Make sure python is loaded. You can use the pairedEnd Snakefile instead of singleEnd if you prefer.
nohup bash slurmSubmission.sh Snakefile-alignOnly-noSpikeIn-singleEnd & disown

# STEP 2: divide Bam files by repeat name
mv helper-scripts/*.sh Bam
cd Bam
sbatch 1.split.sh

# STEP 3: Count number of reads in each bam file (one bam file per RNAseq sample, per repeat)
bash 2.split.sh
```
