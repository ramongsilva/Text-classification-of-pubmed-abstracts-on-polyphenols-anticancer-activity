##################################################################################################
# Script for Text classification of pubmed abstracts about polyphenols anticancer activity
# Author: Ramon Gustavo Teodoro Marques da Silva - ramongsilva@yahoo.com.br


# Import libraries
library(plyr) 
library(DBI)
library(RMySQL)
library(RCurl)
library(RSQLite)
library(stringr)
library(XML)
library(rJava)
library(qdap)
library(reshape)
library(reshape2)
library(tm)
library(data.table)


##################################################################################################
# Retrieving and pre-processing of the textual corpus for training and tests
start_time <- Sys.time()

#Setting the folder with files
setwd("folder-project/")

# Reading Negative textual corpus with pubmed abstracts
df_train_neg = data.table(read.delim("train-documents-negative.txt"))
df_train_neg$abstract = as.character(df_train_neg$abstract)
df_train_neg$abstract = stripWhitespace(df_train_neg$abstract)
df_train_neg$pmid = as.character(df_train_neg$pmid)

# Reading Positive textual corpus with pubmed abstracts
df_train = data.table(read.delim("train-documents-positive.txt"))
df_train$abstract = as.character(df_train$abstract)
df_train$abstract = stripWhitespace(df_train$abstract)
df_train$pmid = as.character(df_train$pmid)

# Joining the positive and negative textual corpus for training and test
df_train_r = rbind(df_train,df_train_neg)
# Preparing of random sample
df_train_r2 <- df_train_r[sample(nrow(df_train_r)),]

#Function to clean textual corpus
cleanFun <- function(htmlString) {  
  htmlString = gsub("[&]", "", htmlString)
  htmlString = gsub("[;]", "", htmlString)
  htmlString = gsub("<.*?>", "", htmlString)
  htmlString = gsub("tumour","tumor", htmlString)
  htmlString = gsub("tumours","tumors", htmlString)  
  return(htmlString)
}

