tests
testPublicationCountersByType
    | metricsExtractor anAuthor year1999Publications year2000Publications year2001Publications result|

    anAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza'.
    metricsExtractor := PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: 1999 withEndingYear: 2001.

    year1999Publications := Dictionary new at: 'JournalArticle' put: 2 ; at: 'Book' put: 0 ; yourself .

    year2000Publications := Dictionary new at: 'JournalArticle' put: 3 ; at: 'Book' put: 1 ; yourself .

    year2001Publications := Dictionary new at: 'JournalArticle' put: 2 ; at: 'Book' put: 1 ; yourself .

    metricsExtractor publicationCountersByTypeByYear 
			at: 1999 put: year1999Publications ; 
			at: 2000 put: year2000Publications ;
			at: 2001 put: year2001Publications .

	result := metricsExtractor publicationCountersByType: 1999.
    self assert: result equals: year1999Publications.

	"Test case with invalid year"
	self should: [metricsExtractor publicationCountersByType: 1998] raise: Error.

	result := metricsExtractor publicationCountersByType: 2001.
    self assert: result equals: year2001Publications.