accessing
allCollaborators
	|collaborators|
	collaborators := Set new .
	
	(self publications) do: [  :publication |
		publication authors do:[:author |
			(collaborators includes: author) ifFalse: [ 
				collaborators add: author.
				 ].
			].
		].
		
	collaborators remove: self ifAbsent: [  ] .
	^(collaborators)