# Natural-language processing 



Natural-language processing (NLP) can be used to answer a variety of questions about unstructured text data, as well as facilitating open-ended exploration. 

It can be applied to datasets such as emails, online articles and comments, tweets, or novels. Although the source is text, transformations are applied to convert this data to vectors, dictionaries and symbols which can be handled very effectively by q. Many operations such as searching, clustering, and keyword extraction can all be done using very simple data structures, such as feature vectors and bag-of-words representations.


## Preparing text

Text often comes with associated metadata. For e-mails, this could be the sender and receivers, the date sent, and any labels applied. For online comments, this could include a user name, rating, and URL. As these are often relevant to the analysis, it is convenient to store the plain text and metadata together in a table, with a row for every document, where a document could be as simple as a tweet or text message.

Once the plain text has been retrieved, operations common to many higher-level NLP operations become possible. These can be performed up-front as part of the import process, and cached for later use in the analysis. These operations include tokenization, sentence detection, part-of-speech recognition, parsing, named entity recognition, and sentiment analysis.

Operations can be done on individual strings

### `.nlp.tokenize`

_Separates a string into tokens_

Syntax: `.nlp.tokenize x ` 

Where x is a string, returns a list of symbols of tokens
```q
q) .nlp.tokenize "Call me Ishmael. Some years ago--never mind how" 
`Call`me`Ishmael`.`Some`years`ago`--`never`mind`how 
```
or the most common operations can be pre-run on a corpus, with the results cached to a table, which can be persisted.


### `.nlp.parser.i.newParser`

_Creates a table of parsed data_

Syntax: `.nlp.parser.i.newParser[spacymodel;fields]`

Where 

-   `spacymodel` is a symbol
-   `fields` is a symbol/list of the fields you want in the output

returns a table with fields:

field    | content
---------|------------------------------------------------------------------
`tokens` | Tokenization: splits the words, e.g. `John’s` becomes two tokens:  `John` is one, and `‘s` is the other.
`sentChars`<br/><span class="nowrap">`sentIndices`</span> | Sentence detection: gives characters where the sentence starts and ends
`pennPOS` or `uniPOS` | Part of speech tagger: parses the sentences into tokens and gives each token a given label e.g. `lemma`, `pos`, `tag` etc.
`FIXME` | ==Parsing:  Assign dependency labels==
lemmas | Lemmatization converts it to a base form eg _ran_ (vb) to _run_ (verb)
`FIXME` | Named-entity recognition which identifies people, locations, organizations, geopolitical entities etc. For example, this would return who _U.K._ is. This technique can be used in `spaCy` or `openCalais`. `openCalais` is used for LEI extraction.
keywords| ==FIXME==

Functions that require specific fields:

function | field/s
---------|---------------------------------------
`compareCorpora` | `tokens`, `isStop`
`extractMatchingSentences` | `sentChars`, `text`
`extractPhrases` | `tokens`, `isStop`, `starts`, `text`
`findDates` | `text`
`findPOSRun` | `tokens` and (`uniPOS` or `pennPOS`)
`findRelatedTerms` | `tokens`, `sentIndices`, `isStop`
`findTimes` | `text`
`getSentences` | `text`, `sentChars`
`keywordsContinuous` | `tokens`, `isStop`
`TFIDF` | `tokens`, `isStop`
`clustering` | `keywords`

With a prebuilt model of the degrees of positive and negative sentiment for English words and emoticons, as well as parsing to account for negation, adverbs and other modifiers, sentences can be scored for their negative, positive and neutral sentiment.


### `.nlp.findPOSRuns`

_Finds runs of tokens whose pos tags are in the set passed_

Syntax: `.nlp.findPOSRuns[tagtype;tags;document]`

Where 

-   `tagtype` is a symbol (`uniPos` or `pennPos`)
-   `tags` is an atom or a list
-   `document` is a dictionary

returns a general list containing a symbol, which is the text of the run, and a long, which is the index of the first token.

This example shows importing a novel from a plain text file, and finding all the proper nouns in the first chapter of Moby Dick.
```q
q)myparser:.nlp.parser.i.newParser[`en;`text`tokens`lemmas`pennPOS`isStop`sentChars`starts`sentIndices`keywords] 
q)corpus:myparser mobyDick 
q).nlp.findPOSRuns[`pennPOS;`NNP`NNPS;corpus 0][;0]
`loomings`ishmael`november`cato`manhattoes`circumambulate`sabbath`go`corlears`hook`coenties
```


## Comparing corpora

A quick way to compare corpora is to find words which are common in the dataset as a whole, yet have a strong affinity towards only one corpus. This is a function of how much higher their frequency in that corpus is than would be expected, given that term’s overall frequency in the dataset.
	
### `.nlp.compareCorpora`

_Gives two dictionaries of each terms affinity to each corpus_

Syntax: `.nlp.compareCorpora[corpus1;corpus2]`

Where `corpus1` and `corpus2` are tables of lists of documents, returns a dictionary of terms and their affinity for `corpus2` over `corpus1`.
 
Enron CEO Jeff Skillings was a member of the Beta Theta Pi fraternity at Southern Methodist University (SMU). If we want to find secret fraternity code words used by the Betas, we can compare his fraternity emails (those containing _SMU_ or _Betas_) to his other emails. Sorting terms by their affinity towards the fraternity corpus, the first unusual word, the 10th most polarized word, is _kai_, a greeting and sign-off used in fraternity emails. Also appearing near the top of this list are references to the fraternity’s “Eye of Wooglin” ritual, and the fraternity code word _dorg_.
```q
q)fraternity:jeffcorpus i:where (jeffcorpus[`text] like "*Betas*")|jeffcorpus[`text] like "*SMU*"
q)remaining:jeffcorpus til[count jeffcorpus]except i
q)summaries:key each 10#/:.nlp.compareCorpora[fraternity;remaining]
q)summaries 0  / summary of the fraternity corpus
`beta`homecoming`betas`smu`yahoo`groups`tent`reunion`forget`crowd
q)summaries 1  / summary of the remaining corpus
`enron`jeff`business`information`please`market`services`energy`management`company
```


## Feature vectors

Similar to the process of comparing two corpora to generate a list of descriptive terms, other entities can be described as dictionaries of terms and their associated weights. These dictionaries are called _feature vectors_ and they are very useful as they give a uniform representation that can describe words, sentences, paragraphs, documents, collections of documents, clusters, concepts and queries. All operations that work on feature vectors can then compare any mix of these items. 


### Calculating feature vectors for documents

The values associated with each term in a feature vector are how significant that term is as a descriptor of the entity. For documents, this can be calculated by comparing the frequency of words in that document to the frequency of words in the rest of the corpus. Describing documents this way is a very fast operation and, when run on email-length documents, has a throughput of tens of thousands of documents per second.

Sorting the terms in a feature vector by their significance, you get the keywords that distinguish a document most from the corpus, forming a terse summary of the document. This shows the most significant terms in the feature vector for one of Enron CEO Jeff Skilling’s email’s describing a charity bike ride.


### `.nlp.TFIDF`

_Finds the TFIDF scores for all terms in the document_

Syntax: `.nlp.TFIDF x`

Where `x` is a table of documents, returns for each document, a dictionary with the tokens as keys, and relevance as values.
```q
q)queriedemail:jeffcorpus[where jeffcorpus[`text] like "*charity bike*"]`text;
q)5#desc .nlp.TFIDF[jeffcorpus]1928
bikers   | 17.7979
biker    | 17.7979
strenuous| 14.19154
route    | 14.11932
rode     | 14.11136
```
In cases where the dataset is more similar to a single document than a collection of separate documents, a different algorithm can be used. Treating all of _Moby Dick_ as a single document, the most significant keywords are _Ahab_, _Bildad_, _Peleg_ (the three captains on the boat) and _whale_.


### `.nlp.keywordsContinuous`

_Given an input which is conceptually a single document,such as a book, this will give better results than TF-IDF_

Syntax: `.nlp.keywordsContinuous x`

Where `x` is a table of documents, returns a dictionary where the keys are keywords and the values are their significance.
```q
q)10#keywords:.nlp.keywordsContinuous corpus
ahab     | 65.23191
peleg    | 52.21875
bildad   | 46.56072
whale    | 42.72953
stubb    | 38.11739
queequeg | 35.34769
steelkilt| 33.96713
pip      | 32.90067
starbuck | 32.05286
thou     | 32.05231
```


### Calculating feature vectors for words

The feature vector for a word can be calculated as a collection of how well other words predict the given keyword. In _Moby Dick_, _Captain_ occurs in 2.7% of all sentences, but it occurs in 16% of sentences containing _Ahab_. As such, _Ahab_ is a good predictor of _Captain_, so _Ahab_ must be significant to _Captain_. Repeating this process for all words that co-occur within the same sentence as the target term, or within a window around it, will give you a feature vector. The weight given to these words is a function of how much higher the actual co-occurrence rate is from the expected co-occurrence rate the terms would have if they were randomly distributed.


### `.nlp.findRelatedTerms`

_Generates a feature vector for a term_

Syntax: `.nlp.findRelatedTerms[x;y]`

Where 

-   `x` is a list of documents
-   `y` is a symbol which is the token for which to find related terms 

returns a dictionary of the related tokens and their relevances.
```q
q).nlp.findRelated[corpus;`captain]
peleg | 1.653247
bildad| 1.326868
ahab  | 1.232073
ship  | 1.158671
cabin | 0.9743517
```


### Comparing feature vectors  
==(Section set in bold)==

A vector can be thought of either as 

-   the co-ordinates of a point
-   describing a line segment from the origin to a point

The view of a vector as a line segment starting at the origin is useful as any two vectors will have an angle between them, correspond to their similarity, as calculated by cosine similarity.

The _cosine similarity_ of two vectors is the dot product of two vectors over the product of their magnitudes. It is a standard distance metric for comparing documents.

Cosine similarity’s advantage over Euclidean distance can be demonstrated with two documents having nothing in common, represented by the feature vectors [0, 1] and [1, 0]. Their cosine similarity will be 0, whereas their Euclidean distance would be 1.41, incorrectly implying some similarity.


## Searching

Searching can be done using words, documents, or collections of documents as the query or dataset. To search for documents similar to a given document, you can represent all documents as feature vectors using TF-IDF, then compare the cosine similarity of the query document to those in the dataset and find the most similar documents, with the cosine similarity giving a relevance score. 

Feature vectors are extremely composable. To search by a collection of documents, just sum the feature vectors for all the elements in the query to get a single vector you can use for searching. 

The folowing example searches for the document most similar to the below email where former Enron CEO Jeff Skilling is discussing finding a new fire chief.


### `.nlp.compareDocs`

_Calculates the cosine similarity of two documents_

Syntax: `.nlp.compareDocs[doc1;doc2]`

Where `doc1` and `doc2` are dictionaries consisting of their assocated document’s keywords, returns as a float the cosine similarity of two documents.
```q
q)queryemail:first jeffcorpus where jeffcorpus[`text] like "Fire Chief Committee*"  
q)-1 queryemail\`text;
q)mostsimilar:jeffcorpus first 1_idesc .nlp.compareDocs[queryemail\`keywords]each jeffcorpus\`keywords

Select Comm AGENDA - Jan 25-Febr 1

Houston Fire Chief Selection Committee Members: Jeff Skilling - Chairperson, 
Troy Blakeney, Gerald Smith, Roel Campos and James Duke.

Congratulations selection committee members! We have a very important and 
exciting task ahead of us. 

On the agenda for the next week are two important items - (1) the Mayor's 
February 1 news conference announcing the Houston Fire Chief selection 
committee and its members; and (2) coordination of an action plan, which we 
should work out prior to the news conference.

News Conference specifics:
speakers - Mayor Brown and Jeff Skilling
in attendance - all selection committee members
location - Fire Station #6, 3402 Washington Ave.
date - Thursday, February 1, 2001
time - 2pm
duration - approximately 30 minutes

I'd like to emphasize that it would be ideal if all selection committee 
members were present at the news conference. 

I will need bios on each committee member emailed to me by close of business 
Monday, January 29, 2001. These bios will be attached to a press release the 
Mayor's Office is compiling.

Coordination of action plan:
Since we have only 1 week between now and the news conference, Jeff has 
proposed that he take a stab at putting together an initial draft. He will 
then email to all committee members for comments/suggestions and make changes 
accordingly. Hope this works for everyone - if not, give me a call 
(713)-345-4840.

Thanks,
Lisa
```


