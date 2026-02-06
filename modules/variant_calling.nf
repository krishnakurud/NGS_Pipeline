process VARIANT_CALL {

    tag "variant_calling"

    publishDir "results/variants", mode: 'copy'

    input:
        path bam
        path ref

    output:
        path "variants.vcf"

    script:
    """
    ${params.bcftools} mpileup -Ou -f $ref $bam | ${params.bcftools} call -mv -Ov -o variants.vcf
    """
}

