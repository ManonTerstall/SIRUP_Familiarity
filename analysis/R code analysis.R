#read in the csv file with the data. This can be the data for metadata, ld or both combined.
dataMetaData <- read.csv(file="path/metadata.csv""path/ld.csv""path/both.csv", header=FALSE, sep=",")

#name columns
colnames(dataMetaData) <- c("gender", "age", "degree", "country",  "method", "sort", "know", "like", "pleasant", "interest", "unexpected", "relevant", "simLike", "simDislike", "genreDiversity", "formatDiversity")

#turn second questons around, this way a high score means that it was interesting instead of non-interesting, like the other indicators
l = length(dataMetaData$gender)

for(i in 1:l){
  if(dataMetaData$interest[i] == 1){
    dataMetaData$interest[i] = 5
  } else if (dataMetaData$interest[i] == 2){
    dataMetaData$interest[i] = 4
  } else if (dataMetaData$interest[i] == 3){
    dataMetaData$interest[i] = 3
  } else if (dataMetaData$interest[i] == 4){
    dataMetaData$interest[i] = 2
  }  else if (dataMetaData$interest[i] == 5){
    dataMetaData$interest[i] = 1
  } 
}

#create a score for serendipity
serendipityScore <- c()

#serendipity occurs when it is pleasant, interesting, unexpected and relevant. So a scoe of 4 or 5 is needed for each indicator
for(i in 1:l){
  if(dataMetaData$pleasant[i] > 3 && dataMetaData$interest[i] > 3 && dataMetaData$unexpected[i] > 3 && dataMetaData$relevant[i] > 3){
    serendipityScore[i] <- 1
  } else {
    serendipityScore[i] <- 0
  }
}

dataMetaData$serendipity <- serendipityScore

#divide into like and dislike values
dataMetaDataLike <- c()
dataMetaDataDislike <- c()

for(x in 1:l){
  if(dataMetaData$simLike[x] > 1){
    dataMetaData$simLike[x] = 1
    #due to the weight added to the similarity value in case genre/format is liked. A similarity value of higher then 1 is possible. Make it to 1.
  }
  if(dataMetaData$method[x] == 'likeOnly'){
    dataMetaDataLike <- rbind(dataMetaDataLike, c(dataMetaData$simLike[x],dataMetaData$pleasant[x],dataMetaData$interest[x],dataMetaData$unexpected[x],dataMetaData$relevant[x],dataMetaData$formatDiversity[x], dataMetaData$genreDiversity[x], dataMetaData$serendipity[x], dataMetaData$gender[x]))
  }
  if(dataMetaData$method[x] == 'dislikeOnly'){
    dataMetaDataDislike <- rbind(dataMetaDataDislike, c(dataMetaData$simDislike[x],dataMetaData$pleasant[x],dataMetaData$interest[x],dataMetaData$unexpected[x],dataMetaData$relevant[x],dataMetaData$formatDiversity[x], dataMetaData$genreDiversity[x], dataMetaData$serendipity[x], dataMetaData$gender[x]))
  }
  if(dataMetaData$method[x] == 'both'){
    dataMetaDataLike <- rbind(dataMetaDataLike, c(dataMetaData$simLike[x],dataMetaData$pleasant[x],dataMetaData$interest[x],dataMetaData$unexpected[x],dataMetaData$relevant[x],dataMetaData$formatDiversity[x], dataMetaData$genreDiversity[x], dataMetaData$serendipity[x], dataMetaData$gender[x]))
    dataMetaDataDislike <- rbind(dataMetaDataDislike, c(dataMetaData$simDislike[x],dataMetaData$pleasant[x],dataMetaData$interest[x],dataMetaData$unexpected[x],dataMetaData$relevant[x],dataMetaData$formatDiversity[x], dataMetaData$genreDiversity[x], dataMetaData$serendipity[x], dataMetaData$gender[x]))
  }
}

#like
dataMetaDataLike <- as.data.frame(dataMetaDataLike)
colnames(dataMetaDataLike) <- c("simValue",'pleasant',"interest","unexpected","relevant","formatDiversity", "genreDiversity", "serendipity", "gender")

#dislike
dataMetaDataDislike <- as.data.frame(dataMetaDataDislike)
colnames(dataMetaDataDislike) <- c("simValue",'pleasant',"interest","unexpected","relevant","formatDiversity", "genreDiversity", "serendipity")

#pleasant
cor.test(dataMetaDataLike$pleasant, dataMetaDataLike$simValue, method = "spearman")
#interest
cor.test(dataMetaDataLike$interest, dataMetaDataLike$simValue, method = "spearman")
#unexpected
cor.test(dataMetaDataLike$unexpected, dataMetaDataLike$simValue, method = "spearman")
#relevant
cor.test(dataMetaDataLike$relevant, dataMetaDataLike$simValue, method = "spearman")

