helper methods
layoutHelper
	| oldIndex currentIndex circle iteration |
	currentIndex := 0.
	iteration := 0.
	
	[ currentIndex < radialFigures size ] whileTrue: [ | currentSize |
		iteration := iteration + 1.
		oldIndex := currentIndex.
		currentSize := iteration * 10. 
		currentIndex := oldIndex + currentSize.
		currentIndex := currentIndex min: radialFigures size.
		"The following check is to avoid having a small circle near the center for the last collaborators"
		radialFigures size - currentIndex < currentSize ifTrue: [ currentIndex := radialFigures size ].
		circle := radialFigures copyFrom: oldIndex + 1 to: currentIndex.
		PMRadialLayout on: circle.
		RSLocation new center; stick: circle on: centralFigure.
		].
