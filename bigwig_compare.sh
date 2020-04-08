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

#rm -rf analysis

#mkdir analysis
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/WT_Rpb3_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/WT_Rpb3_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/WT_Rpb3.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/spt6_50_Rpb3_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/spt6_50_Rpb3_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/spt6_50_Rpb3.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/WT_Spt6_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/WT_Spt6_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/WT_Spt6.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/spt6_50_Spt6_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/spt6_50_Spt6_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/spt6_50_Spt6.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/WT_HSV_Paf1_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/WT_HSV_Paf1_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/WT_HSV_Paf1.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/spt6_50_HSV_Paf1_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/spt6_50_HSV_Paf1_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/spt6_50_HSV_Paf1.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/WT_Input_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/WT_Input_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/WT_Input.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/spt6_50_Input_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/spt6_50_Input_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/spt6_50_Input.bw


##Sequencing Run 2 BigWig Files

# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_IAA_HSV_Paf1.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_IAA_Rpb3_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_IAA_Rpb3_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_IAA_Rpb3.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_DMSO_Rpb3_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_DMSO_Rpb3_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_DMSO_Spt6_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_DMSO_Spt6_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_DMSO_Spt6.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_IAA_Spt6_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_IAA_Spt6_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_IAA_Spt6.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_DMSO_Spt5_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_DMSO_Spt5_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_DMSO_Spt5.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_IAA_Spt5_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_IAA_Spt5_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_IAA_Spt5.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_IAA_IgG_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_IAA_IgG_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_IAA_IgG.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_DMSO_IgG_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_DMSO_IgG_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_DMSO_IgG.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/WT_IgG_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/WT_IgG_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/WT_IgG.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/spt6_50_IgG_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/spt6_50_IgG_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/spt6_50_IgG.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/WT_Spt5_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/WT_Spt5_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/WT_Spt5.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/spt6_50_Spt5_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/spt6_50_Spt5_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/spt6_50_Spt5.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_DMSO_Input_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_DMSO_Input_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_DMSO_Input.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/bigwig/Spt6-AID_IAA_Input_1_spike_in_normalized.bw \
# --bigwig2 "$dir"/bigwig/Spt6-AID_IAA_Input_2_spike_in_normalized.bw \
# --pseudocount 0.1 \
# --operation mean \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_AID_IAA_Input.bw



###Comparisons

#Mutant
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/spt6_50_Rpb3.bw \
# --bigwig2 "$dir"/analysis/WT_Rpb3.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Rpb3_mutant_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/spt6_50_Spt6.bw \
# --bigwig2 "$dir"/analysis/WT_Spt6.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_mutant_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/spt6_50_Spt5.bw \
# --bigwig2 "$dir"/analysis/WT_Spt5.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt5_mutant_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/spt6_50_HSV_Paf1.bw \
# --bigwig2 "$dir"/analysis/WT_HSV_Paf1.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/HSV_Paf1_mutant_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/spt6_50_IgG.bw \
# --bigwig2 "$dir"/analysis/WT_IgG.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/IgG_mutant_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/spt6_50_Input.bw \
# --bigwig2 "$dir"/analysis/WT_Input.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Input_mutant_log2diff.bw
# 
# 
# #Acute Depletion
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/Spt6_AID_IAA_Rpb3.bw \
# --bigwig2 "$dir"/analysis/Spt6_AID_DMSO_Rpb3.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Rpb3_depletion_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/Spt6_AID_IAA_Spt6.bw \
# --bigwig2 "$dir"/analysis/Spt6_AID_DMSO_Spt6.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt6_depletion_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/Spt6_AID_IAA_Spt5.bw \
# --bigwig2 "$dir"/analysis/Spt6_AID_DMSO_Spt5.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Spt5_depletion_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/Spt6_AID_IAA_HSV_Paf1.bw \
# --bigwig2 "$dir"/analysis/Spt6_AID_DMSO_HSV_Paf1.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/HSV_Paf1_depletion_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/Spt6_AID_IAA_IgG.bw \
# --bigwig2 "$dir"/analysis/Spt6_AID_DMSO_IgG.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/IgG_depletion_log2diff.bw
# 
# bigwigCompare \
# --bigwig1 "$dir"/analysis/Spt6_AID_IAA_Input.bw \
# --bigwig2 "$dir"/analysis/Spt6_AID_DMSO_Input.bw \
# --operation log2 \
# --binSize 1 \
# --numberOfProcessors 'max' \
# --outFileFormat 'bigwig' \
# --outFileName "$dir"/analysis/Input_depletion_log2diff.bw
# 


bigwigCompare \
--bigwig1 "$dir"/analysis/WT_HSV_Paf1.bw \
--bigwig2 "$dir"/analysis/WT_Spt6.bw \
--operation log2 \
--binSize 1 \
--numberOfProcessors 'max' \
--outFileFormat 'bigwig' \
--outFileName "$dir"/analysis/HSV_over_Spt6_WT_log2diff.bw

bigwigCompare \
--bigwig1 "$dir"/analysis/spt6_50_HSV_Paf1.bw \
--bigwig2 "$dir"/analysis/spt6_50_Spt6.bw \
--operation log2 \
--binSize 1 \
--numberOfProcessors 'max' \
--outFileFormat 'bigwig' \
--outFileName "$dir"/analysis/HSV_over_Spt6_mutant_log2diff.bw



bigwigCompare \
--bigwig1 "$dir"/analysis/WT_HSV_Paf1.bw \
--bigwig2 "$dir"/analysis/WT_Spt5.bw \
--operation log2 \
--binSize 1 \
--numberOfProcessors 'max' \
--outFileFormat 'bigwig' \
--outFileName "$dir"/analysis/HSV_over_Spt5_mutant_log2diff.bw

bigwigCompare \
--bigwig1 "$dir"/analysis/spt6_50_HSV_Paf1.bw \
--bigwig2 "$dir"/analysis/spt6_50_Spt5.bw \
--operation log2 \
--binSize 1 \
--numberOfProcessors 'max' \
--outFileFormat 'bigwig' \
--outFileName "$dir"/analysis/HSV_over_Spt5_WT_log2diff.bw



bigwigCompare \
--bigwig1 "$dir"/analysis/WT_HSV_Paf1.bw \
--bigwig2 "$dir"/analysis/WT_Rpb3.bw \
--operation log2 \
--binSize 1 \
--numberOfProcessors 'max' \
--outFileFormat 'bigwig' \
--outFileName "$dir"/analysis/HSV_over_Rpb3_mutant_log2diff.bw

bigwigCompare \
--bigwig1 "$dir"/analysis/spt6_50_HSV_Paf1.bw \
--bigwig2 "$dir"/analysis/spt6_50_Rpb3.bw \
--operation log2 \
--binSize 1 \
--numberOfProcessors 'max' \
--outFileFormat 'bigwig' \
--outFileName "$dir"/analysis/HSV_over_Rpb3_WT_log2diff.bw

exit





