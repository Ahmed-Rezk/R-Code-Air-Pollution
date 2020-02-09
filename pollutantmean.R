pollutantmean <- function(directory,pollutant,id=1:332){
  file_names_vector <- list.files(directory, full.names=TRUE)
  count <- 0
  values <- vector()
  if (pollutant == "sulfate"){
    for(i in seq_along(id)){
      df <- read.csv(file_names_vector[id[i]])
      x <- df[ ,2]
      count <- length(x[!is.na(x)]) + count
      values[i] <- sum(df[ ,2], na.rm=TRUE)
    }
  } else if(pollutant == "nitrate"){
    for(i in seq_along(id)){
      df <- read.csv(file_names_vector[id[i]])
      x <- df[ ,3]
      count <- length(x[!is.na(x)]) + count
      values[i] <- sum(df[ ,3], na.rm=TRUE)
    }
  }
  if (pollutant == "sulfate"){
    means <- sum(values)/count
  } else if (pollutant == "nitrate"){
     means <- sum(values)/count
  }
  means
}

pollutantmean("C:/Users/Ahmed Rezk/Desktop/RStudio/Data Science - JHU/specdata","nitrate")
