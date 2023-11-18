adding
coAuthorsToRemove: anYear
	(coAuthorsToRemoveByYear includesKey: anYear)
	ifTrue: [ ^(coAuthorsToRemoveByYear at: anYear) ]
	ifFalse: [ ^nil ] .
