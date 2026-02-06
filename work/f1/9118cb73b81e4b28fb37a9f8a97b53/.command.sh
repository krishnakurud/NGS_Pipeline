#!/bin/bash -ue
/usr/bin/samtools mpileup -uf chr22.fa sorted.bam | /usr/bin/bcftools call -mv -Ov -o variants.vcf
