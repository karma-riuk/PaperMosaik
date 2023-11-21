accessing
allCollaboratorsFromYear: startingYear ToYear: endingYear
	|collaborators|
	collaborators := Set new .
	startingYear to: endingYear do: [ :year |
												(publications at: year) do: [ :publication |
																							publication authors do: [ :collaborator |
																																(collaborators includesKey: collaborator)
																																	ifFalse: [ collaborators add: collaborator ] .
																																 ] .
																						] 
												] .
	collaborators remove: self ifAbsent: [  ] .
	^(collaborators)