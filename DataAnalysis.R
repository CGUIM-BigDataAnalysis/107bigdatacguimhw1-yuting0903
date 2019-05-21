library(jsonlite)
library(stats)
library(base)
library(dplyr)

compare1031061<-full_join(X103education_firsttime_recurrent_majorcategory,X106education_firsttime_recurrent_majorcategory ,c("大職業別"="大職業別"))
compare1031061$gradrate<-compare1031061$`大學-薪資.y`/compare1031061$`大學-薪資.x`
compare1031061<-subset(compare1031061,gradrate>1)
arrange(compare1031061,desc(gradrate))
head(compare1031061,10)

compare103106more<-subset(compare1031061,gradrate>1.05)

compare1031063<-compare1031061
compare1031063$大職業別<-strsplit(compare1031061$大職業別,"-")
a<-c()
for(n in 1:nrow(compare1031063)){
a<-c(a,compare1031063$大職業別[n][1])}
allcategory1<-c(1:length(a))
for(n in 1:length(a)){
  allcategory1[n]<-a[[n]][1]
}
table(allcategory1)

eduorderb103<-arrange(X103education_firsttime_recurrent_majorcategory,`大學-女/男`)
eduorderb103
head(eduorderb103,10)
eduorderg103<-arrange(X103education_firsttime_recurrent_majorcategory,desc(`大學-女/男`))
head(eduorderg103,10)
eduorderb104<-arrange(X104education_firsttime_recurrent_majorcategory,`大學-女/男`)
head(eduorderb104,10)
eduorderg104<-arrange(X104education_firsttime_recurrent_majorcategory,desc(`大學-女/男`))
head(eduorderg104,10)
eduorderb105<-arrange(X105education_firsttime_recurrent_majorcategory,`大學-女/男`)
head(eduorderb105,10)
eduorderg105<-arrange(X105education_firsttime_recurrent_majorcategory,desc(`大學-女/男`))
head(eduorderg105,10)
eduorderb106<-arrange(X106education_firsttime_recurrent_majorcategory,`大學-女/男`)
head(eduorderb106,10)
eduorderg106<-arrange(X106education_firsttime_recurrent_majorcategory,desc(`大學-女/男`))
head(eduorderg106,10)

X106education_firsttime_recurrent_majorcategory$degree<-X106education_firsttime_recurrent_majorcategory$`研究所及以上-薪資`/X106education_firsttime_recurrent_majorcategory$`大學-薪資`
degree106<-arrange(X106education_firsttime_recurrent_majorcategory,desc(degree))
head(degree106,10)

interestjob<-X106education_firsttime_recurrent_majorcategory[grepl("資訊",X106education_firsttime_recurrent_majorcategory$大職業別),]
interestjobsalary<-interestjob[,c("大職業別","大學-薪資","研究所及以上-薪資")]
interestjobsalary$salarydiffer<-interestjobsalary$`研究所及以上-薪資`- interestjobsalary$`大學-薪資`
