animation
animate

	| currentStartYear currentEndYear labelText label |
	currentStartYear := startYear.
	currentEndYear := currentStartYear + 1.
	labelText := currentEndYear asString.
	label := RSLabel new text: currentStartYear asString , ' - ' , currentEndYear asString; fontSize: 30.
	self addFixedShape: label.
	label translateBy: 100 @ 20.

	self updateHelperFrom: currentStartYear to: currentEndYear.


	self newAnimation repeat
		duration: 1 seconds;
		when: RSAnimationLoopEvent do: [ :evt | 
			self updateHelperFrom: currentStartYear to: currentEndYear.
"			self layoutHelper."

			"update current year"
			currentEndYear - startYear < window ifTrue: [ 
				currentEndYear := currentEndYear + 1.
				].
			endYear - currentStartYear <= window ifTrue: [ 
				currentStartYear := currentStartYear + 1.
				].
			(currentEndYear - startYear >= window and: endYear - currentStartYear > window) ifTrue:[
				currentStartYear := currentStartYear + 1.
				currentEndYear := currentEndYear + 1.
				].
			currentStartYear = endYear ifTrue: [
				currentStartYear := startYear.
				currentEndYear := currentStartYear + 1.
				].
			label text: currentStartYear asString , ' - ' , currentEndYear asString ]