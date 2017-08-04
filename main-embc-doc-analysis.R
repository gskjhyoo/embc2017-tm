install.packages('SnowballC')
install.packages('tm')
library(SnowballC)
library(tm)

df_data = read.csv('./result/embc_docs_total_inform.csv')

head(table(df_data$embc_univ), n = 30)

length(table(df_data$embc_univ))

#################

cps_embc_title = Corpus(VectorSource(df_data$embc_title))

cps_embc_title = tm_map(cps_embc_title, stripWhitespace)
cps_embc_title = tm_map(cps_embc_title, removePunctuation)
cps_embc_title = tm_map(cps_embc_title, removeNumbers)
cps_embc_title = tm_map(cps_embc_title, stemDocument)
cps_embc_title = tm_map(cps_embc_title, tolower)
cps_embc_title = tm_map(cps_embc_title, removeWords, stopwords('english'))

tdm_embc_title = TermDocumentMatrix(cps_embc_title)

tdm_embc_title = removeSparseTerms(tdm_embc_title, sparse = 0.99)

matData = as.matrix(tdm_embc_title)
matTerm = matData %*% t(matData)
freqData = c()
nameData = c()
for(i in 1:nrow(matTerm)){
  freqData = c(freqData, matTerm[i,i])
  nameData = c(nameData, rownames(matTerm)[i])
  matTerm[i,i] = 0
}

# 네트워크 다이어그램(공출현 빈도수 테이블) 저장 
write.csv(x = matTerm, file = './result/embc_docs_total_network.csv')
# 빈도 저장
write.csv(x = data.frame(word = nameData, count = freqData), file = './result/embc_docs_total_freq.csv')
dfFreqData = data.frame(word = nameData, count = freqData)
# findFreqTerms(tdm_embc_title, lowfreq = 5)
# term_frequency = rowSums(as.matrix(tdm_embc_title))
# term_frequency = subset(term_frequency, term_frequency >= 2)
