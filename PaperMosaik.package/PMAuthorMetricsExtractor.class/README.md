I represent the extractor of data that is required for the visualization.

*** Here an example for generating a mock (copy and paste the following code in the Playground):

mockAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza' .
mockExtractor := PMAuthorMetricsExtractor withAuthor: mockAuthor withStartingYear: '1999' withEndingYear: '2005' .

"Manually add mock data that is usually computed by the internal engine of the class"

publicationCounterMock := Dictionary new .

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 0 .
currentYearDictionary at: 'ConferencePaper' put: 2 .
currentYearDictionary at: 'Book' put: 0 .
publicationCounterMock at: '1999' put: currentYearDictionary.

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 0 .
currentYearDictionary at: 'ConferencePaper' put: 2 .
currentYearDictionary at: 'Book' put: 0 .
publicationCounterMock at: '2000' put: currentYearDictionary.

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 1 .
currentYearDictionary at: 'ConferencePaper' put: 5 .
currentYearDictionary at: 'Book' put: 0 .
publicationCounterMock at: '2001' put: currentYearDictionary.

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 3 .
currentYearDictionary at: 'ConferencePaper' put: 5 .
currentYearDictionary at: 'Book' put: 0 .
publicationCounterMock at: '2002' put: currentYearDictionary.

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 6 .
currentYearDictionary at: 'ConferencePaper' put: 6 .
currentYearDictionary at: 'Book' put: 0 .
publicationCounterMock at: '2003' put: currentYearDictionary.

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 6 .
currentYearDictionary at: 'ConferencePaper' put: 11 .
currentYearDictionary at: 'Book' put: 0 .
publicationCounterMock at: '2004' put: currentYearDictionary.

currentYearDictionary := Dictionary new .
currentYearDictionary at: 'JournalArticle' put: 7 .
currentYearDictionary at: 'ConferencePaper' put: 24 .
currentYearDictionary at: 'Book' put: 2 .
publicationCounterMock at: '2005' put: currentYearDictionary.

mockExtractor publicationCountersByTypeByYear: publicationCounterMock

"Now the 'mockExtractor' instance is ready to be used by the Fractal Figures"