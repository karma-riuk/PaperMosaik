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