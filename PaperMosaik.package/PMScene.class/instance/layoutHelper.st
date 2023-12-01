helper methods
layoutHelper
	| radius maxWidth |
	
	maxWidth := 0.
	radialFigures  do: [ :each | maxWidth < each width ifTrue: [ maxWidth = each width ] ].
	maxWidth < centralFigure width ifTrue: [ maxWidth := centralFigure width ].
	radius := 2 * maxWidth.
	
"	(RSWeightedCircleLayout new radius: radius) on: radialFigures."
	RSWeightedCircleLayout on: radialFigures.
	
"	centralResearcher translateTopLeftTo: (self extent x / 2) @ (self extent y / 2)."
	RSLocation new center; stick: centralFigure on: radialFigures.
	
	self camera zoomToFit.
