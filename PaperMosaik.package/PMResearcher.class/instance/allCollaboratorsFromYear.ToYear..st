accessing
allCollaboratorsFromYear: startingYear ToYear: endingYear

	| collaborators |
	collaborators := OrderedCollection new.

	startingYear to: endingYear do: [ :year | 
		(publicationsByYear includesKey: year) ifTrue: [ 
			(publicationsByYear at: year) do: [ :publication | 
				publication authors do: [ :collaborator | 
					(collaborators includes: collaborator) ifFalse: [ 
						collaborators add: collaborator 
						]
					]
				]
			]
		].
	collaborators remove: self ifAbsent: [  ].
	^ collaborators