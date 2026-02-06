nextflow.enable.dsl = 2

include { VARIANT_WORKFLOW } from './workflow/variant_workflow.nf'

workflow {

    reads = file(params.reads)
    ref   = file(params.ref)

    VARIANT_WORKFLOW(reads, ref)
}

