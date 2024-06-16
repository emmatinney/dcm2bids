#!/bin/bash
#SBATCH --job-name=dcm2bids
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4G

#this script will run dcm2bids. the first four lines are loading the correct paths. to run, type in terminal sbatch run_dcm2bids_TECHS.sh

#right now, it is set to run one subject. You can replace Techs_01 with whatever subject you are running. 

RAW_DIR=/work/cnelab/TECHS/MRI
module load singularity
module load discovery
module load anaconda3/2022.05
export SINGULARITY_BIND="/work/cnelab/TECHS:/mnt,/shared/centos7"
mx=/shared/container_repository/dcm2bids/dcm2bids_2.1.9.sif
subj=ID
#while read subj

#do 
    singularity exec ${mx} dcm2bids -d /mnt/MRI/sourcedata/techs${subj}/Techs_${subj}_ses-1 -p ${subj} -s 1 -c /mnt/MRI/BIDS_NEW/BIDS_config_old.json -o /mnt/MRI/BIDS_NEW/
#done < ${RAW_DIR}/BIDS_NEW/subj.txt

#dcm2bids -d ${RAW_DIR}/sourcedata/techs09/Techs_09_ses-1 -p 09 -s 1 -c ${RAW_DIR}/BIDS/BIDS_config.json -o ${RAW_DIR}/BIDS/
#if you are running more than one subject at a time, you can edit the subj.txt file and add the names of the subjects you are running
# you will have to remove the # from the start of the lines below
#while read subj

#do 

	#dcm2bids -d ${RAW_DIR}/raw/Techs_01 -p ${subj} -s pre -c ${RAW_DIR}/BIDS/BIDS_config.json -o ${RAW_DIR}/BIDS/ 

	#echo ${subj}
#done < ${RAW_DIR}/subj.txt
