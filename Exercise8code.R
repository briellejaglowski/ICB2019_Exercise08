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
  for (j in 1:nrow(curscore)){
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

#start data frame with a time of zero
total=rbind(c(0,0,0), total)
#make plot for scores over time
plot(x=total$time, y=total$UW, type="line", col="purple", lwd=2,
     xlab="Time", ylab="Total Score", ylim=c(0,50), main="UW vs MSU Game")
lines(x=total$time, y=total$MSU, type="l", col="green", lwd=2)
legend("topleft", legend=c("MSU", "UW"), col=c("green", "purple"), lty=1)


#2
game=function(){
  number=sample(1:100, 1) #sample size one to 100
  guess=readline(prompt="Guess a number between 1 and 100: ")
  while (guess !=number){
    #if else loop for higher or lower numbers
    if(guess<number){
      cat("higher")
      guess=readline(prompt="Guess again: ")
    }else{
      cat("lower")
      guess=readline(prompt="Guess again: ")
    }
  } 
  cat(paste("Correct!"))
}
game()
