#!/usr/bin/env cwl-runner
cwlVersion: v1.0

class: CommandLineTool

baseCommand: ["sibeliaz"]

hints:
    DockerRequirement:
        dockerImageId: ajhjhaf/sibeliaz:1.2.0
        dockerFile:
            $include: ../containers/SibeliaZ/Dockerfile

inputs:
    "fasta_file":
        type: File[]
        doc: "The input FASTA files"
        inputBinding:
            position: 1
    "k":
        type: int?
        default: 25
        doc: "The order of the de Bruijn graph being used and controls the tradeoff between the sensitivity on one hand, and speed and memory usage on the other."
        inputBinding:
            prefix: "-k"
    "b":
        type: int?
        default: 200
        doc: "The threshold of the bubbles with paths longer than that."
        inputBinding:
            prefix: "-b"
    "m":
        type: int?
        default: 50
        doc: "The threshold of the locally-collinear block size to be output."
        inputBinding:
            prefix: "-m"
    "a":
        type: int?
        default: 150
        doc: "The threhsold of k-mers size to be used."
        inputBinding:
            prefix: "-a"
    "t":
        type: int?
        default: 1
        doc: "The maximum number of threads"
        inputBinding:
            prefix: "-t"
    "f":
        type: int?
        default: 4
        doc: "The amount of memory to be permitted."
        inputBinding:
            prefix: "-f"
    "n":
        type: boolean?
        doc: "The flag whether skip the alignment and only output coordinates of the blocks."
        inputBinding:
            prefix: "-n"
    "o":
        type: string?
        doc: "The output directory name."
        default: "sibeliaz_out"
        inputBinding:
            prefix: "-o"

outputs:
    "out_direcory":
        type: Directory
        outputBinding:
            glob: "$(inputs.o)"
    "out_gff":
        type: File
        outputBinding:
            glob: "$(inputs.o)/blocks_coords.gff"
    "out_maf":
        type: File
        outputBinding:
            glob: "$(inputs.o)/alignment.maf"
