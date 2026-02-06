process SAMTOOLS_SORT {

    tag "samtools_sort"

    publishDir "results/sorted", mode: 'copy'

    input:
        path bam

    output:
        path "sorted.bam"

    script:
    """
    ${params.samtools} sort $bam -o sorted.bam
    """
}
