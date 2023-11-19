tests
testPublicationCountersGeneration
	|anAuthor metricsExtractor|
	 anAuthor := PMAuthor new.
	 PMAuthor addAuthorInAuthors: anAuthor .
	
    metricsExtractor := PMAuthorMetricsExtractor new.
    metricsExtractor author: anAuthor.
    metricsExtractor slidingWindowSize: 2. 
    metricsExtractor startingYear: 2020.
	 metricsExtractor endingYear: 2023.

    "Mock data for the author"
    anAuthor yearsOfResearch 
		at: 2020 put: (PMYearOfResearch new year: 2020; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 2; at: 'ConferencePaper' put: 1; yourself));
      at: 2021 put: (PMYearOfResearch new year: 2021; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 3; yourself));
      at: 2023 put: (PMYearOfResearch new year: 2023; typeBasedPublicationCounts: (Dictionary new at: 'ConferencePaper' put: 4; yourself)) .
	
	 metricsExtractor publicationCountersGeneration.
    
    self assert: (metricsExtractor startingYear) equals: 2020.
    self assert: (metricsExtractor endingYear) equals: 2023.
	
	 self assert: ((metricsExtractor publicationCountersByTypeByYear at: 2020) at: 'JournalArticle') equals: 2.
    self assert: ((metricsExtractor publicationCountersByTypeByYear at: 2021) at: 'JournalArticle') equals: 5.
	 self assert: ((metricsExtractor publicationCountersByTypeByYear at: 2022) at: 'JournalArticle') equals: 3.
	 self deny: ((metricsExtractor publicationCountersByTypeByYear at: 2023) includesKey: 'JournalArticle').
	 
	 self assert: ((metricsExtractor publicationCountersByTypeByYear at: 2020) at: 'ConferencePaper') equals: 1.
	 self assert: ((metricsExtractor publicationCountersByTypeByYear at: 2021) at: 'ConferencePaper') equals: 1.
	 self deny: ((metricsExtractor publicationCountersByTypeByYear at: 2022) includesKey: 'ConferencePaper').
    self assert: ((metricsExtractor publicationCountersByTypeByYear at: 2023) at: 'ConferencePaper') equals: 4.

	"Remove test author from global dictionary: "
	PMAuthor removeAuthorFromAuthors: anAuthor authorId .
