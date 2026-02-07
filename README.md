
#  Variant Calling Pipeline using Nextflow (DSL2)

This repository contains a modular **single-end variant calling pipeline** implemented in **Nextflow DSL2**.  
The pipeline processes raw FASTQ reads, performs quality control, aligns reads to a reference genome, sorts the alignment, and finally calls variants to produce a VCF file.

All steps are implemented as **separate reusable modules**, and the main workflow stitches them together into a clean, reproducible analysis.

---

##  Quick Start

Clone the repository:

```bash
git clone <repository_url>
cd <repository_name>


Create the Conda environment:

conda env create -f environment.yml


Activate the environment used to run Nextflow:

conda activate bnf


Run the pipeline:

nextflow run main.nf


Resume a previous run:

nextflow run main.nf -resume

 Pipeline Overview

The pipeline consists of four major stages:

Quality Control of raw reads using FastQC

Read Alignment using BWA-MEM

BAM Sorting using Samtools

Variant Calling generating a VCF file

Repository Structure

Below is the folder tree exactly as in your project:

.
├── data
│   ├── Sample1.fastq
│   └── chr22.fa
├── main.nf
├── modules
│   ├── bwa_align.nf
│   ├── fastqc.nf
│   ├── samtools_sort.nf
│   └── variant_calling.nf
├── nextflow.config
├── results
│   ├── aligned
│   │   └── aligned.bam
│   ├── fastqc
│   │   ├── Sample1_fastqc.html
│   │   └── Sample1_fastqc.zip
│   ├── sorted
│   │   └── sorted.bam
│   └── variants
│       └── variants.vcf
├── work
│   └── ... (Nextflow intermediate directories)
└── workflow
    └── variant_workflow.nf

Input Files
Required:

FASTQ file (single-end):

data/Sample1.fastq


Reference genome (FASTA):

data/chr22.fa

Tools Used

The pipeline uses standard bioinformatics tools:

FastQC

BWA-MEM

Samtools (sort + index)

BCFtools (variant caller)

All dependencies are installed reproducibly using Conda through environment.yml.

Pipeline Steps (Detailed)
1. FastQC

Module: fastqc.nf
Generates HTML and ZIP QC reports for the raw FASTQ file.

Output stored in:

results/fastqc/

2. BWA Alignment

Module: bwa_align.nf
Aligns reads to the reference genome (chr22.fa).
Produces an unsorted BAM file.

Output stored in:

results/aligned/aligned.bam

3. BAM Sorting

Module: samtools_sort.nf
Sorts the aligned BAM file for downstream variant calling.

Output stored in:

results/sorted/sorted.bam

4. Variant Calling

Module: variant_calling.nf
Calls SNPs and INDELs using BCFtools (or your configured caller).
Produces:

results/variants/variants.vcf

Output Summary
Step	Output
FastQC	.html, .zip
Alignment	aligned.bam
Sorting	sorted.bam
Variant Calling	variants.vcf

All final outputs live inside the results/ directory.

Configuration
Defined in main.nf:
params.fastq  = "data/Sample1.fastq"
params.ref    = "data/chr22.fa"
params.outdir = "results"

Defined in nextflow.config:

CPU allocation

Memory settings

Retry strategy

Work directory

Run the Pipeline

From the project root:

nextflow run main.nf


Resume mode:

nextflow run main.nf -resume

Git Usage
Files tracked:

*.nf workflows and modules

nextflow.config

environment.yml

README.md

Files ignored (via .gitignore):
work/
results/
.nextflow*
*.log

Push to GitHub
git init
git add .
git commit -m "Add Nextflow variant calling pipeline"
git branch -M main
git remote add origin <repository_url>
git push -u origin main

Notes

work/ contains intermediate scratch files created by Nextflow.

results/ contains final outputs and is intentionally ignored by Git.

Pipeline is currently configured for single-end sequencing data.

You can easily extend it with more modules.




