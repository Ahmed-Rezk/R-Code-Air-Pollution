corr <- function(directory,threshold=0){
        count <- 0
        count2 <- 1
        file_names_vector <- list.files(directory, full.names=TRUE)
        cc <- complete(directory,1:332)
        for (i in 1:332){
                if (cc[i,2] > threshold){
                        count <- count + 1
                }
        }
        cor_sulf_nit <- vector(mode="numeric",length=count)
        for (j in 1:332){
                if (cc[j,2] > threshold){
                        df <- read.csv(file_names_vector[j])
                        df_clean <- na.omit(df)
                        cor_sulf_nit[count2] <- cor(df_clean[ ,2], df_clean[ ,3])
                        count2 <- count2 + 1
                }
        }       
        cor_sulf_nit
}


source("complete.R")
cr <- corr("C:/Users/Ahmed Rezk/Desktop/RStudio/Data Science - JHU/specdata",2000)
n <- length(cr)                
cr <- corr("C:/Users/Ahmed Rezk/Desktop/RStudio/Data Science - JHU/specdata",1000)               
cr <- sort(cr)
print(c(n, round(cr, 4)))