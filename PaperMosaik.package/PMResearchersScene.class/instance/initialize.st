initialization
initialize
	super initialize.
	figureType := PMFractalFigureByType.
	layoutType := PMRadialLayout new.
	window := 5.
	connections := RSComposite new.
	