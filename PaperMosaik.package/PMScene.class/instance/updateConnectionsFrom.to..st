helper methods
updateConnectionsFrom: from to: to

	| collaboratorToNumCollaborations maxCollaborations compositeAnimation |
	collaboratorToNumCollaborations := centralFigure model
		                                   getAuthorToNumCollaborationsFrom:
		                                   from
		                                   to: to.
	maxCollaborations := (collaboratorToNumCollaborations collect: #value)
		                     max.
	compositeAnimation := RSParallelAnimation new.
	
	connections children do: [ :connection | 
		| nCol oldThickness newThickness step |
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
		
		step := (newThickness - oldThickness) / 60.
"			self newAnimation duration: (duration / 60) seconds; loops: 60;
			when: RSAnimationLoopEvent do: [ :evt |
					connection width: oldThickness + evt animation currentLoop * step.
			 ];
			 when: RSAnimationEndEvent do: [ :evt |
					connection width: newThickness.
			 ]."
		
"		(newThickness ~= oldThickness) ifTrue: [ 
			timeToWait := duration / (newThickness - oldThickness) abs.
			[ oldThickness to: newThickness do: [ :thickness | 
				connection width: thickness.
				(Delay forSeconds: timeToWait) wait.
			 ] ] fork.
		]."
	
"		connection width: newThickness."
			
"		self newAnimation noRepeat; duration: duration seconds; 
				from: oldThickness ; to: newThickness ; 
				on: connection set: #width:."

		compositeAnimation add: (RSTransitionAnimation new 
			duration: (duration * 0.9) seconds; 
			from: oldThickness; to: newThickness; 
			on: connection set: #width:).
	].
	self addAnimation: compositeAnimation.