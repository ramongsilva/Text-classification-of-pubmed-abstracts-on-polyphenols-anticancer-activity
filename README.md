<h1> Text classification of pubmed abstracts on anticancer activity </h1>
<p>This repository contains files and information about the step 1 of Kaphta Architecture: Text classification of pubmed abstracts on anticancer activity. The text classification was based on ensemble method. In creation (training and tests) of the ensemble were selected four machine learning algorithms with better acuracy.  Bellow, there are information about the files:</p>
<ul>
  <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/blob/main/Rotulated-corpus.rar'>Rotulated-corpus.rar</a>: pubmed abstracts textual corpus rotulated for training and tests of machine learning algorithms used in ensemble creation. These files are needed to execute the training-and-text-classification-gh.R script.</li>
  <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/blob/main/training-and-text-classification-gh.R'>training-and-text-classification-gh.R</a>: R script for creation of the ensemble for text classification of pubmed abstracts on anticancer activity.</li>  
</ul>

<h2>Entities Dictionary and PubMed abstracts Textual corpus created</h2>
<ul>
       <li><a href='#'>db_total_project.db</a>:  SQLite Database needed to execute all R scripts of kaphta architecture steps. This database contains tables with the Entity dictionary, Total PubMed abstracts textual corpus, and Pubmed abstracts classified as positive in text classification.</li>
    <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/tree/main/Entities-dictionary'>Entities Dictionary</a>: folder with files and details about entity dictionary created for kaphta architecture.</li>
    </ul>

<h2>Results of Text Classification</h2>
<ul>
      <li><a href='https://github.com/ramongsilva/Text-classification-of-pubmed-abstracts-about-polyphenols-anticancer-activity/blob/main/PubMed-PMID-abstracts-positives.tsv'>PubMed-PMID-abstracts-positives.tsv</a>: tsv file with <strong>pubmed abstracts classified as positive in text classification based on ensemble method.</strong></li>
  </ul>


