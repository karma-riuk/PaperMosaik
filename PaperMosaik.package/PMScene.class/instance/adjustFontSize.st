helper methods
adjustFontSize
	| fontSize |
	self zoomToFit.
	
	fontSize := self visibleRectangle width / 50.
	centralFigure fontSize: fontSize.
	radialFigures do: [ :figure | figure fontSize: fontSize ].
	self layoutHelper.