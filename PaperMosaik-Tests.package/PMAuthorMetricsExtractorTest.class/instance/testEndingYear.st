tests
testEndingYear
    | anObject metricsExtractor |
    anObject := 2005.
	 metricsExtractor := PMAuthorMetricsExtractor new .
    metricsExtractor endingYear: anObject.
    self assert: (metricsExtractor endingYear) equals: anObject.

	 anObject := 'NotAnInteger'.
    self should: [metricsExtractor endingYear: anObject] raise: Error.