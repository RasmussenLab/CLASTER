#!/bin/bash
#SBATCH --job-name=mC                       # Job name
#SBATCH --mail-type=END,FAIL                # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=name@org                # Where to send mail	
#SBATCH --ntasks=1                          # Run on a single CPU
#SBATCH --mem=8gb                           # Job memory request
#SBATCH --time=04-00:00:00                  # Time limit hrs:min:sec
#SBATCH --output=mC_%j.log                  # Standard output and error log

module load singularity/3.8.0
module load jdk/1.8.0_291
module load openjdk/11.0.0
module load nextflow/22.04.3

nextflow pull https://github.com/open2c/distiller-nf
nextflow run /path_to_scripts/distiller/distiller.nf -params-file 250221_SRR5972844.yml -profile custom --custom_config configs/dangpu_half.config

