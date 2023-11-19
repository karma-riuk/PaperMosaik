I represent the extractor of data that is required for the visualization.

### Here an example for generating a mock (copy and paste the following code in the Playground):
```st

mockAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza' .
mockExtractor := PMAuthorMetricsExtractor withAuthor: mockAuthor withStartingYear: 1999 withEndingYear: 2005 .

"Manually add publication counters for each year"
mockExtractor 
    addPublicationCountersForYear: 1999 publicationCounters: (Dictionary new at: 'ConferencePaper' put: 2; yourself);
    addPublicationCountersForYear: 2000 publicationCounters: (Dictionary new at: 'ConferencePaper' put: 2; yourself);
    addPublicationCountersForYear: 2001 publicationCounters: (Dictionary new at: 'JournalArticle' put: 1; at: 'ConferencePaper' put: 5; yourself);
    addPublicationCountersForYear: 2002 publicationCounters: (Dictionary new at: 'JournalArticle' put: 3; at: 'ConferencePaper' put: 5; yourself);
    addPublicationCountersForYear: 2003 publicationCounters: (Dictionary new at: 'JournalArticle' put: 4; at: 'ConferencePaper' put: 8; yourself);
    addPublicationCountersForYear: 2004 publicationCounters: (Dictionary new at: 'JournalArticle' put: 4; at: 'ConferencePaper' put: 13; yourself);
    addPublicationCountersForYear: 2005 publicationCounters: (Dictionary new at: 'JournalArticle' put: 5; at: 'ConferencePaper' put: 26; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2006 publicationCounters: (Dictionary new at: 'JournalArticle' put: 6; at: 'ConferencePaper' put: 37; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2007 publicationCounters: (Dictionary new at: 'JournalArticle' put: 6; at: 'ConferencePaper' put: 54; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2008 publicationCounters: (Dictionary new at: 'JournalArticle' put: 6; at: 'ConferencePaper' put: 66; at: 'Series' put: 1; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2009 publicationCounters: (Dictionary new at: 'JournalArticle' put: 8; at: 'ConferencePaper' put: 76; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2010 publicationCounters: (Dictionary new at: 'JournalArticle' put: 11; at: 'ConferencePaper' put: 90; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2011 publicationCounters: (Dictionary new at: 'JournalArticle' put: 12; at: 'ConferencePaper' put: 99; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2012 publicationCounters: (Dictionary new at: 'JournalArticle' put: 15; at: 'ConferencePaper' put: 104; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2013 publicationCounters: (Dictionary new at: 'JournalArticle' put: 16; at: 'ConferencePaper' put: 114; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2014 publicationCounters: (Dictionary new at: 'JournalArticle' put: 17; at: 'ConferencePaper' put: 124; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2015 publicationCounters: (Dictionary new at: 'JournalArticle' put: 18; at: 'ConferencePaper' put: 138; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2016 publicationCounters: (Dictionary new at: 'JournalArticle' put: 21; at: 'ConferencePaper' put: 144; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2017 publicationCounters: (Dictionary new at: 'JournalArticle' put: 22; at: 'ConferencePaper' put: 152; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2018 publicationCounters: (Dictionary new at: 'JournalArticle' put: 22; at: 'ConferencePaper' put: 157; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2019 publicationCounters: (Dictionary new at: 'JournalArticle' put: 25; at: 'ConferencePaper' put: 164; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2020 publicationCounters: (Dictionary new at: 'JournalArticle' put: 27; at: 'ConferencePaper' put: 170; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2021 publicationCounters: (Dictionary new at: 'JournalArticle' put: 30; at: 'ConferencePaper' put: 180; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2022 publicationCounters: (Dictionary new at: 'JournalArticle' put: 35; at: 'ConferencePaper' put: 187; at: 'Series' put: 2; at: 'Book' put: 2; yourself);
    addPublicationCountersForYear: 2023 publicationCounters: (Dictionary new at: 'JournalArticle' put: 37; at: 'ConferencePaper' put: 191; at: 'Series' put: 2; at: 'Book' put: 2; yourself).

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