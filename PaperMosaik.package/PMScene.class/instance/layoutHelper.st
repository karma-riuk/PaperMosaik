helper methods
layoutHelper
	
 	| fontSize circle10 circle25 circle50 circle75 |
	circle10 := radialFigures first: 10.
	circle25 := radialFigures copyFrom: 11 to: 36.
	circle50 := radialFigures copyFrom: 37 to: 87.
	circle75 := radialFigures copyFrom: 88 to: (163 min: radialFigures size).
	
	PMRadialLayout on: circle10.
	PMRadialLayout on: circle25.
	PMRadialLayout on: circle50.
	PMRadialLayout on: circle75.
	
	RSLocation new center; stick: circle10 on: circle75
	; stick: circle25 on: circle75
	; stick: circle50 on: circle75
	; stick: centralFigure on: circle75 
	.
	
	self zoomToFit.
	fontSize := self visibleRectangle width / 50.
	centralFigure fontSize: fontSize.
	radialFigures do: [ :figure | figure fontSize: fontSize ].

	PMRadialLayout on: circle10.
	PMRadialLayout on: circle25.
	PMRadialLayout on: circle50.
	PMRadialLayout on: circle75.
	self zoomToFit.