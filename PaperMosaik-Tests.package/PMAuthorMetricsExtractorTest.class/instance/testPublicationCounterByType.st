tests
testPublicationCounterByType
    | metricsExtractor anAuthor year1999Publications year2000Publications year2001Publications result|

    anAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza'.
    metricsExtractor := PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: '1999' withEndingYear: '2001'.

    year1999Publications := Dictionary new.
    year1999Publications at: 'JournalArticle' put: 2.
    year1999Publications at: 'Book' put: 0.

    year2000Publications := Dictionary new.
    year2000Publications at: 'JournalArticle' put: 3.
    year2000Publications at: 'Book' put: 1.

    year2001Publications := Dictionary new.
    year2001Publications at: 'JournalArticle' put: 2.
    year2001Publications at: 'Book' put: 1.

    metricsExtractor publicationCountersByTypeByYear at: '1999' put: year1999Publications.
    metricsExtractor publicationCountersByTypeByYear at: '2000' put: year2000Publications.
    metricsExtractor publicationCountersByTypeByYear at: '2001' put: year2001Publications.

	result := metricsExtractor publicationCounterByType: '1999'.
    self assert: result equals: year1999Publications.

	result := metricsExtractor publicationCounterByType: '1998'.
    self assert: result isNil.

	result := metricsExtractor publicationCounterByType: '2001'.
    self assert: result equals: year2001Publications.