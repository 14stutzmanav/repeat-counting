#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --mem=8G

module load samtools

files=*repeats_trim.bam
for file in $files; do
    echo $file
done | column -t > counts-fileNames.txt

files=*repeats_359bp.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-359bp.txt

files=*repeats_aacac.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-aacac.txt

files=*repeats_aagac.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-aagac.txt

files=*repeats_aagag.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-aagag.txt

files=*repeats_aagagag.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-aagagag.txt

files=*repeats_aatag.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-aatag.txt

files=*repeats_aatat.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-aatat.txt

files=*repeats_dodeca.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-dodeca.txt

files=*repeats_IGS.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-IGS.txt

files=*repeats_prodsat.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-prodsat.txt

files=*repeats_taga.bam
for file in $files; do
    samtools view -c $file
done | column -t > counts-taga.txt


paste counts-*.txt | column -s $'\t' -t > counts.tsv
