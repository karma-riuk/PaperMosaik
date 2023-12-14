helper methods
layoutFigures
	layoutType class = PMRadialLayout ifTrue: [ 
		| oldIndex currentIndex circle iteration |
			currentIndex := 0.
			iteration := 0.
	
	[ currentIndex < radialFigures size ] whileTrue: [ | currentSize |
		iteration := iteration + 1.
		oldIndex := currentIndex.
		currentSize := iteration * 10. 
		currentIndex := oldIndex + currentSize.
		currentIndex := currentIndex min: radialFigures size.
		radialFigures size - currentIndex < currentSize ifTrue: [ currentIndex := radialFigures size 		].
		circle := radialFigures copyFrom: oldIndex + 1 to: currentIndex.
		layoutType on: circle.
		RSLocation new center; stick: circle on: centralFigure.
		].
		 ] ifFalse: [ 
		 
	layoutType initialRadius: centralFigure diagonal; initialAngleInDegree: -109; on: radialFigures.
	].
	
