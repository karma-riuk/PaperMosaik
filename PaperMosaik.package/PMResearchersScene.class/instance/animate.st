animation
animate

	| currentStartYear currentEndYear labelText label parallelAnimations sequentialAnimations |
	
	connections children do: [ :connection | connection width: 0 ].
	radialFigures do: [ :fig | fig setTransparency: 0.3 ].
	self cacheThicknesses.
	parallelAnimations := RSParallelAnimation new.
	sequentialAnimations := RSSequentialAnimation  new.
	
	currentStartYear := startYear.
	currentEndYear := currentStartYear + 1.
	labelText := currentEndYear asString.
	label := RSLabel new text: currentStartYear asString , ' - ' , currentEndYear asString; fontSize: 30.
	self addFixedShape: label.
	label translateBy: 100 @ 20.

	self updateHelperFrom: currentStartYear to: currentEndYear.


	self newAnimation repeat
		duration: duration seconds;
		when: RSAnimationLoopEvent do: [ :evt | | oldSizeCentral newSizeCentral oldSizesRadial newSizesRadial |
			parallelAnimations reset.
			sequentialAnimations reset.
			self updateHelperFrom: currentStartYear to: currentEndYear.
			sequentialAnimations add: (self updateConnectionsFrom: currentStartYear to: currentEndYear).
			 
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
				].
			newSizeCentral := centralFigure maxSizeFromYear: currentStartYear toYear: currentEndYear.
			newSizesRadial := radialFigures collect: [ :fig | fig maxSizeFromYear: currentStartYear toYear: currentEndYear ] into: OrderedCollection new.
			
			parallelAnimations add: (RSTransitionAnimation new  duration: (duration / 2) seconds; from: oldSizeCentral; to: newSizeCentral; on: centralFigure set: #partsSize:).
			
			1 to: radialFigures size do: [ :i | | oldSize newSize |
				oldSize := oldSizesRadial at: i.
				newSize := newSizesRadial at: i.
				oldSize ~= newSize ifTrue: [
					parallelAnimations add: (RSTransitionAnimation new duration: (duration / 2) seconds;
						from: oldSize; to: newSize;
				 		on: (radialFigures at: i) set: #partsSize:).
					].
				].
			sequentialAnimations add: parallelAnimations.
			
			self addAnimation: sequentialAnimations.

			label text: currentStartYear asString , ' - ' , currentEndYear asString.
			 ]