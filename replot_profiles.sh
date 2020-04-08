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
cd "$dir"/analysis


#Profiles

plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment_matrix.gz \
-out for_legend.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 30 \
--yMin 0 \
--legendLocation "upper-right" \
--plotFileFormat "png" \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 1 \
--yMin -1 \
--legendLocation "upper-right" \
--plotFileFormat "png" \
--outFileNameData grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_mutant_experiment.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 1 \
--yMin -2 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_depletion_experiment.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 40 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_WT.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


plotProfile -m plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO_matrix.gz \
-out grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO.png \
--dpi 300 \
--averageType "mean" \
--plotHeight 8 \
--plotWidth 8 \
--yMax 30 \
--yMin 0 \
--legendLocation "none" \
--plotFileFormat "png" \
--outFileNameData grey_profiles_plus1nuc_CDS_CPS_deciles_all_with_downstream_region_DMSO.tsv \
--colors "#000000" "#001F33" "#003D66" "#005C99" "#007ACC" "#0099FF" "#33ADFF" "#66C2FF" "#99D6FF" "#CCEBFF"


