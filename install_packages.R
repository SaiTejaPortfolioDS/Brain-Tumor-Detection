if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("EBImage")

install.packages(c("ggplot2", "dplyr", "tidyr", "pROC",
                   "gridExtra", "viridis", "knitr", "rmarkdown"))
