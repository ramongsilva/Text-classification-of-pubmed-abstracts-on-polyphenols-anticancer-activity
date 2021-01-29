<h1> Text classification of PubMed abstracts on anticancer activity </h1>
<p>This repository contains files and information about the<strong> step 1 of Kaphta Architecture: Text classification of PubMed abstracts on anticancer activity</strong>. The text classification was based on the ensemble method. In the creation (training and tests) of the ensemble were selected four machine learning algorithms with better accuracy.  Below, there are information about the files:</p>
<ul>
  <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/blob/main/Rotulated-corpus.rar'>Rotulated-corpus.rar</a>: PubMed abstracts textual corpus rotulated for training and tests of machine learning algorithms used in ensemble creation. Save this file in the same folder of training-and-text-classification-gh.R script, because it is needed to execute the script.</li>
  <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/blob/main/training-and-text-classification-gh.R'>training-and-text-classification-gh.R</a>: R script for creation of the ensemble for text classification of PubMed abstracts on anticancer activity.</li>  
      <li><a href='https://drive.google.com/file/d/1lQRdff2YpagowcLcdVSF5z2AO5tdwOIS/view?usp=sharing' target='_blank'>db_total_project.db</a>:  SQLite Database needed to execute all R scripts of kaphta architecture steps. This database contains tables with the<strong> Entity dictionary, Total PubMed abstracts textual corpus, and Pubmed abstracts classified as positive in text classification</strong>. Save this file in the same folder of training-and-text-classification-gh.R script, because it is needed to execute the script.</li>
    <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/tree/main/Entities-dictionary'>Entities Dictionary</a>: folder with files and details about entity dictionary created for Kaphta architecture.</li>
    </ul>    
    <p>For more information about this and other steps of the Kaphta Architecture, <strong>see sections of the Kaptha Web Tool available in <a href="https://portal.ifsuldeminas.edu.br/kaphtawebtool/" target="_blank">https://portal.ifsuldeminas.edu.br/kaphtawebtool/</a></strong>.</p>
    
<h2>Results of Text Classification</h2>
<ul>
      <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/blob/main/PubMed-PMID-abstracts-positives.tsv'>PubMed-PMID-abstracts-positives.tsv</a>: tsv file with <strong>PubMed abstracts classified as positive in text classification based on ensemble method</strong>. <strong><span style="color:red">Attention:</span> The PubMed abstracts classified as positive are available in db_total_project.db SQLite file too</strong>.</li>  
  </ul>
    <h2>Results of training of machine learning algorithms</h2>
  <p>Below is presented a table with the resulted measures of the training of supervised machine learning algorithms. The ensemble was constructed by combining the four classifiers with the best accuracies: LogitBoost, Randon Forest, Support Vector Machine, and Maximum entropy. </p>
  <h3><strong>Table with results of the training of machine learning algorithms</h3>
    <img src='images/Table_with_results_training.jpg' style="display:block; margin: 0 auto;">
  
  


