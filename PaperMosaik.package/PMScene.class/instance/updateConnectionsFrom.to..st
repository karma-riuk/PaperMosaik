helper methods
updateConnectionsFrom: from to: to

	| collaboratorToNumCollaborations maxCollaborations timeToWait |
	collaboratorToNumCollaborations := centralFigure model
		                                   getAuthorToNumCollaborationsFrom:
		                                   from
		                                   to: to.
	maxCollaborations := (collaboratorToNumCollaborations collect: #value)
		                     max.

	connections children do: [ :connection | 
		| nCol oldThickness newThickness |
		oldThickness := connection border width.
		nCol := (collaboratorToNumCollaborations includesKey:
			         connection from model)
			        ifTrue: [ 
			        collaboratorToNumCollaborations at: connection from model]
			        ifFalse: [ 0 ].

		newThickness := nCol = 0 ifTrue: [0] ifFalse: [
			minConnectionThickness + (nCol / maxCollaborations
		              * (maxConnectionThickness - minConnectionThickness))
			             ceiling
			].
		
"		(newThickness ~= oldThickness) ifTrue: [ 
			timeToWait := duration / (newThickness - oldThickness) abs.
			[ oldThickness to: newThickness do: [ :thickness | 
				connection width: thickness.
				(Delay forSeconds: timeToWait) wait.
			 ] ] fork.
		]."
"		connection width: newThickness."
			
		self newAnimation noRepeat; duration: duration seconds; 
				from: oldThickness ; to: newThickness ; 
				on: connection set: #width:.
	].
		