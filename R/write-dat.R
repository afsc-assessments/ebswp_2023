#
write_dat <- function(output_file="output.txt",tmp=in_data){
  file_conn <- file(output_file, "w")
  # Loop through and write to the file
  for (i in 1:length(tmp)) {
    cat(paste0("#", names(tmp)[i], "\n"), file = file_conn)
    if (is.matrix(tmp[[i]])) {
      write.table(tmp[[i]], file = file_conn, row.names = FALSE, col.names = FALSE)
    } else if (is.vector(tmp[[i]])) {
      cat(paste0(tmp[[i]], collapse = " "), "\n", file = file_conn)
    } else {
      cat(paste0(tmp[[i]], "\n"), file = file_conn)
    }
  }
  # Close the file connection
  #close(file_conn)
}
