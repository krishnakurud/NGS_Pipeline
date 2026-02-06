#!/bin/bash -ue
/usr/bin/bcftools mpileup -Ou -f chr22.fa sorted.bam | /usr/bin/bcftools call -mv -Ov -o variants.vcf
