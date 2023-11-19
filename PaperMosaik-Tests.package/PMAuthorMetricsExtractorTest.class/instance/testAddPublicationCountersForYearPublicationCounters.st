tests
testAddPublicationCountersForYearPublicationCounters
 | anExtractor anYear aPublicationCounters |
	 anExtractor := PMAuthorMetricsExtractor new .
	 "Avoid the call of publicationCountersByType method, and manually add mock dictionaries"
	 anExtractor publicationCountersByTypeByYear: Dictionary new.
	 
	 "Test valid add operation"
    anYear := 2020.
    aPublicationCounters := Dictionary new at: 'JournalArticle' put: 5; at: 'Book' put: 3 ; yourself .
    anExtractor addPublicationCountersForYear: anYear publicationCounters: aPublicationCounters.
    self assert: (anExtractor publicationCountersByTypeByYear at: anYear) equals: aPublicationCounters.

	 "Test invalid year"
    anYear := '2020'.
    aPublicationCounters := Dictionary new at: 'JournalArticle' put: 5; at: 'Book' put: 3; yourself.
    self should: [anExtractor addPublicationCountersForYear: anYear publicationCounters: aPublicationCounters] raise: Error.
	
	 "Test invalid publication"
    anYear := 2020.
    aPublicationCounters := #(5 3).
    self should: [anExtractor addPublicationCountersForYear: anYear publicationCounters: aPublicationCounters] raise: Error.
