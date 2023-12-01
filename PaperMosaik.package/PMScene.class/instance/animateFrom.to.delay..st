accessing
animateFrom: startYear to: endYear delay: time
| currentYear labelText label|
	currentYear := startYear.
	labelText := (currentYear asString).
	label := RSLabel new text: (currentYear asString) .
	self add: label.
	
	self updateHelperFrom: startYear  to: currentYear .
	self layoutHelper .

	self newAnimation repeat
		duration: time seconds;
		when: RSAnimationLoopEvent do: [ :evt|
			
			self updateHelperFrom: startYear to: currentYear .
			self layoutHelper .
			
			"update current year"
			(currentYear >= endYear ) ifTrue: [ 
				currentYear := startYear.
				label text: currentYear asString.
			] 
			ifFalse: [ 
				currentYear := currentYear + 1.
				label text: (startYear asString , ' - ', currentYear asString ).
			].			
			
		]