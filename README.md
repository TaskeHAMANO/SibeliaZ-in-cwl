# SibeliaZ-in-cwl
Wrapper tool of [SibeliaZ](https://github.com/medvedevgroup/SibeliaZ) by [CWL](https://github.com/common-workflow-language/common-workflow-language) and [Docker](https://www.docker.com)

## Requirements

* cwl-runner such as [cwltool](https://github.com/common-workflow-language/cwltool)
* Docker
    * If you cannot use docker, this tool runs with `--no-container` options.
    * However, you have to install dependent tools of SibeliaZ.


## How to use

With the [CWL reference implementation](https://github.com/common-workflow-language/cwltool/) (`cwltool`), [`toil-cwl-runner`](https://toil.readthedocs.io/en/latest/running/cwl.html), or [`arvados-cwl-runner`](https://dev.arvados.org/projects/arvados/wiki/Running_Common_Workflow_Language_%28CWL%29_workflows_on_Arvados) as your `cwl-runner`:

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           sibeliaz.cwl \
           --fasta_file ${PATH_TO_FASTA_FILE1} \
           --fasta_file ${PATH_TO_FASTA_FILE2}
```

For other runners an input object is required:
> inputs.yml
```
fasta_file:
  - class: File
    path: path/to/file1
  - class: File
    path: path/to/file2
```

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           sibeliaz.cwl \
           inputs.yml
```