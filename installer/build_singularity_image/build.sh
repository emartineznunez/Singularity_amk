#!/bin/bash
#Execute as build.sh rev_number

singularity=/tmp/amk_installer-emilio/software/Singularity/3.6.2/bin/singularity

rev=$1

echo Building new image automekin_${rev}
$singularity build --remote automekin_${rev}.sif recipe.def

echo Signing the image
$singularity sign --keyidx 0 automekin_${rev}.sif

echo Pushing the image
$singularity push automekin_${rev}.sif library://emartineznunez/default/automekin:${rev}

