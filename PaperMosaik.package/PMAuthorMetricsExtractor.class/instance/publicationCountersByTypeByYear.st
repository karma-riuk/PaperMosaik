accessing
publicationCountersByTypeByYear
	(publicationCountersByTypeByYear isEmpty)
	ifTrue: 
		[ self publicationCountersGeneration ] .
	^(publicationCountersByTypeByYear)