#pleasant
cor.test(dataMetaDataDislike$pleasant, dataMetaDataDislike$simValue, method = "spearman")
#interest
cor.test(dataMetaDataDislike$interest, dataMetaDataDislike$simValue, method = "spearman")
#unexpected
cor.test(dataMetaDataDislike$unexpected, dataMetaDataDislike$simValue, method = "spearman")
#relevant
cor.test(dataMetaDataDislike$relevant, dataMetaDataDislike$simValue, method = "spearman")

library("rms")

#logit regression
serendipityLike <- (lrm(serendipity ~ simValue, data = dataMetaDataLike))
serendipityLike
serendipityLikeGenre <- (lrm(serendipity ~ simValue * genreDiversity, data = dataMetaDataLike))
serendipityLikeGenre
serendipityLikeFormat <- (lrm(serendipity ~ simValue * formatDiversity, data = dataMetaDataLike))
serendipityLikeFormat

serendipityDislike <- (lrm(serendipity ~ simValue, data = dataMetaDataDislike))
serendipityDislike
serendipityDislikeGenre <- (lrm(serendipity ~ simValue * genreDiversity, data = dataMetaDataDislike))
serendipityDislikeGenre
serendipityDislikeFormat <- (lrm(serendipity ~ simValue * formatDiversity, data = dataMetaDataDislike))
serendipityDislikeFormat

par( mfrow = c(2,2) )
dataMetaDataLike1One <- subset(dataMetaDataLike, dataMetaDataLike$pleasant == 1)
dataMetaDataLike1Two <- subset(dataMetaDataLike, dataMetaDataLike$pleasant == 2)
dataMetaDataLike1Three<- subset(dataMetaDataLike, dataMetaDataLike$pleasant == 3)
dataMetaDataLike1Four<- subset(dataMetaDataLike, dataMetaDataLike$pleasant == 4)
dataMetaDataLike1Five<- subset(dataMetaDataLike, dataMetaDataLike$pleasant == 5)
x1 <- c(1,2,3,4,5)
y1 <- c(mean(dataMetaDataLike1One$simValue),mean(dataMetaDataLike1Two$simValue),mean(dataMetaDataLike1Three$simValue),mean(dataMetaDataLike1Four$simValue),mean(dataMetaDataLike1Five$simValue))

dataMetaDataLike2One <- subset(dataMetaDataLike, dataMetaDataLike$interest == 1)
dataMetaDataLike2Two <- subset(dataMetaDataLike, dataMetaDataLike$interest == 2)
dataMetaDataLike2Three<- subset(dataMetaDataLike, dataMetaDataLike$interest == 3)
dataMetaDataLike2Four<- subset(dataMetaDataLike, dataMetaDataLike$interest == 4)
dataMetaDataLike2Five<- subset(dataMetaDataLike, dataMetaDataLike$interest == 5)
x2 <- c(1,2,3,4,5)
y2 <- c(mean(dataMetaDataLike2One$simValue),mean(dataMetaDataLike2Two$simValue),mean(dataMetaDataLike2Three$simValue),mean(dataMetaDataLike2Four$simValue),mean(dataMetaDataLike2Five$simValue))


dataMetaDataLike3One <- subset(dataMetaDataLike, dataMetaDataLike$unexpected == 1)
dataMetaDataLike3Two <- subset(dataMetaDataLike, dataMetaDataLike$unexpected == 2)
dataMetaDataLike3Three<- subset(dataMetaDataLike, dataMetaDataLike$unexpected == 3)
dataMetaDataLike3Four<- subset(dataMetaDataLike, dataMetaDataLike$unexpected == 4)
dataMetaDataLike3Five<- subset(dataMetaDataLike, dataMetaDataLike$unexpected == 5)
x3 <- c(1,2,3,4,5)
y3 <- c(mean(dataMetaDataLike3One$simValue),mean(dataMetaDataLike3Two$simValue),mean(dataMetaDataLike3Three$simValue),mean(dataMetaDataLike3Four$simValue),mean(dataMetaDataLike3Five$simValue))

dataMetaDataLike4One <- subset(dataMetaDataLike, dataMetaDataLike$relevant == 1)
dataMetaDataLike4Two <- subset(dataMetaDataLike, dataMetaDataLike$relevant == 2)
dataMetaDataLike4Three<- subset(dataMetaDataLike, dataMetaDataLike$relevant == 3)
dataMetaDataLike4Four<- subset(dataMetaDataLike, dataMetaDataLike$relevant == 4)
dataMetaDataLike4Five<- subset(dataMetaDataLike, dataMetaDataLike$relevant == 5)
x4 <- c(1,2,3,4,5)
y4 <- c(mean(dataMetaDataLike4One$simValue),mean(dataMetaDataLike4Two$simValue),mean(dataMetaDataLike4Three$simValue),mean(dataMetaDataLike4Four$simValue),mean(dataMetaDataLike4Five$simValue))