# Cleaning, transformation and pre-processing of the textual corpus
stopwords_pubmed = c('a','who', 'about','again','all','almost','also','although','always','among','an','and','another','any','are','as','at','be','because','been','before','being','between','both','but','by','can','could','do','does','done','due','during','each','either','enough','especially','for','found','from','further','had','has','have','having','here','how','however','i','if','in','into','is','it','its','itself','just','kg','km','made','mainly','make','may','mg','might','ml','mm','most','mostly','must','nearly','neither','no','nor','obtained','of','often','on','our','overall','perhaps','pmid','quite','rather','really','regarding','seem','seen','several','should','show','showed','shown','shows','significantly','since','so','some','such','than','that','the','their','theirs','them','then','there','therefore','these','they','this','those','through','thus','to','upon','use','used','using','various','very','was','we','were','what','when','which','while','with','within','without','would')
stopwords_analyisis = c('acid','cancer','consid','mani','other','particular','phenol','posit','reduc','relationship','stimul','affect','chemoprevent','concentr','develop','higher','major' ,'polyphenol','prostat','provid','studi','will','high','highest','incid','includ','present','progress','analysi','antiinhflammatori','assess','benefici','colorect','conclus','day','drug','more','previous','relat','remain','treatment','identifi','lower','observ','recent','valu','investig','data','rat','tumor','rang','similar','dietari','follow','inflammatori','one','under','contrast','given','group','marker','respons','treat','weight','collect','induct','time','base','class','radic','resveratrol','select','two','function','repres','onli','caus','method','respect','therapi','multipl','aim','wide','current','possibl','administr','side','part','same','analyz','toward','three','character','better','releas','week')
stopwords_analyisis2 = c('explor','toxic','import','oxid','first','experiment','determin','product','factor','understand','unclear','transform','aromat','refer','basi','seem','worldwid','herein','experi','lymphocyt','five','composit','comparison','along','substanc','hepat','subsequ','substanti','emerg','seven','negat','critic','divid','fold','reaction','accord','order','elev','four','whether','vitamin','use','speci','small','liver','initi','oxygen','establish','form','process','immun','melanoma','wherea','diet','chemotherapi','chemic','genistein','dna','stress','examin','contain','suggest','metabol','metabolit','number','combin','evalu','find','increas')
stopwords_analysis_neg = c('isoflavonoid','bladder','isoflavon')
df_train_r2$abstract = tolower(df_train_r2$abstract)
df_train_r2$abstract = cleanFun(df_train_r2$abstract)
df_train_r2$abstract = sub_frequent_terms(df_train_r2$abstract)
df_train_r2$abstract = stripWhitespace(df_train_r2$abstract)
df_train_r2$abstract = gsub('îº','k', df_train_r2$abstract)
df_train_r2$abstract = gsub('Îº','k', df_train_r2$abstract)
df_train_r2$abstract = gsub('îº','k', df_train_r2$abstract)
df_train_r2$abstract = gsub('Î±','alpha', df_train_r2$abstract) 
df_train_r2$abstract = gsub('î±','alpha', df_train_r2$abstract)
df_train_r2$abstract = gsub('î²','beta', df_train_r2$abstract)
df_train_r2$abstract = gsub('Î²','beta', df_train_r2$abstract) 
df_train_r2$abstract = gsub('1Î²','beta', df_train_r2$abstract)  
df_train_r2$abstract = gsub('1î²','beta', df_train_r2$abstract) 
df_train_r2$abstract = gsub('î³','gamma', df_train_r2$abstract)
df_train_r2$abstract = gsub('Î³','gamma', df_train_r2$abstract)
df_train_r2$abstract = gsub('î´','delta', df_train_r2$abstract)
df_train_r2$abstract = gsub('Î´','delta', df_train_r2$abstract)
df_train_r2$abstract = gsub("[^[:alnum:][:blank:]?&/\\-]", "", df_train_r2$abstract)
df_train_r2$abstract = gsub("U00..", "", df_train_r2$abstract)
df_train_r2$abstract = gsub('-induced',' induced', df_train_r2$abstract)
df_train_r2$abstract = gsub('-inhibited ',' inhibited ', df_train_r2$abstract)
df_train_r2$abstract = gsub('-inhibitory',' inhibitory', df_train_r2$abstract)
df_train_r2$abstract = removeNumbers(df_train_r2$abstract)
df_train_r2$abstract = removePunctuation(df_train_r2$abstract)
df_train_r2$abstract = removeWords(df_train_r2$abstract, stopwords_pubmed)
df_train_r2$abstract = stemDocument(df_train_r2$abstract)
df_train_r2$abstract = removeWords(df_train_r2$abstract, stopwords_analyisis)
df_train_r2$abstract = removeWords(df_train_r2$abstract, stopwords_analyisis2)
df_train_r2$abstract = removeWords(df_train_r2$abstract, stopwords_analysis_neg)
df_train_r2$abstract = gsub('\\b\\w{1}\\s',' ',df_train_r2$abstract)
df_train_r2$abstract = stripWhitespace(df_train_r2$abstract)

end_time <- Sys.time()
time = end_time - start_time
cat('\n\n\n Time    = ',time)




###################################################################################################
# Training and tests for creation of ensemble (multiplier classifier) using RTextTools R package
start_time <- Sys.time()

require(RTextTools)
# Creating a document term matrix
doc_matrix <- create_matrix(df_train_r2$abstract, language="english", ngramLength=3, removeSparseTerms=.98)
m = as.matrix(doc_matrix)
# Preparing textual copus for training and tests in the proportion of 80% for training and 20% for tests
container <- create_container(doc_matrix, df_train_r2$class, trainSize=1:320,testSize=321:399, virgin=FALSE)

# Training the models with the training textual corpus
SVM <- train_model(container,"SVM")
GLMNET <- train_model(container,"GLMNET")
MAXENT <- train_model(container,"MAXENT")
SLDA <- train_model(container,"SLDA")
BOOSTING <- train_model(container,"BOOSTING")
BAGGING <- train_model(container,"BAGGING")
RF <- train_model(container,"RF", ntree = 300)
NNET <- train_model(container,"NNET")
TREE <- train_model(container,"TREE")

# Classification of test textual corpus
SVM_CLASSIFY <- classify_model(container, SVM)
GLMNET_CLASSIFY <- classify_model(container, GLMNET)
MAXENT_CLASSIFY <- classify_model(container, MAXENT)
SLDA_CLASSIFY <- classify_model(container, SLDA)
BOOSTING_CLASSIFY <- classify_model(container, BOOSTING)
BAGGING_CLASSIFY <- classify_model(container, BAGGING)
RF_CLASSIFY <- classify_model(container, RF)
#NNET_CLASSIFY <- classify_model(container, NNET)
TREE_CLASSIFY <- classify_model(container, TREE)

