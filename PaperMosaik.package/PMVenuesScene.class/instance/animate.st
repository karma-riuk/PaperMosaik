animation
animate
	| label currentYear |
	currentYear := startYear.
	label := RSLabel new text: currentYear asString; fontSize: 30.
	self addFixedShape: label.
	label translateBy: 100 @ 20.
	
	self updateFiguresForYear: currentYear.
	self layoutFigures.
	
	self newAnimation repeat; duration: duration seconds;
		when: RSAnimationLoopEvent do: [ :evt|
			label text: currentYear asString.
			self updateFiguresForYear: currentYear.
			currentYear := currentYear < endYear 
				ifTrue: [ currentYear + 1 ] 
				ifFalse: [ startYear	].
			self layoutFigures.
			].
	