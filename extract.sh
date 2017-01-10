#! /bin/bash

infile=$1
outdir=$2

indir=$(realpath $(dirname ${infile}))
outdir=$(realpath ${outdir})
infilebn=$(basename ${infile})

docker run --rm -t -i \
  -v ${indir}:/firmware-in:ro \
  -v ${outdir}:/firmware-out \
  "phretor/firmware-extractor:latest" \
  /home/extractor/extractor/extractor.py \
  -np \
  /firmware-in/${infilebn} \
  /firmware-out
