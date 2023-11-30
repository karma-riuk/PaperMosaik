accessing
animateFrom: startYear to: endYear delay: time
| currentYear labelText label|
	currentYear := startYear.
	labelText := (currentYear asString).
	label := RSLabel new text: (currentYear asString) .
	super add: label.
	centralResearcher fromYear: startYear toYear: currentYear.
	radialResearchers do: [ :researcher| 
				researcher fromYear: startYear  toYear: currentYear  .
			].

	self newAnimation repeat
		duration: time seconds;
		when: RSAnimationLoopEvent do: [ :evt|
			
			centralResearcher fromYear: startYear toYear: currentYear.
			radialResearchers do: [ :researcher| 
				researcher fromYear: startYear  toYear: currentYear  .
			].
			"update current year"
			(currentYear >= endYear ) ifTrue: [ 
				currentYear := startYear.
				label text: currentYear asString.
			] 
			ifFalse: [ 
				currentYear := currentYear + 1.
				label text: (startYear asString , ' - ', currentYear asString ).
			].
	
	
			self @ RSCanvasController.
			self zoomToFit .
		]