complete <- function(directory,id=1:332){
  file_names_vector <- list.files(directory, full.names=TRUE)
  id_vector <- c(id)
  count_vector <- vector()
    for(i in seq_along(id)){
      count <- 0
      df <- read.csv(file_names_vector[id[i]])
      for(j in seq_along(df[ ,2])){
        if (is.na(df[j,2]) == FALSE && is.na(df[j,3]) == FALSE){
          count <- count + 1
        }
      }
      count_vector[i] <- count
    }
  cbind(id_vector,count_vector)
}

cc <- complete("C:/Users/Ahmed Rezk/Desktop/RStudio/Data Science - JHU/specdata",1:332)
print(cc)