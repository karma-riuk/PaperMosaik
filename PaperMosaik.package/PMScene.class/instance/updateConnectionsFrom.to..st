helper methods
updateConnectionsFrom: from to: to

	| collaboratorToNumCollaborations maxCollaborations a an |
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
		a := 1.
"		connection width: newThickness.
		self newAnimation duration: 0.5 seconds; from: oldThickness; to: newThickness; 
		onStepDo: [ :width |
			connection width: width.
			 ]."	
		an := self newAnimation noRepeat; duration: 1 seconds; 
				from: oldThickness ; to: newThickness ; 
				on: connection set: #width:.
		].
		