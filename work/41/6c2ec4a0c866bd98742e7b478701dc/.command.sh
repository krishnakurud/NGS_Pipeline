#!/bin/bash -ue
/usr/bin/bwa index chr22.fa
/usr/bin/bwa mem chr22.fa Sample1.fastq | /usr/bin/samtools view -Sb - > aligned.bam
