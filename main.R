install.packages('rvest')
library(rvest)

source('./func/embc_func_collect.R')

embc_webs = list(
  wed = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_2.html'
  , thu = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_3.html'
  , fri = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_4.html'
  , sat = 'https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_5.html'
  )

length(embc_webs)

dfEmbc = data.frame()
for(idx in 1:length(embc_webs))
  dfEmbc = rbind(dfEmbc, collectEmbcDocsInfo(embc_webs[[idx]], names(embc_webs)[idx]))

head(dfEmbc)

# embc_html = html('https://embs.papercept.net/conferences/conferences/EMBC17/program/EMBC17_ContentListWeb_2.html')
# 
# day = 'wed'
# 
# ### 제목 수집
# embc_docs = embc_html %>%
#   html_nodes(".pTtl") %>%
#   html_text()
# 
# ### 저자 수집
# embc_writers = embc_html %>%
#   html_nodes(".pHdr +tr +tr>td:nth-child(1)") %>%
#   html_text()
# 
# ### 저자 대학 수집
# embc_univ = embc_html %>%
#   html_nodes(".pHdr +tr +tr>td:nth-child(2)") %>%
#   html_text()
# 
# dfEmbc = data.frame(embc_docs, embc_writers, embc_univ ,stringsAsFactors = F)
# 
# 
# head(sort(table(embc_univ), decreasing = T), n = 20)
