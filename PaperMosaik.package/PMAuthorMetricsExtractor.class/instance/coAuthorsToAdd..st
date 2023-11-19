adding
coAuthorsToAdd: anYear
	(anYear isInteger)
		ifFalse: [ self error: 'Invalid input: year is not a number' ] .

	(coAuthorsToAddByYear includesKey: anYear)
	ifTrue: [ ^(coAuthorsToAddByYear at: anYear) ]
	ifFalse: [ self error: 'Invalid input: year not found' ] .