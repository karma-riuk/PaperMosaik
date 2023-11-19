tests
testPublicationCountersByTypeByYear
    | metricsExtractor anAuthor anYearOfResearch |

    "Setup an instance of PMAuthorMetricsExtractor"
	 anAuthor := PMAuthor withAuthorId: 'Foo001' withAuthorName: 'Foo' .
	 anYearOfResearch := PMYearOfResearch withAuthor: anAuthor withYear: 2020.
	 anYearOfResearch typeBasedPublicationCounts at: 2020 put: (Dictionary new at: 'Books' put: 1) .
	 anAuthor yearsOfResearch at: 2020 put: anYearOfResearch .
	 PMAuthor addAuthorInAuthors: anAuthor .
    metricsExtractor := PMAuthorMetricsExtractor new author: anAuthor ; startingYear: 2020 ; endingYear: 2020.

    "Test when publicationCountersByTypeByYear is not empty"
    self deny: metricsExtractor publicationCountersByTypeByYear isEmpty.
    "Ensure the dictionary returns the correct data and is not modified unexpectedly"
    self assert: (metricsExtractor publicationCountersByTypeByYear at: 2020) equals: anYearOfResearch typeBasedPublicationCounts .

	 PMAuthor removeAuthorFromAuthors: anAuthor authorId .
