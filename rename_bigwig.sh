#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 3-00:00:00   # 3 days
#SBATCH --c 8 # Request 8 cores.
#SBATCH --mem=2048g
#SBATCH --job-name=ChIPseq

module getdefault

#set working directory path
dir=/bgfs/karndt/mae_chipseq_re_analysis_093019
#set working directory
cd "$dir"


#Deeptools3 Analysis Psudocode for Quality Control to be run on the server

#Set up a directory with all bigwigs using symbolic links

#To create a new symlink (will fail if symlink exists already):
#mv /path/to/file /path/to/symlink

##Sequencing Run 1 BigWig Files

cp "$dir"/bigwig/ME001_S1_spike_in_normalized.bw "$dir"/bigwig/WT_Rpb3_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME002_S2_spike_in_normalized.bw "$dir"/bigwig/WT_Rpb3_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME003_S3_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Rpb3_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME004_S4_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Rpb3_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME005_S5_spike_in_normalized.bw "$dir"/bigwig/WT_Spt6_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME006_S6_spike_in_normalized.bw "$dir"/bigwig/WT_Spt6_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME007_S7_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Spt6_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME008_S8_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Spt6_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME009_S9_spike_in_normalized.bw "$dir"/bigwig/WT_HSV_Paf1_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME010_S10_spike_in_normalized.bw "$dir"/bigwig/WT_HSV_Paf1_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME011_S11_spike_in_normalized.bw "$dir"/bigwig/spt6_50_HSV_Paf1_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME012_S12_spike_in_normalized.bw "$dir"/bigwig/spt6_50_HSV_Paf1_2_spike_in_normalized.bw
		

cp "$dir"/bigwig/ME013_S13_spike_in_normalized.bw "$dir"/bigwig/WT_Input_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME014_S14_spike_in_normalized.bw "$dir"/bigwig/WT_Input_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME015_S15_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Input_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME016_S16_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Input_2_spike_in_normalized.bw

##Sequencing Run 2 BigWig Files

cp "$dir"/bigwig/ME017_S1_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME018_S2_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME019_S3_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME020_S4_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME021_S5_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Rpb3_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME022_S6_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Rpb3_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME023_S7_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Rpb3_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME024_S8_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Rpb3_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME025_S9_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Spt6_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME026_S10_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Spt6_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME027_S11_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Spt6_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME028_S12_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Spt6_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME029_S13_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Spt5_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME030_S14_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Spt5_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME031_S15_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Spt5_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME032_S16_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Spt5_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME033_S17_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_IgG_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME034_S18_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_IgG_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME035_S19_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_IgG_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME036_S20_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_IgG_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME037_S21_spike_in_normalized.bw "$dir"/bigwig/WT_IgG_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME038_S22_spike_in_normalized.bw "$dir"/bigwig/WT_IgG_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME039_S23_spike_in_normalized.bw "$dir"/bigwig/spt6_50_IgG_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME040_S24_spike_in_normalized.bw "$dir"/bigwig/spt6_50_IgG_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME041_S25_spike_in_normalized.bw "$dir"/bigwig/WT_Spt5_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME042_S26_spike_in_normalized.bw "$dir"/bigwig/WT_Spt5_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME043_S27_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Spt5_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME044_S28_spike_in_normalized.bw "$dir"/bigwig/spt6_50_Spt5_2_spike_in_normalized.bw


cp "$dir"/bigwig/ME045_S29_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Input_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME046_S30_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Input_1_spike_in_normalized.bw

cp "$dir"/bigwig/ME047_S31_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_DMSO_Input_2_spike_in_normalized.bw

cp "$dir"/bigwig/ME048_S32_spike_in_normalized.bw "$dir"/bigwig/Spt6-AID_IAA_Input_2_spike_in_normalized.bw



#To create or update a symlink:
#mvf /path/to/file /path/to/symlink

exit


