helper methods
updateConnectionsFrom: from to: to

	| collaboratorToThickness compositeAnimation |
	collaboratorToThickness := cachedThicknesses at: from at: to.

	compositeAnimation := RSParallelAnimation new.
	
	connections children do: [ :connection | 
		| oldThickness newThickness |
		oldThickness := connection border width.
		
		newThickness := collaboratorToThickness at: connection from model ifAbsent: [ 0 ].
		
"		step := (newThickness - oldThickness) / 60."
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
			
		"self newAnimation duration: duration seconds; 
				from: oldThickness ; to: newThickness ; 
				on: connection set: #width:."

		compositeAnimation add: (RSTransitionAnimation new 
			duration: (duration / 5) seconds; 
			from: oldThickness; to: newThickness; 
			on: connection set: #width:).
	].
	^ compositeAnimation.
	