#!/bin/bash
#SBATCH --job-name=dcm2bids
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4G

#this script will run dcm2bids. the first four lines are loading the correct paths. to run, type in terminal sbatch run_dcm2bids_TECHS.sh

module purge
module load discovery
module load anaconda3/2022.05
source activate /work/cnelab/conda-dcm2bids

#right now, it is set to run one subject. You can replace Techs_* with whatever subject you are running. 

RAW_DIR=/work/cnelab/TECHS/MRI
dcm2bids -d ${RAW_DIR}/raw/Techs_04_pre -p 04 -s pre -c ${RAW_DIR}/BIDS/BIDS_config.json -o ${RAW_DIR}/BIDS/ 


#if you are running more than one subject at a time, you can edit the subj.txt file and add the names of the subjects you are running
# you will have to remove the # from the start of the lines below
#while read subj

#do 

	#dcm2bids -d ${RAW_DIR}/raw/Techs_01 -p ${subj} -c ${RAW_DIR}/BIDS/BIDS_config.json -o ${RAW_DIR}/BIDS/ 

	#echo ${subj}
#done < ${RAW_DIR}/subj.txt
