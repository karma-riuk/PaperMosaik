accessing
publicationCounterByType: anYear

	(publicationCountersByTypeByYear includesKey: anYear)
		ifTrue: [ ^(publicationCountersByTypeByYear at: anYear) ]
		ifFalse: [ ^nil ] .