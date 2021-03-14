#FunÃ§Ã£o para eliminar os espaÃ§os em branco
trim <- function(x) {
  gsub("(^[[:space:]]+|[[:space:]]+$)","",x)
} 

#FunÃ§Ã£o para contar espaÃ§os em branco 
countWhiteSpaces <- function(x) attr(gregexpr("(?<=[^ ])[ ]+(?=[^ ])", x, perl = TRUE)[[1]], "match.length")

# LIMPAR RESUMOS
cleanFun <- function(htmlString) {

  htmlString = gsub("[&]", "", htmlString)
  htmlString = gsub("[;]", "", htmlString)
  htmlString = gsub("<.*?>", "", htmlString)
  htmlString = gsub("tumour","tumor", htmlString)
  htmlString = gsub("tumours","tumors", htmlString)
  
  
  return(htmlString)
}


# SUBSTITUIR TERMOS FREQUENTES ANALISADOS
sub_frequent_terms <- function(String) {
  
  String = gsub('(-)-epigallocatechin gallate','epigallocatechin-3-gallate',String, fixed = TRUE)
  String = gsub('(- epigallocatechin-3-gallate','epigallocatechin-3-gallate',String, fixed = TRUE)
  String = gsub('- epigallocatechin-3-gallate','epigallocatechin-3-gallate',String, fixed = TRUE)
  String = gsub('- epigallocatechin gallate','epigallocatechin-3-gallate',String, fixed = TRUE)
  
  
  
  
  
  #- epigallocatechin
  
  String = gsub('tnf)-alpha','tnf-alpha',String)
  String = gsub('interleukin-1beta','interleukin 1 beta',String)
  String = gsub('mek1/2','mek1 , mek2',String)
  String = gsub('extracellular signal-regulated kinase 1/2','erk1 , erk2',String)
  String = gsub('extracellular signal-regulated kinase (erk)1/2','erk1 , erk2',String)
  String = gsub('extracellular signal-regulated kinase (erk) 1/2','erk1 , erk2',String)
  String = gsub('erk1/2','erk1 , erk2',String)
  String = gsub('erk 1/2','erk1 , erk2',String)
  String = gsub('erk-1/2','erk1 , erk2',String)
  String = gsub('jnk1/2','jnk1 , jnk2',String)
  
  String = gsub('reactive oxygen species (ros)','ros',String, fixed = TRUE)
  String = gsub('reactive oxygen specie (ros)','ros',String, fixed = TRUE)
  String = gsub('oxygen reactive species (ros)','ros',String, fixed = TRUE)
  String = gsub('oxygen reactive specie (ros)','ros',String, fixed = TRUE)
  String = gsub('reactive oxygen (ros)','ros',String, fixed = TRUE)
  String = gsub('oxidative species (ros)','ros',String, fixed = TRUE)
  String = gsub('oxidative specie (ros)','ros',String, fixed = TRUE)
  String = gsub('reactive oxygen species','ros',String, fixed = TRUE)
  String = gsub('reactive oxygen specie','ros',String, fixed = TRUE)
  String = gsub('reactive oxygen','ros',String, fixed = TRUE)
  String = gsub('oxygen reactive species','ros',String, fixed = TRUE)
  String = gsub('oxygen reactive specie','ros',String, fixed = TRUE)
  String = gsub('oxidative species','ros',String, fixed = TRUE)
  String = gsub('oxidative specie','ros',String, fixed = TRUE)
  String = gsub('(ros)','ros',String, fixed = TRUE)
  String = gsub('ros ros','ros',String, fixed = TRUE)
  String = gsub('rosros','ros',String, fixed = TRUE)
  String = gsub('ros , ros','ros',String, fixed = TRUE)
  String = gsub('ros, ros','ros',String, fixed = TRUE)
  String = gsub('ros,ros','ros',String, fixed = TRUE)
  
  
  
  String = gsub('peroxisome proliferator-activated receptor (ppar-)-alpha','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor (ppar)-alpha','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor (ppar) alpha','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor alpha (ppar)','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor alpha (ppar)','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor alpha','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor-alpha','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor alpha','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor-alpha','ppar',String, fixed = TRUE)
  String = gsub('pparalpha','ppar',String, fixed = TRUE)
  String = gsub('ppar-alpha','ppar',String, fixed = TRUE)
  String = gsub('ppar alpha','ppar',String, fixed = TRUE)
  String = gsub('ppars','ppar',String, fixed = TRUE)
  String = gsub('a pparalpha','ppar',String, fixed = TRUE)
  String = gsub('a ppar','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor','ppar',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor','ppar',String, fixed = TRUE)
  String = gsub('ppar ppar','ppar',String, fixed = TRUE)
  String = gsub('ppar (ppar)','ppar',String, fixed = TRUE)
  String = gsub('(ppar) ppar','ppar',String, fixed = TRUE)
  
  
  
  String = gsub('peroxisome proliferator activated receptor gamma','pparg',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor-gamma','pparg',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor gamma','pparg',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor-gamma','pparg',String, fixed = TRUE)
  String = gsub('ppargamma','pparg',String, fixed = TRUE)
  String = gsub('ppar-gamma','pparg',String, fixed = TRUE)
  String = gsub('ppar gamma','pparg',String, fixed = TRUE)
  String = gsub('a ppargamma','pparg',String, fixed = TRUE)
  String = gsub('a pparg','pparg',String, fixed = TRUE)
  
  
  String = gsub('peroxisome proliferator activated receptor delta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor-delta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor delta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor-delta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor beta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor-beta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator-activated receptor beta','ppard',String, fixed = TRUE)
  String = gsub('peroxisome proliferator activated receptor-beta','ppard',String, fixed = TRUE)
  String = gsub('ppardelta','ppard',String, fixed = TRUE)
  String = gsub('ppar-delta','ppard',String, fixed = TRUE)
  String = gsub('ppar delta','ppard',String, fixed = TRUE)
  String = gsub('a ppardelta','ppard',String, fixed = TRUE)
  String = gsub('a ppard','ppard',String, fixed = TRUE)
  String = gsub('pparbeta','ppard',String, fixed = TRUE)
  String = gsub('ppar-beta','ppard',String, fixed = TRUE)
  String = gsub('ppar beta','ppard',String, fixed = TRUE)
  String = gsub('a pparbeta','ppard',String, fixed = TRUE)
  String = gsub('a pparb','ppard',String, fixed = TRUE)
  
  # https://pt.wikipedia.org/wiki/Factor_de_necrose_tumoral#Mecanismo_de_A%C3%A7%C3%A3o
  # https://en.wikipedia.org/wiki/Tumor_necrosis_factor_alpha 
  
  String = gsub('tumor necrosis factors (tnf)-alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factors (tnf) alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor (tnf)-alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor (tnf) alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor- alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor- alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor -alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor -alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor-alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tnf-alpha','tnf',String, fixed = TRUE)
  String = gsub('tnf alpha','tnf',String, fixed = TRUE)
  String = gsub('[tnfa]','tnf',String, fixed = TRUE)
  String = gsub('tnfbeta','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor-alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor beta','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor-beta','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factor','tnf',String, fixed = TRUE)
  String = gsub('tumor factor-alpha(tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor factor alpha(tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor factor-alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor factor alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor factor-alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor factor alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrotizing factor-alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrotizing factor alpha (tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrotizing factor-alpha(tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrotizing factor alpha(tnf)','tnf',String, fixed = TRUE)
  String = gsub('tumor necrotizing factor-alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrotizing factor alpha','tnf',String, fixed = TRUE)
  String = gsub('tumor necrosis factors','tnf',String, fixed = TRUE)
  String = gsub('nuclear factor (nf) kb','tnf',String, fixed = TRUE)
  String = gsub('nuclear factor (nf)-kb','tnf',String, fixed = TRUE)
  String = gsub('nuclear factor nf-kb','tnf',String, fixed = TRUE)
  String = gsub('nuclear factor nf kb','tnf',String, fixed = TRUE)
  String = gsub('tnfalpha','tnf',String, fixed = TRUE)
  String = gsub('tnf (tnf)','tnf',String, fixed = TRUE)
  String = gsub('(tnf) tnf','tnf',String, fixed = TRUE)
  String = gsub('tnf(tnf)','tnf',String, fixed = TRUE)
  String = gsub('(tnf)tnf','tnf',String, fixed = TRUE)
  String = gsub('tnf(tnf)-alpha','tnf',String, fixed = TRUE)
  String = gsub('tnf (tnf)-alpha','tnf',String, fixed = TRUE)
  String = gsub('tnf (tnf) alpha','tnf',String, fixed = TRUE)
  String = gsub('(tnf)','tnf',String, fixed = TRUE)
  String = gsub('tnf, tnf','tnf',String, fixed = TRUE)
  String = gsub('tnf tnf','tnf',String, fixed = TRUE)
  
  
  #String[4282]
  
  String = gsub('tnf receptor superfamily member 1a','tnfr1',String, fixed = TRUE)
  String = gsub('tnf-receptor superfamily member 1a','tnfr1',String, fixed = TRUE)
  String = gsub('tnf receptor superfamily member','tnfr1',String, fixed = TRUE)
  String = gsub('tnf-receptor superfamily member','tnfr1',String, fixed = TRUE)
  String = gsub('tnf receptor superfamily','tnfr1',String, fixed = TRUE)
  String = gsub('tnf-receptor superfamily','tnfr1',String, fixed = TRUE)
  String = gsub('tnf receptor','tnfr1',String, fixed = TRUE)
  String = gsub('tnf-receptor','tnfr1',String, fixed = TRUE)
  String = gsub('tnfreceptor','tnfr1',String, fixed = TRUE)
  String = gsub('tumor necrosis factor receptor 1','tnfr1',String, fixed = TRUE)
  String = gsub('tumor necrosis factor-receptor 1','tnfr1',String, fixed = TRUE)
  String = gsub('tnfrsf1a','tnfr1',String, fixed = TRUE)
  String = gsub('tnfrsf','tnfr1',String, fixed = TRUE)
  String = gsub('[tnfr]','tnfr1',String, fixed = TRUE)
  
  String = gsub('tnf receptor superfamily member 1b','tnfr2',String, fixed = TRUE)
  String = gsub('tnf-receptor superfamily member 1b','tnfr2',String, fixed = TRUE)
  String = gsub('tumor necrosis factor receptor 2','tnfr2',String, fixed = TRUE)
  String = gsub('tumor necrosis factor-receptor 2','tnfr2',String, fixed = TRUE)
  String = gsub('tnfrsf1b','tnfr2',String, fixed = TRUE)
  
  String = gsub('transforming growth factors beta','tgfbeta',String, fixed = TRUE)
  String = gsub('transforming growth factor beta','tgfbeta',String, fixed = TRUE)
  String = gsub('tgf-beta','tgfbeta',String, fixed = TRUE)
  String = gsub('tgf beta','tgfbeta',String, fixed = TRUE)
  String = gsub('tgfbeta','tgfb',String, fixed = TRUE)
  String = gsub('tgfbeta','tgfb',String, fixed = TRUE)
  String = gsub('transforming growth factors (tgf) beta','tgfb',String, fixed = TRUE)
  String = gsub('transforming growth factor (tgf) beta','tgfb',String, fixed = TRUE)
  
  
  String = gsub('transforming growth factor alpha','tgfalpha',String, fixed = TRUE)
  String = gsub('tgf-alpha','tgfalpha',String, fixed = TRUE)
  String = gsub('tgf alpha','tgfalpha',String, fixed = TRUE)
  String = gsub('tgfalpha','tgfa',String, fixed = TRUE)
  # tgfb 1
  String = gsub('transforming growth factor beta 1 induced transcript 1','tgfb1i1',String, fixed = TRUE)
  String = gsub('transforming growth factor beta 1 induced','tgfb1i1',String, fixed = TRUE)
  String = gsub('tgfb1-induced anti-apoptotic factor 1','tgfb1i1',String, fixed = TRUE)
  String = gsub('tgfb 1','tgfb1i1',String, fixed = TRUE)
  String = gsub('tgfb1','tgfb1i1',String, fixed = TRUE)
  String = gsub('tgfb1 (tgfb1)','tgfb1i1',String, fixed = TRUE)
  
  
  String = gsub('eralpha','esr1',String, fixed = TRUE)
  String = gsub('er-alpha','esr1',String, fixed = TRUE)
  String = gsub('er alpha','esr1',String, fixed = TRUE)
  String = gsub('er 1','esr1',String, fixed = TRUE)
  String = gsub('estrogen receptor 1','esr1',String, fixed = TRUE)
  String = gsub('estrogen receptor-alpha','esr1',String, fixed = TRUE)
  String = gsub('estrogen receptor alpha','esr1',String, fixed = TRUE)
  String = gsub('estrogen receptor','esr1',String, fixed = TRUE)
  String = gsub('esr1 esr1','esr1',String, fixed = TRUE)
  String = gsub('esr1 (esr1)','esr1',String, fixed = TRUE)
  String = gsub('(esr1) esr1','esr1',String, fixed = TRUE)
  # ERs, ER+, ER-
  String = gsub('erbeta','esr2',String, fixed = TRUE)
  String = gsub('er-beta','esr2',String, fixed = TRUE)
  String = gsub('er beta','esr2',String, fixed = TRUE)
  String = gsub('er 2','esr2',String, fixed = TRUE)
  String = gsub('estrogen receptor 2','esr2',String, fixed = TRUE)
  String = gsub('estrogen receptor-beta','esr2',String, fixed = TRUE)
  String = gsub('estrogen receptor beta','esr2',String, fixed = TRUE)
  String = gsub('esr2 esr2','esr2',String, fixed = TRUE)
  String = gsub('esr2 (esr2)','esr2',String, fixed = TRUE)
  String = gsub('(esr2) esr2','esr2',String, fixed = TRUE)
  
  String = gsub('breast and prostate cancer','breast cancer , prostate cancer',String)
  String = gsub('breast and ovarian cancer','breast cancer , ovarian cancer',String)
  String = gsub('breast and lung cancer','breast cancer , lung cancer',String)    
  String = gsub('colon and rectal cancer','colon cancer , rectal cancer',String)
  String = gsub('colon and breast cancer','colon cancer , breast cancer',String)
  String = gsub('colorectal and ovarian cancer','colorectal cancer , ovarian cancer',String)
  String = gsub('colorectal adenoma and carcinoma','colorectal cancer',String) 
  
  String = gsub('colon carcinogenesis','colon cancer',String)
  String = gsub('colon cancer and rectal cancer','colon cancer , rectal cancer',String)
  String = gsub('colon and lung cancer','colon cancer , lung cancer',String)
  
  String = gsub('(i)','',String, fixed = TRUE)
  String = gsub('(ii)','',String, fixed = TRUE)
  String = gsub('(iii)','',String, fixed = TRUE)
  
  String = gsub('(2+)','',String, fixed = TRUE)
  String = gsub('(-1)','',String, fixed = TRUE)
  String = gsub('(-6)','',String, fixed = TRUE)
  
  
  String = gsub('(or)','odds_ratio',String, fixed = TRUE)
  String = gsub('odds ratios','odds_ratio',String, fixed = TRUE)
  String = gsub('odds ratio','odds_ratio',String, fixed = TRUE)
  
  String = gsub('(ABSTRACT TRUNCATED AT 250 WORDS)','',String, fixed = TRUE)
  
  String = gsub('\\/',' ',String)
  String = gsub(')-',' ',String)
  String = gsub(' and ',', ',String)
  String = gsub(',and ',', ',String)
  
  
  String = gsub('\\]|\\[',' ',String)
  String = gsub('\\}|\\{',' ',String)
  String = gsub('\\+',' ',String)
  
  String = gsub('BACKGROUND:',' ',String)
  String = gsub('Background:',' ',String)
  String = gsub('BACKGROUND',' ',String)
  String = gsub('Background',' ',String)
  String = gsub('OBJECTIVE:',' ',String)
  String = gsub('Objective:',' ',String)
  String = gsub('OBJECTIVE',' ',String)
  String = gsub('Objective',' ',String)
  
  
  String = gsub('MATERIAL AND METHODS:',' ',String)
  String = gsub('MATERIAL AND METHODS',' ',String)
  String = gsub('METHODS:',' ',String)
  String = gsub('Methods:',' ',String)
  String = gsub('RESULTS:',' ',String)
  String = gsub('Results:',' ',String)
  String = gsub('DISCUSSION:',' ',String)
  String = gsub('Discussion:',' ',String)
  String = gsub('RESULTS AND DISCUSSION:',' ',String)
  String = gsub('CONCLUSION:',' ',String)
  String = gsub('Conclusion:',' ',String)
  String = gsub('AIM:',' ',String)
  
  String = gsub('METHODS',' ',String)
  String = gsub('Methods',' ',String)
  String = gsub('RESULTS',' ',String)
  String = gsub('Results',' ',String)
  String = gsub('DISCUSSION',' ',String)
  String = gsub('Discussion',' ',String)
  String = gsub('RESULTS AND DISCUSSION',' ',String)
  String = gsub('CONCLUSION',' ',String)
  String = gsub('Conclusion',' ',String)
  
  String = gsub('List of Abbreviations*',' ',String)
  String = gsub('list of abbreviations*',' ',String)
  String = gsub('LIST OF ABBREVIATIONS*',' ',String)
  
  #String = stripWhitespace(removeWords(String, stopwords()))
  String = stripWhitespace(String)
  
  return(String)
}
