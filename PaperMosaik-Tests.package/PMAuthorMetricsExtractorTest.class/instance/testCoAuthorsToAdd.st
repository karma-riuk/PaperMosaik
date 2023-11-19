tests
testCoAuthorsToAdd
    |  metricsExtractor yearWithCoAuthors yearWithoutCoAuthors existingCoAuthors temporaryCoAuthors |
	 metricsExtractor := PMAuthorMetricsExtractor new .
    yearWithCoAuthors := 2020.
    yearWithoutCoAuthors := 2019.
    existingCoAuthors := OrderedCollection new.
    existingCoAuthors add: (PMAuthor withAuthorId: 'Author001' withAuthorName: 'AuthorName1').
    existingCoAuthors add: (PMAuthor withAuthorId: 'Author002' withAuthorName: 'AuthorName2').

    metricsExtractor coAuthorsToAddByYear at: yearWithCoAuthors put: existingCoAuthors.

    "Test for a year with co-authors"
    temporaryCoAuthors := metricsExtractor coAuthorsToAdd: yearWithCoAuthors.
    self assert: temporaryCoAuthors equals: existingCoAuthors.

    "Test for a year without co-authors"
	 self should: [metricsExtractor coAuthorsToAdd: yearWithoutCoAuthors] raise: Error.
