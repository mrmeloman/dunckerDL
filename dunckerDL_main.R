library("googledrive")

#Read the csv file
theses <- read.csv("tezisy_2021.csv", sep = ";")

#Add row numbers
theses$rowNum <- c(1:NROW(theses))

#Create buffer variable for links to file
linkBuffer <- ""

#Path to save files to
filePath <- "D:\\R\\dunckerDL\\data\\"

for (i in 1:NROW(theses)) {
  #Extract the file ID
  linkBuffer <- strsplit(theses$Column4[i], "=")[[1]][3]
  
  #Download the file by ID and save it by a rowNum
  dl <- drive_download(
    as_id(linkBuffer),
    path = paste0(filePath, theses$rowNum[i], ".docx"),
    overwrite = TRUE)
  
}
