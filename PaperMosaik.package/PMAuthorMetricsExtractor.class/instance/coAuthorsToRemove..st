adding
coAuthorsToRemove: anYear
	(coAuthorsToRemoveByYear includesKey: anYear)
	ifTrue: [ ^(coAuthorsToRemoveByYear at: anYear) ]
	ifFalse: [ self error: 'Invalid input: year not found' ] .
