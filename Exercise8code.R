#1
#make data table from file
score=read.table("UWvMSU_1-22-13.txt", sep="\t", header=T, stringsAsFactors=NA)
str(score)
score
#make vector for times a team scores
time=unique(score$time)
