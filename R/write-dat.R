#' Write Data to Text File
#'
#' This function takes a list of data elements (matrices, vectors, or other values)
#' and writes them to a specified text file. Each data element in the list is preceded
#' by a comment line indicating its name.
#'
#' @param output_file A character string specifying the name of the output text file.
#' Default is "output.txt".
#' @param indata A list containing the data elements to be written to the file.
#' Each element can be a matrix, a vector, or any other value. Default is `in_data`.
#'
#' @return This function doesn't return a value; it writes to the specified output file.
#' @export
#'
#' @examples
#' # Assuming 'data_list' is a list of data elements
#' # write_dat(output_file = "sample_output.txt", indata = data_list)
write_dat <- function(output_file="runs/dat/newfile.dat", indata=in_data) {
  file_conn <- file(output_file, "w")
  # Loop through and write to the file
  for (i in 1:length(indata)) {
    cat(paste0("#", names(indata)[i], "\n"), file = file_conn)
    if (is.matrix(indata[[i]])) {
      write.table(indata[[i]], file = file_conn, row.names = FALSE, col.names = FALSE)
    } else if (is.vector(indata[[i]])) {
      cat(paste0(indata[[i]], collapse = " "), "\n", file = file_conn)
    } else {
      cat(paste0(indata[[i]], "\n"), file = file_conn)
    }
  }
  # Close the file connection
  close(file_conn)
}
