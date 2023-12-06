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

"	| circle10 circle25 circle50 circle75 |
	circle10 := radialFigures first:10.
	circle25 := radialFigures copyFrom: 11 to: 35.
	circle50 := radialFigures copyFrom: 36 to: 85.
	circle75 := radialFigures copyFrom: 86 to: (160 min: radialFigures size).
	PMRadialLayout on: circle10; on: circle25; on: circle50; on: circle75.
	RSLocation new center
	; stick: circle10 on: centralFigure
	; stick: circle25 on: centralFigure
	; stick: circle50 on: centralFigure
	; stick: circle75 on: centralFigure
	."