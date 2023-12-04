accessing
getAuthorToNumCollaborations

	|collaboratorToNCollaborations|
	collaboratorToNCollaborations := Dictionary new .
	
	(self publications) do: [  :publication |
		publication authors do:[:author |
			(collaboratorToNCollaborations includesKey: author) 
			ifTrue: [  
				collaboratorToNCollaborations at: author put: ((collaboratorToNCollaborations at: author)+1).
				]  
			ifFalse: [  
				collaboratorToNCollaborations at: author put: 1.
				].
			].
		].
		
	collaboratorToNCollaborations removeKey:  self ifAbsent: [  ] .
	^(collaboratorToNCollaborations)