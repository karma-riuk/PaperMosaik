helper methods
layoutHelper
	
 	| fontSize |
	
	PMRadialLayout on: radialFigures.
"	RSWeightedCircleLayout on: radialFigures."
	
	RSLocation new center; stick: centralFigure on: radialFigures.
	self zoomToFit.
	fontSize := self visibleRectangle width / 50.
	centralFigure fontSize: fontSize.
	radialFigures do: [ :figure | figure fontSize: fontSize ].
	
	PMRadialLayout on: radialFigures.
	self zoomToFit.