## Explaining similarities

When documents are marked as similar, either by a clustering algorithm, or when searching for documents similar to some other document, it may not always be obvious why a result matched, or why it has the relevance score it was given. For any pair of documents or centroids, the list of features can score can be sorted by how much they contribute to the similarity. This example compares two of former Enron CEO Jeff Skilling’s emails, both of which have in common the subject of selecting Houston’s next fire chief.

### `.nlp.explainSimilarity`

Syntax: `.nlp.explainSimilarity[doc1;doc2]`

Where `doc1` and `doc2` are dictionaries consisting of their assocated document’s keywords, returns a dictionary of how much of the similarity score each token is responsible for.
```q
q)10#.nlp.explainSimilarity . jeffcorpus[`keywords]568 358
fire     | 0.2588778
roel     | 0.1456685
committee| 0.1298068
mayor    | 0.1295087
station  | 0.09342764
chief    | 0.06948782
select   | 0.04325209
important| 0.03838308
members  | 0.03530552
plan     | 0.02459828
```


## Finding outliers, and representative documents

The _centroid_ of a collection of documents is the average of their feature vectors. As such, documents close to the centroid are representative, while those far away are the outliers. Given a collection of documents, finding outliers can be a quick way to find interesting documents, those that have been mis-clustered, or those not relevant to the collection.
	
The emails of former Enron CEO Ken Lay contain 1124 emails with a petition. Nearly all of these use the default text, only changing the name, address and email address. To find those petitions which have been modified, sorting by distance from the centroid gives emails where the default text has been completely replaced, added to, or has had portions removed, with the emails most heavily modified appearing first.


### `.nlp.compareDocToCentroid`

_Calculates the cosine similarity of a document and a centroid, subtracting the document from the centroid_

Syntax: `.nlp.compareDocToCentroid[centroid;document]`

Where 

-   `centroid` is the sum of all documents in a cluster which is a dictionary 
-   `document` is a document in a cluster which is a dictionary 

returns the cosine similarity of the two documents as a float.
```q
q)petition:laycorpus where laycorpus[`subject] like "Demand Ken*"
q)centroid:sum petition`keywords
q).nlp.compareDocToCentroid[centroid]each petition`keywords
0.2374891 0.2308969 0.2383573 0.2797052 0.2817323 0.3103245 0.279753 0.2396462 0.3534717 0.369767
q)outliers:petition iasc .nlp.compareDocToCentroid[centroid]each petition`keywords
```


## Clustering

When exploring a set of documents, a very useful operation is clustering. This will show the major themes in a dataset, allowing you to focus in on relevant areas, and filter out sections of the dataset that are not related to the analysis. Clusters can be summarized by their centroids, which are the sum of the feature vectors of all the documents they contain. 

A dataset can be clustered initially using a fast, coarse-grained algorithm, and the resulting clusters can themselves be clustered with algorithms designed for smaller data sets. Clusters of interest can also be expanded by searching for documents similar to the centroid.

Splitting the corpus into separate topics at a high level also allows operations such as building feature vectors, detecting keywords, clustering and comparing documents to work on a more focused dataset, giving more relevant results.

The NLP library contains a variety of clustering algorithms, with different parameters and performance characteristics. Some of these are very fast on large data sets, though they look only at the most salient features of each document, and will create many small clusters. Others, such as bisecting k-means, look at all features present in the document, and allow you to specify the number of clusters. Other parameters can include a threshold for the minimum similarity to consider, or how many iterations the algorithm should take to refine the clusters. Some clustering algorithms are randomized, and will produce different clusters every time they are run. This can be very useful, as a data set will have many possible, equally valid, clusterings. Some algorithms will put every document in a cluster, whereas others will increase cluster cohesion by omitting outliers.  


### `.nlp.cluster.similarity`

_Cluster a subcorpus using graph clustering_

Syntax: `.nlp.cluster.similarity[document;min;sample]`

Where 

-   `document` is a table containing a list of documents
-   `min` is a float which specifics the minimum similarity that will be considered
-   `sample` is a boolean, if true, a sample of `sqrt[n]` documents is used

returns a list of longs which indicate the document’s indexes, grouped into clusters.
``` q
q)clusterjeff:.nlp.cluster.similarity[jeffcorpus;0.25;0b]
q)count clusterjeff
398
```


### `.nlp.cluster.kmeans`

_K-means clustering for documents_

Syntax: `.nlp.cluster.kmeans[docs;k;iters]`

Where 

-   `docs` is a table or a list of dictionary ==?== 
-   `k` is a long that indicates the number of clusters to return
-   `iters` is a long which is the number of times to iterate the refining step

returns the document’s indexes, grouped into clusters.
``` q
q)clusters:.nlp.cluster.kmeans[corpus;15;30]
q)count each clusters
32 9 13 9 12 5 12 8 6 8 7 11 11 5 2
```


## Cluster cohesion

The cohesiveness of a cluster is a measure of how similar the documents are within that cluster.  It is calculated as the mean sum-of-squares error, which aggregates each document’s distance from the centroid. Sorting by cohesiveness will give very focused clusters first.


### `.nlp.cluster.MSE`

_Get the cohesiveness of a cluster as measured by the mean sum-of-squares error_

Syntax: `.nlp.cluster.MSE x`

Where `x` is a list of dictionaries which are a document’s keyword field, returns as a float the cohesion of the cluster.
```q
q)/16 emails related to donating to charity
q)charityemails:jeffcorpus where jeffcorpus[`text] like "*donate*"
q).nlp.cluster.MSE charityemails`keywords
0.1177886

q)/10 emails chosen at random
q).nlp.cluster.MSE (-10?jeffcorpus)`keywords
0.02862244
```


