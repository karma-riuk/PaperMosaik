accessing
animate

	| currentYear labelText label |
	currentYear := startYear + 1.
	labelText := currentYear asString.
	label := RSLabel new text: startYear asString , ' - ' , currentYear asString.
	self add: label.

	self updateHelperFrom: startYear to: currentYear.
	self layoutHelper.

	self newAnimation repeat
		duration: 2 seconds;
		when: RSAnimationLoopEvent do: [ :evt | 
			self updateHelperFrom: startYear to: currentYear.
			self layoutHelper.

			"update current year"
			currentYear := currentYear >= endYear
				               ifTrue: [ startYear + 1 ]
				               ifFalse: [ currentYear + 1 ].
			label text: startYear asString , ' - ' , currentYear asString ]