accessing
publicationCountersByType: anYear

	(publicationCountersByTypeByYear includesKey: anYear)
		ifTrue: [ ^(publicationCountersByTypeByYear at: anYear) ]
		ifFalse: [ self error: 'Invalid input: year not found' ] .