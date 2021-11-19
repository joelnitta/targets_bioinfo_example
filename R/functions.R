#' Download an example readfile
#'
#' @param read Name of readfile
#'
#' @return Path to readfile
#' 
download_read <- function(read) {
	# Download readfile
	download.file(
		url = paste0(
			"https://raw.githubusercontent.com/OpenGene/fastp/master/testdata/", 
			read),
		destfile = read)
	# Return path to readfile
	read
}

#' Run fastp in paired-end mode
#'
#' @param read_1 Path to input read 1
#' @param read_2 Path to input read 2
#' @param read_1_out Path write output (trimmed) read 1
#' @param read_2_out Path write output (trimmed) read 2
#' @param html_out  Path write output html report
#'
#' @return Character vector of paths to output files
#' 
fastp <- function(read_1, read_2, read_1_out, read_2_out, html_out) {
	# Run fastp in docker
	babelwhale::run(
		# Name of docker image, with tag specifying version
		"quay.io/biocontainers/fastp:0.23.1--h79da9fb_0",
		# Command to run
		command = "fastp",
		# Arguments to the command
		args = c(
			# fastq input files
			"-i", paste0("/wd/", read_1), 
			"-I", paste0("/wd/", read_2), 
			# fastq output files
			"-o", paste0("/wd/", read_1_out),
			"-O", paste0("/wd/", read_2_out),
			# trim report file
			"-h", paste0("/wd/", html_out)
		),
		# Volume mounting specification
		volumes = paste0(getwd(), ":/wd/")
	)
	# Return path to output
	c(read_1_out, read_2_out, html_out)
}