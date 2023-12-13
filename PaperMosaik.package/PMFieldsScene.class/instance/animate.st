animation
animate
	| label currentYear parallelAnimations |
	
	parallelAnimations := RSParallelAnimation new.
	
	currentYear := startYear.
	label := RSLabel new text: currentYear asString; fontSize: 30.
	self addFixedShape: label.
	label translateBy: 100 @ 20.
	
	figure year: currentYear.
	
	self newAnimation repeat; duration: duration seconds;
		when: RSAnimationLoopEvent do: [ :evt|
			
			label text: currentYear asString.
			figure year: currentYear.
			
			currentYear := currentYear < endYear 
				ifTrue: [ currentYear + 1 ] 
				ifFalse: [ startYear	].
	
			].
	