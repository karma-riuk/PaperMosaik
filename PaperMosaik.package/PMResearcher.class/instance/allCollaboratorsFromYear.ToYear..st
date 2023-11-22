accessing
allCollaboratorsFromYear: startingYear ToYear: endingYear
	|collaborators|
	collaborators := Set new .
		
	startingYear to: endingYear do: [ :year |
												(publications includesKey: year)
												ifTrue: [
													(publications at: year) do: [ :publication |
																							publication authors do: [ :collaborator |
																																(collaborators includes: collaborator)
																																	ifFalse: [ collaborators add: collaborator ]
																																 ]
																						] 
												]
												] .
	collaborators remove: self ifAbsent: [  ] .
	^(collaborators)