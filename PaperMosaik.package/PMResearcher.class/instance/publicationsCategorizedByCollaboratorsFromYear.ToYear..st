accessing
publicationsCategorizedByCollaboratorsFromYear: startingYear ToYear: endingYear
	|publicationsByCollaborator|
	publicationsByCollaborator := Dictionary new.
	startingYear to: endingYear do: [ :year |
												(publications at: year) do: [ :publication |
																							publication authors do: [ :collaborator |
																																(publicationsByCollaborator includesKey: collaborator)
																																	ifFalse: [ publicationsByCollaborator at: publication type put: Set new ] .
																																(publicationsByCollaborator at: collaborator) add: publication 
																																 ] .
																						] 
												] .
	publicationsByCollaborator remove: self ifAbsent: [  ] .
	^(publicationsByCollaborator)