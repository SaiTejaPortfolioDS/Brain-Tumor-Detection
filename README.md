# Brain Tumor Detection — R-Based Image Segmentation

![R](https://img.shields.io/badge/R-4.3-276DC3?logo=r&logoColor=white)
![Bioconductor](https://img.shields.io/badge/Bioconductor-EBImage-85C220)
![Domain](https://img.shields.io/badge/Domain-Clinical%20%2F%20Biomedical%20Imaging-red)
![Images](https://img.shields.io/badge/Dataset-500%2B%20MRI%20Scans-lightgrey)

## Overview

An R-based image processing and segmentation pipeline for detecting brain tumors in grayscale MRI scans. The workflow applies classical biomedical image analysis techniques — preprocessing, Otsu thresholding, morphological operations, and connected component labeling — to isolate and classify hyperintense tumor regions.

**Sample data (30 synthetic MRI images) is included** in `data/` so the notebook runs immediately. Instructions for the full 500+ image dataset are provided below.

---

## Pipeline

```
MRI Scans (grayscale PNG/JPG)
        │
        ▼
Preprocessing
  ├── Grayscale normalization [0, 1]
  ├── Gaussian smoothing (σ = 1.5) — noise reduction
  └── Histogram equalization — contrast enhancement
        │
        ▼
Segmentation
  ├── Otsu's adaptive thresholding → binary mask
  ├── Morphological opening/closing → noise removal
  ├── Hole filling (fillHull)
  └── Connected component labeling (bwlabel)
        │
        ▼
Feature Extraction (per image)
  ├── Mean / max / SD pixel intensity
  ├── Intensity skewness
  ├── Bright-region area & mean
  ├── Number of connected components
  └── Circularity of largest component
        │
        ▼
Classification
  └── K-means (k=2) on 6 extracted features
        │
        ▼
Evaluation
  └── Sensitivity · Specificity · Accuracy · F1 · AUC / ROC
```

---

## Key Results (Sample Dataset)

| Metric | Value |
|--------|-------|
| Sensitivity (Recall) | Reported after running notebook |
| Specificity | Reported after running notebook |
| Accuracy | Reported after running notebook |
| AUC | Reported after running notebook |

> Run `Brain_Tumor_Detection_Segmentation.Rmd` to generate live metrics on your dataset.

---

## Clinical Relevance

- **T2-weighted hyperintensity** — bright regions in grayscale MRI correspond to pathological tissue (edema, active tumor)
- **Morphological operations** mimic radiologist review — removing spurious bright artifacts while preserving coherent tumor masses
- **Feature extraction** quantifies the hallmark characteristics radiologists use: lesion area, intensity, and shape irregularity
- Pipeline architecture is directly transferable to CMS/EHR imaging workflows and clinical decision support systems

---

## Dataset

### Included (sample)
```
data/
├── tumor/        ← 15 synthetic MRI scans with simulated tumor regions
└── no_tumor/     ← 15 synthetic MRI scans without tumors
```

### Full Dataset (500+ real MRI scans)
Download the **Brain Tumor MRI Dataset** from Kaggle:
- [masoudnickparvar/brain-tumor-mri-dataset](https://www.kaggle.com/datasets/masoudnickparvar/brain-tumor-mri-dataset)
- Classes: `glioma`, `meningioma`, `pituitary`, `notumor`
- Replace `data/tumor/` and `data/no_tumor/` with the downloaded folders

---

## Tech Stack

| Package | Source | Purpose |
|---------|--------|---------|
| `EBImage` | Bioconductor | Core image processing, segmentation, morphology |
| `ggplot2` | CRAN | Feature distribution plots, ROC curve |
| `dplyr` / `tidyr` | CRAN | Feature dataframe manipulation |
| `pROC` | CRAN | ROC curve and AUC computation |
| `gridExtra` | CRAN | Multi-panel visualization layout |

---

## Setup & Usage

```r
# Step 1: Install packages (run once)
source("install_packages.R")
```

```bash
# Step 2: Render the notebook
Rscript -e "rmarkdown::render('Brain_Tumor_Detection_Segmentation.Rmd')"
```

Or open `Brain_Tumor_Detection_Segmentation.Rmd` in **RStudio** and click **Knit**.

---

## File Structure

```
Brain-Tumor-Detection/
├── Brain_Tumor_Detection_Segmentation.Rmd   ← Main analysis notebook
├── install_packages.R                        ← One-time package installer
├── data/
│   ├── tumor/                                ← Tumor MRI images
│   └── no_tumor/                             ← Normal MRI images
└── README.md
```

---

## Author

**Mohan Venkata Pavan Sai Teja Kattiboyina**
MS Business Analytics & AI — University of Texas at Dallas
Healthcare Operations Research Associate — UTD Optimization & Scheduling Lab

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?logo=linkedin)](https://www.linkedin.com/in/saitejakmvp/)
[![Portfolio](https://img.shields.io/badge/Portfolio-saitejaportfolio.com-00897B)](https://saitejaportfolio.com)
