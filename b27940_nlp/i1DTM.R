# 安装并加载必要的包
# install.packages(c("tm", "SnowballC"), repos='http://cran.us.r-project.org')

library(tm)
library(SnowballC)

# 定义语料库的源
corpusSource <- DirSource(directory = "docs")


corpus <- Corpus(corpusSource)


corpus <- tm_map(corpus, content_transformer(tolower)) 
corpus <- tm_map(corpus, removeNumbers) 
corpus <- tm_map(corpus, removePunctuation) 
corpus <- tm_map(corpus, removeWords, stopwords("english")) 
corpus <- tm_map(corpus, stripWhitespace) 
corpus <- tm_map(corpus, stemDocument) 

# 创建一个文档-术语矩阵
dtm <- DocumentTermMatrix(corpus)

# 删除稀疏项
dtm <- removeSparseTerms(dtm, 0.6)


freq_terms <- findFreqTerms(dtm, lowfreq = 2)

# 查看这些术语
print(freq_terms)

# 显示 DTM
inspect(dtm[1:15, 1:15])


'''
<<DocumentTermMatrix (documents: 15, terms: 15)>>
Non-/sparse entries: 113/112
Sparsity           : 50%
Maximal term length: 7
Weighting          : term frequency (tf)
Sample             :
              Terms
Docs           come even eye father good king speak thing think will
  book_1_1.txt    2    0   1      1    2    3     2     1     1    1
  book_1_2.txt    1    1   1      0    1    4     5     0     1    1
  book_1_3.txt    3    1   1      1    1    2     5     2     1    1
  book_1_4.txt    1    0   1      1    0    2     1     0     2    1
  book_1_5.txt    0    0   2      3    3    5     1     1     0    3
  book_1_6.txt    2    0   1      7    0    3     0     2     1    1
  book_2_3.txt    0    1   2      0    1    0     0     1     1    2
  book_2_5.txt    0    3   0      0    1    0     0     1     1    0
  book_3_2.txt    1    2   0      0    1    0     1     3     0    4
  book_3_3.txt    0    0   1      0    2    1     0     0     0    3

'''





