# Preparing results
analytics <- create_analytics(container,
                              cbind(SVM_CLASSIFY,GLMNET_CLASSIFY, MAXENT_CLASSIFY, RF_CLASSIFY, BOOSTING_CLASSIFY,
                                    BAGGING_CLASSIFY, TREE_CLASSIFY))

# Cross validation 
doc_matrix <- create_matrix(df_train_r2$abstract, language="english", ngramLength=3, removeSparseTerms=.98)
m = as.matrix(doc_matrix)
container <- create_container(doc_matrix, df_train_r2$class, trainSize=1:320,testSize=321:399, virgin=FALSE)
SVM_CROSS <- cross_validate(container, 10, "SVM")
GLMNET_CROSS <- cross_validate(container, 10, "GLMNET")
MAXENT_CROSS <- cross_validate(container, 10, "MAXENT")
SLDA_CROSS <- cross_validate(container, 10, "SLDA")
BAGGING_CROSS <- cross_validate(container, 10, "BAGGING")
BOOSTING_CROSS <- cross_validate(container, 10, "BOOSTING")
RF_CROSS <- cross_validate(container, 10, "RF", ntree = 300)
TREE_CROSS <- cross_validate(container, 10, "TREE")
# Preparing results of the cross validation
df_cross_validate = data.frame(SVM_CROSS$meanAccuracy, GLMNET_CROSS$meanAccuracy, MAXENT_CROSS$meanAccuracy,
      RF_CROSS$meanAccuracy, TREE_CROSS$meanAccuracy, BAGGING_CROSS$meanAccuracy, BOOSTING_CROSS$meanAccuracy)

# Results
df_cross_validate
summary(analytics)
# Creating a data.frame for SUMMARIES
df_summary = as.data.frame(summary(analytics))
df_summary
# Summary details
analytics@label_summary
analytics@algorithm_summary
analytics@ensemble_summary
#analytics@document_summary

end_time <- Sys.time()
time = end_time - start_time
cat('\n\n\n Time    = ',time)




#############################################################################################
# Pre-processing of the total textual corpus for classification

start_time <- Sys.time()

# Retrieving the total textual corpus for classification
drv = dbDriver("SQLite")
con = dbConnect(drv,dbname="db_total_project.db")
sql_querys <- str_c('SELECT * FROM articles_total',sep="")	
querys <- dbSendQuery(con, sql_querys)
df_articles <- fetch(querys, n = -1)
dbDisconnect(con)

# Cleaning, transformation and pre-processing of the total textual corpus
df_articles$abstract = paste(df_articles$title_article,df_articles$abstract_article)
df_articles$abstract = gsub('îº','k', df_articles$abstract)
df_articles$abstract = gsub('Îº','k', df_articles$abstract)
df_articles$abstract = gsub('îº','k', df_articles$abstract)
df_articles$abstract = gsub('Î±','alpha', df_articles$abstract) 
df_articles$abstract = gsub('î±','alpha', df_articles$abstract)
df_articles$abstract = gsub('î²','beta', df_articles$abstract)
df_articles$abstract = gsub('Î²','beta', df_articles$abstract) 
df_articles$abstract = gsub('1Î²','beta', df_articles$abstract)  
df_articles$abstract = gsub('1î²','beta', df_articles$abstract) 
df_articles$abstract = gsub('î³','gamma', df_articles$abstract)
df_articles$abstract = gsub('Î³','gamma', df_articles$abstract)
df_articles$abstract = gsub('î´','delta', df_articles$abstract)
df_articles$abstract = gsub('Î´','delta', df_articles$abstract)
#df_articles$abstract = cleanFun(df_articles$abstract)

