tests
testStartingYear
    | anObject metricsExtractor |
    anObject := 2000.
	 metricsExtractor := PMAuthorMetricsExtractor new .
    metricsExtractor startingYear: anObject.
    self assert: (metricsExtractor startingYear) equals: anObject.

	 anObject := 'NotAnInteger'.
    self should: [metricsExtractor startingYear: anObject] raise: Error.