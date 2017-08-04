library(SnowballC)
library(tm)

dfTotalDocs = read.csv('./result/embc_docs_total_inform.csv', stringsAsFactors = F)
dfTotalDocs$embc_docid
dfHealthKeyWords = read.csv('./result/embc_keywords_health_inform.csv', stringsAsFactors = F)
dfTotalKeywords = read.csv('./result/embc_keywords_total_inform.csv', stringsAsFactors = F)

arrHIDocs <- c()
## Health Informatics 논문만 추출
for(idx in 1:nrow(dfHealthKeyWords)){
  arrHIDocs <- c(arrHIDocs, gsub(x = dfHealthKeyWords[idx,4:19][(dfHealthKeyWords[idx,4:19]) != ""], pattern = ' ', replacement = ''))
}

# gsub(x = "test ", pattern = " ", replacement = '')
arrHIDocs = names(table(arrHIDocs))
head(dfTotalKeywords$embc_docids)

arrHIKeyWrods = c()
lstHlkeyWords = list()
for(idx in 1:length(arrHIDocs)){
  arrHIKeyWrods = c(arrHIKeyWrods, dfTotalKeywords[grep(x=dfTotalKeywords$embc_docids, arrHIDocs[idx]),]$embc_keywords)
  lstHlkeyWords[[arrHIDocs[idx]]] = dfTotalKeywords[grep(x=dfTotalKeywords$embc_docids, arrHIDocs[idx]),]$embc_keywords
}

hlKeyWords = names(arrHIKeyWrodsOrdered)
dfKeyWordNW = data.frame()
for(idx in 1:length(lstHlkeyWords)){
  
  for(idx2 in 1:length(lstHlkeyWords[[idx]])){
     = 
  }
}
hlKeyWords[]


barplot(
  head(arrHIKeyWrodsOrdered, n = 10), 
  horiz=TRUE, border=NA, 
  las=1, main="test",
  names.arg = head(names(arrHIKeyWrodsOrdered), n = 10))

arrHIKeyWrodsOrdered = sort(table(arrHIKeyWrods), decreasing = T)

find()

charmatch("WeCT14-07.3", c("FrAT14.3, FrAT2.2, FrBT2.1, FrCT2.1, FrDT3-02.3, FrDT3-06.1, SaBT2.2, ThDT14-04.1, ThDT14-07.1, ThDT14-07.2, ThDT14-07.3, ThDT14-07.4, ThDT14-08.1, ThDT2-01.4, WeBT12.7, WeBT2.8, WeCT14-07.3"))
"test in gskjhyoo" %in% 'gs'
grep('gs', c('test in kjhyoo', 'test gs'))


dfTotalKeywords$embc_docids