plot(x1, y1, xlab = "Score", ylab= "Similarity Value", main="Pleasant", type="o")
plot(x2, y2, xlab = "Score", ylab= "Similarity Value", main="Interest", type="o")
plot(x3, y3, xlab = "Score", ylab= "Similarity Value", main="Unexpectedness", type="o")
plot(x4, y4, xlab = "Score", ylab= "Similarity Value", main="Relevant", type="o")

dataMetaDataDislike1One <- subset(dataMetaDataDislike, dataMetaDataDislike$pleasant == 1)
dataMetaDataDislike1Two <- subset(dataMetaDataDislike, dataMetaDataDislike$pleasant == 2)
dataMetaDataDislike1Three<- subset(dataMetaDataDislike, dataMetaDataDislike$pleasant == 3)
dataMetaDataDislike1Four<- subset(dataMetaDataDislike, dataMetaDataDislike$pleasant == 4)
dataMetaDataDislike1Five<- subset(dataMetaDataDislike, dataMetaDataDislike$pleasant == 5)
x1 <- c(1,2,3,4,5)
y1 <- c(mean(dataMetaDataDislike1One$simValue),mean(dataMetaDataDislike1Two$simValue),mean(dataMetaDataDislike1Three$simValue),mean(dataMetaDataDislike1Four$simValue),mean(dataMetaDataDislike1Five$simValue))

dataMetaDataDislike2One <- subset(dataMetaDataDislike, dataMetaDataDislike$interest == 1)
dataMetaDataDislike2Two <- subset(dataMetaDataDislike, dataMetaDataDislike$interest == 2)
dataMetaDataDislike2Three<- subset(dataMetaDataDislike, dataMetaDataDislike$interest == 3)
dataMetaDataDislike2Four<- subset(dataMetaDataDislike, dataMetaDataDislike$interest == 4)
dataMetaDataDislike2Five<- subset(dataMetaDataDislike, dataMetaDataDislike$interest == 5)
x2 <- c(1,2,3,4,5)
y2 <- c(mean(dataMetaDataDislike2One$simValue),mean(dataMetaDataDislike2Two$simValue),mean(dataMetaDataDislike2Three$simValue),mean(dataMetaDataDislike2Four$simValue),mean(dataMetaDataDislike2Five$simValue))


dataMetaDataDislike3One <- subset(dataMetaDataDislike, dataMetaDataDislike$unexpected == 1)
dataMetaDataDislike3Two <- subset(dataMetaDataDislike, dataMetaDataDislike$unexpected == 2)
dataMetaDataDislike3Three<- subset(dataMetaDataDislike, dataMetaDataDislike$unexpected == 3)
dataMetaDataDislike3Four<- subset(dataMetaDataDislike, dataMetaDataDislike$unexpected == 4)
dataMetaDataDislike3Five<- subset(dataMetaDataDislike, dataMetaDataDislike$unexpected == 5)
x3 <- c(1,2,3,4,5)
y3 <- c(mean(dataMetaDataDislike3One$simValue),mean(dataMetaDataDislike3Two$simValue),mean(dataMetaDataDislike3Three$simValue),mean(dataMetaDataDislike3Four$simValue),mean(dataMetaDataDislike3Five$simValue))

dataMetaDataDislike4One <- subset(dataMetaDataDislike, dataMetaDataDislike$relevant == 1)
dataMetaDataDislike4Two <- subset(dataMetaDataDislike, dataMetaDataDislike$relevant == 2)
dataMetaDataDislike4Three<- subset(dataMetaDataDislike, dataMetaDataDislike$relevant == 3)
dataMetaDataDislike4Four<- subset(dataMetaDataDislike, dataMetaDataDislike$relevant == 4)
dataMetaDataDislike4Five<- subset(dataMetaDataDislike, dataMetaDataDislike$relevant == 5)
x4 <- c(1,2,3,4,5)
y4 <- c(mean(dataMetaDataDislike4One$simValue),mean(dataMetaDataDislike4Two$simValue),mean(dataMetaDataDislike4Three$simValue),mean(dataMetaDataDislike4Four$simValue),mean(dataMetaDataDislike4Five$simValue))

plot(x1, y1, xlab = "Score", ylab= "Similarity Value", main="Pleasant", type="o")
plot(x2, y2, xlab = "Score", ylab= "Similarity Value", main="Interest", type="o")
plot(x3, y3, xlab = "Score", ylab= "Similarity Value", main="Unexpectedness", type="o")
plot(x4, y4, xlab = "Score", ylab= "Similarity Value", main="Relevant", type="o")

