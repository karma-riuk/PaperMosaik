tests
testWithAuthorWithStartingYearWithEndingYear
	| anAuthor anInstanceOfExtractor |
	"Invalid input"
    anAuthor := PMAuthor withAuthorId: 'Lanza001' withAuthorName: 'Lanza'.
    self should: [ PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: 2001 withEndingYear: 1999 ] raise: Error.
    self should: [ PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: '1999' withEndingYear: 2001 ] raise: Error.
    self should: [ PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: 1999 withEndingYear: '2001' ] raise: Error.
    self should: [ PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: '1999' withEndingYear: '2001' ] raise: Error.
	
	"Valid input"
	anAuthor := PMAuthor withAuthorId: 'Lanza002' withAuthorName: 'Lanza'.
    anInstanceOfExtractor := PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: 1999 withEndingYear: 2001.
    self assert: anInstanceOfExtractor notNil.
    self assert: (anInstanceOfExtractor author) equals: anAuthor.
    self assert: (anInstanceOfExtractor startingYear) equals: 1999.
    self assert: (anInstanceOfExtractor endingYear) equals: 2001.
	