adding
coAuthorsToAdd: anYear
	(coAuthorsToAddByYear includesKey: anYear)
	ifTrue: [ ^(coAuthorsToAddByYear at: anYear) ]
	ifFalse: [ self error: 'Invalid input: year not found' ] .