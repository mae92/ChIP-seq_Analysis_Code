#!/bin/bash
# see http://core.sam.pitt.edu/node/5678
#SBATCH -N 1
#SBATCH -t 3-00:00:00   # 3 days
#SBATCH --c 16 # Request 16 cores.
#SBATCH --mem=2048g
#SBATCH --job-name=ChIPseq

module getdefault

#set working directory path
dir=/bgfs/karndt/mae_chipseq_re_analysis_093019
#set working directory
cd "$dir"

mkdir qc_analysis
cd qc_analysis


#run multiBigwigSummary
#run using 10 bp bins

multiBigwigSummary bins \
--bwfiles \
"$dir"/bigwig/WT_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_IgG_2_spike_in_normalized.bw \
--smartLabels \
--outFileName BigWigSummary_Mutant_Experiment_10bp_bins.npz \
--binSize 10 \
--distanceBetweenBins 0 \
--numberOfProcessors "max" \
--outRawCounts BigWigSummary_Mutant_Experiment_10bp_bins.tsv

#--blackListFileName blacklist.bed \


multiBigwigSummary bins \
--bwfiles \
"$dir"/bigwig/Spt6-AID_DMSO_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Input_2_spike_in_normalized.bw \
--smartLabels \
--outFileName BigWigSummary_AID_Experiment_10bp_bins.npz \
--binSize 10 \
--distanceBetweenBins 0 \
--numberOfProcessors "max" \
--outRawCounts BigWigSummary_AID_Experiment_10bp_bins.tsv



#--blackListFileName blacklist.bed \


plotCorrelation \
--corData BigWigSummary_Mutant_Experiment_10bp_bins.npz \
--corMethod 'pearson' \
--whatToPlot 'heatmap' \
--plotNumbers \
--removeOutliers \
--plotHeight 20 \
--plotWidth 20 \
--plotFile BigWigSummary_Mutant_Experiment_10bp_bins_pearson_correlation_heatmap.png


plotCorrelation \
--corData BigWigSummary_AID_Experiment_10bp_bins.npz \
--corMethod 'pearson' \
--whatToPlot 'heatmap' \
--plotNumbers \
--removeOutliers \
--plotHeight 20 \
--plotWidth 20 \
--plotFile BigWigSummary_AID_Experiment_10bp_bins_pearson_correlation_heatmap.png



plotPCA -in BigWigSummary_Mutant_Experiment_10bp_bins.npz \
-o BigWigSummary_Mutant_Experiment_10bp_bins_PCA.png \
--plotHeight 20 \
--plotWidth 20 \
-T "PCA"

plotPCA -in BigWigSummary_AID_Experiment_10bp_bins.npz \
-o BigWigSummary_AID_Experiment_10bp_bins_PCA.png \
--plotHeight 20 \
--plotWidth 20 \
-T "PCA"


#Check DMSO vs WT

multiBigwigSummary bins \
--bwfiles \
"$dir"/bigwig/WT_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Input_2_spike_in_normalized.bw \
--smartLabels \
--outFileName BigWigSummary_WT_vs_AIDtag_with_DMSA_10bp_bins.npz \
--binSize 10 \
--distanceBetweenBins 0 \
--numberOfProcessors "max" \
--outRawCounts BigWigSummary_WT_vs_AIDtag_with_DMSA_10bp_bins.tsv


plotCorrelation \
--corData BigWigSummary_WT_vs_AIDtag_with_DMSA_10bp_bins.npz \
--corMethod 'pearson' \
--whatToPlot 'heatmap' \
--plotNumbers \
--removeOutliers \
--plotHeight 20 \
--plotWidth 20 \
--plotFile BigWigSummary_WT_vs_AIDtag_with_DMSA_10bp_bins_pearson_correlation_heatmap.png




#All in one 

multiBigwigSummary bins \
--bwfiles \
"$dir"/bigwig/WT_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/WT_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/WT_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/spt6_50_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_DMSO_Input_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Rpb3_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Rpb3_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt5_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt5_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt6_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Spt6_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_HSV_Paf1_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_IgG_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_IgG_2_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Input_1_spike_in_normalized.bw \
"$dir"/bigwig/Spt6-AID_IAA_Input_2_spike_in_normalized.bw \
--smartLabels \
--outFileName BigWigSummary_ALL_FILES_10bp_bins.npz \
--binSize 10 \
--distanceBetweenBins 0 \
--numberOfProcessors "max" \
--outRawCounts BigWigSummary_ALL_FILES_10bp_bins.tsv


plotCorrelation \
--corData BigWigSummary_ALL_FILES_10bp_bins.npz \
--corMethod 'pearson' \
--whatToPlot 'heatmap' \
--plotNumbers \
--removeOutliers \
--plotHeight 40 \
--plotWidth 40 \
--plotFile BigWigSummary_ALL_FILES_10bp_bins_pearson_correlation_heatmap.png


