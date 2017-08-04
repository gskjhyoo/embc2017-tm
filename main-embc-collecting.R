install.packages('rvest')
library(rvest)

source('./func/embc_func_collect.R')

# 날짜에 있는 모든 내용 수집 #
embc_webs = list(
  wed = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_2.html'
  , thu = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_3.html'
  , fri = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_4.html'
  , sat = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_5.html'
  )

result_file_name = './result/embc_docs_total_inform.csv'

# dfEmbc = collectEmbcDocsInfo(embc_webs[[idx]], names(embc_webs)[idx])

dfEmbc = data.frame()
for(idx in 1:length(embc_webs))
  dfEmbc = rbind(dfEmbc, collectEmbcDocsInfo(embc_webs[[idx]], names(embc_webs)[idx]))

write.csv(file = result_file_name, x = dfEmbc)

head(dfEmbc)
# head(sort(table(embc_univ), decreasing = T), n = 20)

'.lHdr ~tr' # 키워드 수집용

keywordUrl = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_KeywordIndexWeb.html'
result_file_keyword = './result/embc_keywords_total_inform.csv'

dfEmbcKetWords = collectKeywordInfo(keywordUrl)

head(dfEmbcKetWords$embc_doc_count)

dfEmbcKetWordsOrdered = dfEmbcKetWords[order(-dfEmbcKetWords[, 2]), ]
head(dfEmbcKetWordsOrdered)



write.csv(file = result_file_keyword, x = dfEmbcKetWords)

# barplot(
#   head(dfEmbcKetWordsOrdered$embc_doc_count),
#   horiz=TRUE, border=NA,
#   las=1, main="test",
#   names.arg = head(dfEmbcKetWordsOrdered$embc_keywords))
# barplot(
#   dfFreqDataOrdered$count,
#   horiz=TRUE, border=NA,
#   las=1, main="test",
#   names.arg = dfFreqDataOrdered$word)

# library(rvest)
# embc_html = read_html(keywordUrl)
# ### collect docs titles
# embc_keywords = embc_html %>%
#   html_nodes(".lHdr ~tr td:first-child") %>%
#   html_text()
# embc_keywords # 단어 갯수 하나 제거
# # filtering keywords char length > 1
# embc_keywords = Filter(f = function(elem){ nchar(elem) > 1}, x = embc_keywords)
# 
# embc_documents = embc_html %>%
#   html_nodes('.lHdr ~tr td:nth-child(2)') %>%
#   html_text()
# # remove Top link elements
# embc_documents = Filter(f = function(elem){ elem != 'Top'}, x = embc_documents)
# df_keywords
