accessing
animateFrom: startYear to: endYear deley: time
| currentYear labelText label|
	currentYear := startYear.
	labelText := (currentYear asString).
	label := RSLabel new text: (currentYear asString) .
	super add: label.
	centralResearcher fromYear: startYear toYear: currentYear.
	radialResearchers do: [ :researcher| 
				researcher fromYear: startYear  toYear: endYear .
			].

	self newAnimation repeat
		duration: time seconds;
		when: RSAnimationLoopEvent do: [ :evt|
			
			centralResearcher fromYear: startYear toYear: currentYear.
			radialResearchers do: [ :researcher| 
				researcher fromYear: startYear  toYear: endYear .
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
	
"	centralResearcher translateTopLeftTo: (self extent x / 2) @ (self extent y / 2)."
	RSLocation new center; stick: centralResearcher on: radialResearchers.
	
			self @ RSCanvasController.
			self zoomToFit .
		]