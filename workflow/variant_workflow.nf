include { FASTQC }        from '../modules/fastqc.nf'
include { BWA_ALIGN }     from '../modules/bwa_align.nf'
include { SAMTOOLS_SORT } from '../modules/samtools_sort.nf'
include { VARIANT_CALL }  from '../modules/variant_calling.nf'

workflow VARIANT_WORKFLOW {

    take:
        reads
        ref

    main:
        FASTQC(reads)

        aligned = BWA_ALIGN(reads, ref)

        sorted = SAMTOOLS_SORT(aligned)

        variants = VARIANT_CALL(sorted, ref)

    emit:
        variants
}

