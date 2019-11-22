#1
#make data table from file
score=read.table("UWvMSU_1-22-13.txt", sep="\t", header=T, stringsAsFactors=NA)
str(score)
score
#make vector for times a team scores
times=unique(score$time)
#make data frame
total=data.frame(time=times, UW=NA, MSU=NA)
#make objects to track the teams' total scores
UWtotal=0; MSUtotal=0
#loop for times
for (i in 1:length(times)){
  curscore=score[score$time==times[i],]
  for (j in 1:nrow(temp)){
    #add scores to appropriate team's total with if else statement
    if (curscore$team[j]=="UW"){
      UWtotal=UWtotal+curscore$score[j]
      }else{
        MSUtotal=MSUtotal+curscore$score[j]
      }
  }
  total$UW[i]=UWtotal
  total$MSU[i]=MSUtotal
  }
