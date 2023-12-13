animation
animate
	| label currentYear parallelAnimations oldSizes newSizes |
	
	parallelAnimations := RSParallelAnimation new.
	
	currentYear := startYear.
	label := RSLabel new text: currentYear asString; fontSize: 30.
	self addFixedShape: label.
	label translateBy: 100 @ 20.
	
	self updateFiguresForYear: currentYear.
	self layoutFigures.
	
	self newAnimation repeat; duration: duration seconds;
		when: RSAnimationLoopEvent do: [ :evt|
			parallelAnimations reset.
			oldSizes := figures collect: [ :fig | fig parts width ] into: OrderedCollection new.
			
			label text: currentYear asString.
			self updateFiguresForYear: currentYear.
"			self layoutFigures."
			
			currentYear := currentYear < endYear 
				ifTrue: [ currentYear + 1 ] 
				ifFalse: [ startYear	].
			newSizes := figures collect: [ :fig | fig maxSizeForYear: currentYear ] into: OrderedCollection new.
			
			1 to: figures size do: [ :i | | oldSize newSize |
				oldSize := oldSizes at: i.
				newSize := newSizes at: i.
				oldSize ~= newSize ifTrue: [
					parallelAnimations add: (RSTransitionAnimation new duration: (duration / 2) seconds;
						from: oldSize; to: newSize;
				 		on: (figures at: i) set: #partsSize:).
					].
				].
				self addAnimation: parallelAnimations.
			].
	