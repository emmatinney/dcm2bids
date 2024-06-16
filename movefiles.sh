#!/bin/bash
#!/bin/bash
#SBATCH --job-name=dcm2bids
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4G

#this is a script to move the mri files that we need.
#submit this script by typing sbatch movefiles.sh in terminal
#change directory into the raw dir. You can change the /Techs_03/ to match the participant you are working on
cd /work/cnelab/TECHS/MRI/sourcedata/techs22/Techs_22_ses-1/Morris_Tinney_1026_Techs\ -\ 1/

#now we copy every folder into the folder above. 
cp -rf anatT1w_acqvNav4e_run01_RMS_14 .. 
cp -rf asl_acqpcaslTgseMultidelayAdultPld_21 ..
cp -rf dwi_acqdMriHcpDir98_dirAP_18 ..
cp -rf dwi_acqdMriHcpDir98_dirPA_20 ..
cp -rf fmap_acqdMriHcp_run01_dirAP_15 ..
cp -rf fmap_acqdMriHcp_run01_dirPA_16 ..
cp -rf fmap_acqrest_dirAP_5 ..
cp -rf fmap_acqrest_dirPA_6 ..
cp -rf func_taskrest_dirPA_8 ..

#now run run_dcm2bids_TECHS.sh by typing sbatch run_dcm2bids_TECHS.sh

