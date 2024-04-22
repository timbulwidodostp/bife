# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Binary Choice Models with Fixed Effects Use Package bife With (In) R Software
install.packages("readxl")
install.packages("httr")
install.packages("bife")
library("readxl")
library("httr")
library("bife")
# Import Data Excel Into R From Github Olah Data Semarang (timbulwidodostp)
github_link <- "https://github.com/timbulwidodostp/bife/raw/main/bife/bife.xlsx"
temp_file <- tempfile(fileext = ".xlsx")
req <- GET(github_link, 
# authenticate using GITHUB_PAT
authenticate(Sys.getenv("GITHUB_PAT"), ""),
# write result to disk
write_disk(path = temp_file))
bife <- readxl::read_excel(temp_file)
# Estimate Binary Choice Models with Fixed Effects Use Package bife With (In) R Software
# Fit a static logit model
bife <- bife(LFP ~ I(AGE^2) + log(INCH) + KID1 + KID2 + KID3 + factor(TIME) | ID, bife)
summary(bife)
# Apply analytical bias correction
bife_bc <- bias_corr(bife)
summary(bife_bc)
# Binary Choice Models with Fixed Effects Use Package bife With (In) R Software
# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Finished
