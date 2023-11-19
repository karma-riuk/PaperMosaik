construction
withStartingYear: anYear
	(anYear isInteger)
		ifFalse: [ self error: 'Invalid year. Year should be an integer' ]
		ifTrue: [ ^(self new currentMinYear: anYear ; currentMaxYear: anYear) ]
