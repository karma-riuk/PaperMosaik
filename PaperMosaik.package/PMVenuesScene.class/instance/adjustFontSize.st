animation
adjustFontSize
	| fontSize |
	self zoomToFit.
	
	fontSize := self visibleRectangle width / 50.
	figures do: [ :figure | figure fontSize: fontSize ].
	self layoutFigures.