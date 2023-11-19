adding
coAuthorsToRemove: anYear
	(anYear isInteger)
		ifFalse: [ self error: 'Invalid input: year is not a number' ] .

	(coAuthorsToRemoveByYear includesKey: anYear)
	ifTrue: [ ^(coAuthorsToRemoveByYear at: anYear) ]
	ifFalse: [ self error: 'Invalid input: year not found' ] .
