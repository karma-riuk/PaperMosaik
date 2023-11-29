accessing
publicationsCategorizedByCollaboratorFromYear: startingYear ToYear: endingYear
	|publicationsByCollaboratorAsObject publicationsByCollaboratorAsLabeledObject|
	publicationsByCollaboratorAsObject := Dictionary new.
	startingYear to: endingYear do: [ :year |
		(publicationsByYear includesKey: year)
													ifTrue: [
												(publicationsByYear at: year) do: [ :publication |
																							publication authors do: [ :collaborator |
																								collaborator id ~= self id ifTrue: [ 
																									 
																																(publicationsByCollaboratorAsObject includesKey: collaborator)
																																	ifFalse: [ publicationsByCollaboratorAsObject at: collaborator put: Set new ] .
																																(publicationsByCollaboratorAsObject at: collaborator) add: publication 
																																 ] .
																															].
																						] 
												] 
											].
										
	publicationsByCollaboratorAsLabeledObject := Dictionary new.
	publicationsByCollaboratorAsObject keysAndValuesDo: [ :key :value | publicationsByCollaboratorAsLabeledObject at: (PMLabeledObject new label: key id; object: key) put: value ].
	^(publicationsByCollaboratorAsLabeledObject)