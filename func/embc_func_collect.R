library(rvest)

collectEmbcDocsInfo = function(url, day){
  cat('collecting ... ') 
  cat(url) 
  cat('\n')
  embc_html = read_html(url)
  ### collect docs titles
  embc_title = embc_html %>%
    html_nodes(".pTtl") %>%
    html_text()
  
  ### collect docs writers
  embc_writers = embc_html %>%
    html_nodes(".pHdr +tr +tr>td:nth-child(1)") %>%
    html_text()
  
  ### collect docs universities
  embc_univ = embc_html %>%
    html_nodes(".pHdr +tr +tr>td:nth-child(2)") %>%
    html_text()
  
  ### collect docs paper/poster type
  embc_type = embc_html %>%
    html_nodes(".pHdr") %>%
    html_text()
  
  embc_date = array(dim=length(embc_type))
  embc_docid = array(dim=length(embc_type))
  # print(length(embc_type))
  for(idx in 1:length(embc_type)){
    arr_type_splited = strsplit(embc_type[idx], split = ', ')[[1]]
    # print(arr_type_splited)
    embc_date[idx] = arr_type_splited[1]
    embc_type[idx] = strsplit(arr_type_splited[2], split = 'Add to My Program')[[1]][1]
    embc_docid[idx] = strsplit(embc_type[idx], split = ' ')[[1]][2]
  }
  
  ### declare array of docs day 
  embc_day = array(data=day, dim = length(embc_title))
  
  dfEmbc = data.frame(embc_day, embc_date, embc_type, embc_docid, embc_writers, embc_univ, embc_title, stringsAsFactors = F)
  cat('collecting ... success\n')
  return(dfEmbc)
}


collectKeywordInfo = function(url){
  cat('collecting ... ') 
  cat(url) 
  cat('\n')
  embc_html = read_html(url)
  ### collect docs titles
  embc_keywords = embc_html %>%
    html_nodes(".lHdr ~tr td:first-child") %>%
    html_text()
  embc_keywords 
  # filtering keywords char length > 1
  embc_keywords = Filter(f = function(elem){ nchar(elem) > 1}, x = embc_keywords)
  
  embc_docids = embc_html %>%
    html_nodes('.lHdr ~tr td:nth-child(2)') %>%
    html_text()
  # remove Top link elements
  embc_docids = Filter(f = function(elem){ elem != 'Top'}, x = embc_docids)
  
  embc_doc_count = array(dim = length(dfEmbcKetWords$embc_docids))
  for(idx in  1:length(dfEmbcKetWords$embc_docids)){
    strVecDocIds = strsplit(dfEmbcKetWords$embc_docids[idx], split = ', ')[[1]]
    embc_doc_count[idx] = length(strVecDocIds)
  }
  cat('collecting ... success\n')
  return(data.frame(embc_keywords, embc_doc_count, embc_docids, stringsAsFactors = F))
}