helper methods
updateConnectionsFrom: from to: to

	| collaboratorToThickness compositeAnimation |
	collaboratorToThickness := cachedThicknesses at: from at: to.

	compositeAnimation := RSParallelAnimation new.
	
	connections children do: [ :connection | 
		| oldThickness newThickness |
		oldThickness := connection border width.
		
		newThickness := collaboratorToThickness at: connection from model ifAbsent: [ 0 ].
		
		newThickness = 0 ifTrue:[
				oldThickness ~= 0 ifTrue: [ 
					compositeAnimation add: (RSTransitionAnimation new 
						duration: (duration / 5) seconds; 
						from: 1; to: 0.3; 
						on: connection from set: #setTransparency:).
				].
"				connection from setTransparency: 0.3."
			] ifFalse: [
				oldThickness = 0 ifTrue: [
					compositeAnimation add: (RSTransitionAnimation new 
						duration: (duration / 5) seconds; 
						from: 0.3; to: 1; 
						on: connection from set: #setTransparency:).
				].
"				connection from setTransparency: 1."
			].

		oldThickness ~= newThickness ifTrue: [
			compositeAnimation add: (RSTransitionAnimation new 
				duration: (duration / 2) seconds; 
				from: oldThickness; to: newThickness; 
				on: connection set: #width:).
			].
	].
	^ compositeAnimation.
	