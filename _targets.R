library(targets)
library(tarchetypes)
library(babelwhale)

# Set babelwhale backend for running containers
set_default_config(create_docker_config())

# Load functions
source("R/functions.R")

tar_plan(
	# Download example fastq files
	tar_file(read_1, download_read("R1.fq")),
	tar_file(read_2, download_read("R2.fq")),
	# Clean the fastq file with fastp
	tar_file(
		fastp_out, 
		fastp(read_1, read_2, "R1_trim.fq", "R2_trim.fq", "trim_report.html"
		)
	)
)