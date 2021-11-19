# targets_bioinfo_example

This shows how the [targets](https://docs.ropensci.org/targets/) R package can be used to maintain a bioinformatics workflow.

This simple workflow downloads some paired-end reads and trims them with `fastp`.

Required software:
- Conda
- Docker

## Running the example

1. Create a conda environment for running R:

```
conda env create -f environment.yml
```

2. Install all required R packages:

```
conda activate renv
Rscript -e 'renv::restore()'
```

3. Run the workflow:

```
Rscript -e 'targets::tar_make()'
```

At the end, you should see `R1_trim.fq`, `R2_trim.fq`, and `trim_report.html` in the project (working) directory.

---

For more information, [see this blogpost]().