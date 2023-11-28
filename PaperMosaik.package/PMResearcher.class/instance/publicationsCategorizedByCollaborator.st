accessing
publicationsCategorizedByCollaborator
	|publicationsByCollaborator|
	publicationsByCollaborator := Dictionary new.
	
	self publications do: [ :publication |
		publication authors do: [ :collaborator |
						(publicationsByCollaborator includesKey: collaborator)
						ifFalse: [ publicationsByCollaborator at: collaborator put: Set new ] .
						(publicationsByCollaborator at: collaborator) add: publication 
						] .
	] .
												
	publicationsByCollaborator removeKey: self ifAbsent: [  ] .
	^(publicationsByCollaborator)