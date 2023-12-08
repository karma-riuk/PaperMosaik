initialization
initialize
	super initialize.
	self @ RSCanvasController  .
	figureType := PMFractalFigureByType.
	window := 5.
	connections := RSComposite new.