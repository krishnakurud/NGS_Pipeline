process FASTQC {

    tag "$sample"

    publishDir "results/fastqc", mode: 'copy'

    input:
        path sample

    output:
        path "*_fastqc.zip"
        path "*_fastqc.html"

    script:
    """
   ${params.fastqc} $sample
    """
}
