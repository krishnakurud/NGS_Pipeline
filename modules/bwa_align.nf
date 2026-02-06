process BWA_ALIGN {

    tag "bwa_align"

    publishDir "results/aligned", mode: 'copy'

    input:
        path reads
        path ref

    output:
        path "aligned.bam"

    script:
    """
    ${params.bwa} index $ref
    ${params.bwa} mem $ref $reads | ${params.samtools} view -Sb - > aligned.bam
    """
}

