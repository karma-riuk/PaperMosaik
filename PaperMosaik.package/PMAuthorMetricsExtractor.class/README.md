I represent the extractor of data that is required for the visualization.

### Here an example for generating a mock (copy and paste the following code in the Playground):
```st

mockAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza' .
mockExtractor := PMAuthorMetricsExtractor withAuthor: mockAuthor withStartingYear: 1999 withEndingYear: 2005 .

"Manually add mock data that is usually computed by the internal engine of the class"

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 0 ; at: 'ConferencePaper' put: 2 ; at: 'Book' put: 0 ; yourself .
mockExtractor addPublicationCountersForYear: 1999 publicationCounters: currentYearDictionary.

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 0 ; at: 'ConferencePaper' put: 2 ; at: 'Book' put: 0 ; yourself .
mockExtractor addPublicationCountersForYear: 2000 publicationCounters: currentYearDictionary.

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 1 ; at: 'ConferencePaper' put: 5 ; at: 'Book' put: 0 ; yourself .
mockExtractor addPublicationCountersForYear: 2001 publicationCounters: currentYearDictionary.

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 3 ; at: 'ConferencePaper' put: 5 ; at: 'Book' put: 0 ; yourself .
mockExtractor addPublicationCountersForYear: 2002 publicationCounters: currentYearDictionary.

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 6 ; at: 'ConferencePaper' put: 6 ; at: 'Book' put: 0 ; yourself .
mockExtractor addPublicationCountersForYear: 2003 publicationCounters: currentYearDictionary.

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 6 ; at: 'ConferencePaper' put: 11 ; at: 'Book' put: 0 ; yourself .
mockExtractor addPublicationCountersForYear: 2004 publicationCounters: currentYearDictionary.

currentYearDictionary := Dictionary new at: 'JournalArticle' put: 7 ; at: 'ConferencePaper' put: 24 ; at: 'Book' put: 2 ; yourself .
mockExtractor addPublicationCountersForYear: 2005 publicationCounters: currentYearDictionary.


"Now the 'mockExtractor' instance is ready to be used by the Fractal Figures"
```

### Another playground script useful for explain the backend logic of the publicationCountersByTypeByYear:


```st
anAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza'.

"Example of dictionary for publication with single author"
dictionaryOfAuthors := Dictionary new at: anAuthor authorName put: anAuthor.

"An example for 1999"
pub1 := PMJournalArticle withPublicationId: 'pub01' withTitle: 'First Title' withAuthors: dictionaryOfAuthors withUrl: 'www.google.com' withYear: 1999 withEe: 'doi' withNumberOfPages: 24 .

yearOfResearch1999 := PMYearOfResearch withAuthor: anAuthor withYear: 1999 . yearOfResearch1999 publications at: (pub1 publicationId) put: pub1 .
yearOfResearch1999 incrementCountForJournalArticle .

"An example for 2000"
pub2 := PMJournalArticle withPublicationId: 'pub02' withTitle: 'Second Title' withAuthors: dictionaryOfAuthors withUrl: 'www.google.com' withYear: 2000 withEe: 'doi' withNumberOfPages: 35 .

yearOfResearch2000 := PMYearOfResearch withAuthor: anAuthor withYear: 2000 . yearOfResearch2000 publications at: (pub2 publicationId) put: pub2 .
yearOfResearch2000 incrementCountForJournalArticle .

"An example for 2001"
pub3 := PMJournalArticle withPublicationId: 'pub03' withTitle: 'Third Title' withAuthors: dictionaryOfAuthors withUrl: 'www.google.com' withYear: 2001 withEe: 'doi' withNumberOfPages: 24 .

yearOfResearch2001 := PMYearOfResearch withAuthor: anAuthor withYear: 2001 . yearOfResearch2001 publications at: (pub3 publicationId) put: pub3 .
yearOfResearch2001 incrementCountForJournalArticle .

"Link author and yearOfResearch"
yearsOfResearchLanza := Dictionary new 
	at: 1999 put: yearOfResearch1999 ;
	at: 2000 put: yearOfResearch2000 ;
	at: 2001 put: yearOfResearch2001 ;
	yourself .
anAuthor yearsOfResearch: yearsOfResearchLanza .

"If required, to remove old replicas: "
"PMAuthor removeAuthorFromAuthors: anAuthor authorId ."

"Add the author to the global dictionary"
PMAuthor addAuthorInAuthors: anAuthor .

"Initialize PMAuthorMetricExtractor"
extractor := PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: 1999 withEndingYear: 2001 .
```