list_test = df_articles$pmid
list_abstract = list()
for(i in 1:length(list_test)){

  teste = df_articles[df_articles$pmid == list_test[i],]$abstract
  teste = tolower(teste)
 # teste = cleanFun(teste)
  teste = sub_frequent_terms(teste)
  teste = stripWhitespace(teste)
  teste = gsub('îº','k', teste)
  teste = gsub('Îº','k', teste)
  teste = gsub('îº','k', teste)
  teste = gsub('Î±','alpha', teste) 
  teste = gsub('î±','alpha', teste)
  teste = gsub('î²','beta', teste)
  teste = gsub('Î²','beta', teste) 
  teste = gsub('1Î²','beta', teste)  
  teste = gsub('1î²','beta', teste) 
  teste = gsub('î³','gamma', teste)
  teste = gsub('Î³','gamma', teste)
  teste = gsub('î´','delta', teste)
  teste = gsub('Î´','delta', teste)
  teste = gsub("[^[:alnum:][:blank:]?&/\\-]", "", teste)
  teste = gsub("U00..", "", teste)
  teste = gsub("â", " ", teste)
  teste = gsub('-induced',' induced', teste)
  teste = gsub('-inhibited ',' inhibited ', teste)
  teste = gsub('-inhibitory',' inhibitory', teste)
  teste = removeNumbers(teste)
  teste = removePunctuation(teste)
  teste = removeWords(teste, stopwords_pubmed)
  teste = stemDocument(teste)
  teste = removeWords(teste, stopwords_analyisis)
  teste = removeWords(teste, stopwords_analyisis2)
  teste = removeWords(teste, stopwords_analysis_neg)
  teste = gsub('\\b\\w{1}\\s',' ',teste)
  teste = stripWhitespace(teste)
  list_abstract[i] = teste
  print(teste)
  cat('\n *** \n Count = ',i)
   
}
end_time <- Sys.time()
time = end_time - start_time
cat('\n\n\n Time    = ',time)


#############################################################################################
# Classification of total textual corpus using the supervised model trained

# Bellow, there is a line for to ajust the CreateMatrix funcition in RTextTools package
# trace("create_matrix",edit=T)
# In the source code box that pops up, line 42 will have a misspelling of the word "acronym". Change the "A" to an "a" and hit "Save" - it should work fine after that.
predictiondata = list_abstract
predMatrix <- create_matrix(predictiondata, originalMatrix=doc_matrix, language="english", ngramLength=3, removeSparseTerms=.98)
n = as.matrix(predMatrix)
# Create the corresponding container
predSize = length(predictiondata);
predictionContainer <- create_container(predMatrix, labels=rep(0,predSize), testSize=1:predSize, virgin=FALSE)


# Predicting the class of pubmed abstract using Max Entropy Model
results <- classify_model(predictionContainer, MAXENT)
results$pmid = list_test
results$abstract = list_abstract
# Result of text classification using Max Entropy Model
results_entmax = results
results_entmax_positive = results_entmax[results_entmax$MAXENTROPY_LABEL == 1,]
table(results_entmax$MAXENTROPY_LABEL)
df_results_entmax = results_entmax_positive[,c(2,3)]

# Predicting the class of pubmed abstract using SVM Model
results <- classify_model(predictionContainer, SVM)
results$pmid = list_test
results$abstract = list_abstract
# Result of text classification using SVM Model
results_svm = results
results_svm_positive = results_svm[results_svm$SVM_LABEL == 1,]
table(results_svm$SVM_LABEL)
df_results_svm = results_svm_positive[,c(2,3)]

# Predicting the class of pubmed abstract using Randon Forest Model
results <- classify_model(predictionContainer, RF)
results$pmid = list_test
results$abstract = list_abstract
# Result of text classification using Randon Forest Model
results_rf = results
results_rf_positive = results_rf[results_rf$FORESTS_LABEL == 1,]
table(results_rf$FORESTS_LABEL)
df_results_rf = results_rf_positive[,c(2,3)]

# Predicting the class of pubmed abstract using Boosting Model
results <- classify_model(predictionContainer, BOOSTING)
results$pmid = list_test
results$abstract = list_abstract
# Result of text classification using Boosting Model
results_boosting = results
results_boosting_positive = results_boosting[results_boosting$LOGITBOOST_LABEL == 1,]
table(results_boosting$LOGITBOOST_LABEL)
df_results_boosting = results_boosting_positive[,c(2,3)]


##### Union of text classifications for Multiple classification (ensemble)  #######
result_final = merge(df_results_entmax, df_results_svm)
result_final = merge (result_final, df_results_rf)
result_final = merge (result_final, df_results_boosting)
result_final_total = result_final
# Setting the median of 4 classifiers
result_final_total$med = (result_final_total$SVM_PROB + result_final_total$FORESTS_PROB + result_final_total$LOGITBOOST_PROB + result_final_total$MAXENTROPY_PROB) / 4
# Final dataframe with pubmed abstracts classified about cancer activity
View(result_final_total)



