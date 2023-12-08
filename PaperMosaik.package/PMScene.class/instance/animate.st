animation
animate

	| currentStartYear currentEndYear labelText label |
	
	connections children do: [ :connection | connection width: 0 ].
	
	currentStartYear := startYear.
	currentEndYear := currentStartYear + 1.
	labelText := currentEndYear asString.
	label := RSLabel new text: currentStartYear asString , ' - ' , currentEndYear asString; fontSize: 30.
	self addFixedShape: label.
	label translateBy: 100 @ 20.

	self updateHelperFrom: currentStartYear to: currentEndYear.


	self newAnimation repeat
		duration: 1 seconds;
		when: RSAnimationLoopEvent do: [ :evt | | oldSizeCentral newSizeCentral oldSizesRadial newSizesRadial |
			self updateHelperFrom: currentStartYear to: currentEndYear.
			oldSizeCentral := centralFigure parts width.
			oldSizesRadial := radialFigures collect: [ :fig | fig parts width ] into: OrderedCollection new.
			 

			"update current year"
		
			(currentEndYear - startYear >= window and: endYear - currentStartYear >= window) ifTrue:[
				currentStartYear := currentStartYear + 1.
				currentEndYear := currentEndYear + 1.
				].
			currentEndYear - startYear < window ifTrue: [ 
				currentEndYear := currentEndYear + 1.
				].
			currentEndYear = (endYear + 1) ifTrue: [
				currentStartYear := startYear.
				currentEndYear := currentStartYear + 1.
				self updateHelperFrom: currentStartYear to: currentEndYear.
				].
			newSizeCentral := centralFigure maxSizeFromYear: currentStartYear toYear: currentEndYear.
			newSizesRadial := radialFigures collect: [ :fig | fig maxSizeFromYear: currentStartYear toYear: currentEndYear ] into: OrderedCollection new.
			
			self newAnimation duration: 1 seconds; from: oldSizeCentral; to: newSizeCentral; on: centralFigure set: #partsSize:.
			1 to: radialFigures size do: [ :i | 
				self newAnimation duration: 1 seconds;
				from: (oldSizesRadial at: i); to: (newSizesRadial at: i);
				 on: (radialFigures at: i) set: #partsSize:. ].
			


			label text: currentStartYear asString , ' - ' , currentEndYear asString ]