## Finding related phrases

Phrases can be found by looking for runs of words with an above-average significance to the query term.


### `.nlp.extractPhrases`

_Finds any runs of tokens that contain the term where each consecutive word has an above-average co-ocurrance with the term_

Syntax: `.nlp.extractPhrases[corpus;term]`

Where 

-   `corpus` is a table which is a subcorpus
-   `term` which is the symbol is the term to extract phrases around

returns a dictionary with phrases as the keys and their relevance as the values.
```q
q).nlp.extractPhrases[corpus;`captain]  
"captain ahab"        | 31
"captain peleg"       | 12
"captain bildad"      | 7
"captain sleet"       | 5
"stranger captain"    | 4
"said the captain"    | 3
"sea-captain"         | 2
"whaling captain"     | 2
"captain's cabin"     | 2
"captain ahab,\" said"| 2
"captain pollard"     | 2
"captain d'wolf"      | 2
"way, captain"        | 2
```


## Sentiment analysis

Using a prebuilt model of the degrees of positive and negative sentiment for English words and emoticons, as well as parsing to account for negation, adverbs and other modifiers, sentences can be scored for their negative, positive and neutral sentiment. The model included has been trained on social-media messages. 


### `.nlp.sentiment`

_Calculate the sentiment of a sentence_

Syntax: `.nlp.sentiment x`

Where `x` is string or a list of strings (**dicts and tables??**), returns a dictionary or table containing the sentiment of the text.

Here is an example run of sentences from _Moby Dick_.
```q
q).nlp.sentiment("Three cheers,men--all hearts alive!";"No,no! shame upon all cowards-shame upon them!")
compound   pos       neg       neu      
----------------------------------------
0.7177249  0.5996797 0         0.4003203
-0.8802318 0         0.6910529 0.3089471
```

