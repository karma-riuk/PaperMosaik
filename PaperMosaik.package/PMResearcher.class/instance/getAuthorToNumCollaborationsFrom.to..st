accessing
getAuthorToNumCollaborationsFrom: from to: to
	| collaboratorToNCollaborations publications |
	from > to ifTrue: [ ^ self error: 'From should be smaller or equal than to' ].

	
	collaboratorToNCollaborations := Dictionary new .
	publications := OrderedCollection new.
	
	from to: to do: [ :year |
		(publicationsByYear includesKey: year) ifTrue: [ 
			publications addAll: (publicationsByYear at: year).
			  ]
		 ].
	
	publications do: [  :publication |
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