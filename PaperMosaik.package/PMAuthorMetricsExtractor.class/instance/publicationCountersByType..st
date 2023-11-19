accessing
publicationCountersByType: anYear
	(anYear isInteger)
		ifFalse: [ self error: 'Invalid input: year not found' ] .
	self publicationCountersByTypeByYear .
	
	(publicationCountersByTypeByYear includesKey: anYear)
		ifTrue: [ ^(publicationCountersByTypeByYear at: anYear) ]
		ifFalse: [ self error: 'Invalid input: year not found' ] .