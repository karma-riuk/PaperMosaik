adding
coAuthorsToAdd: anYear
	(coAuthorsToAddByYear includesKey: anYear)
	ifTrue: [ ^(coAuthorsToAddByYear at: anYear) ]
	ifFalse: [ ^nil ] .