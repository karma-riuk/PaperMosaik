initialization
initialize
	super initialize.
	self @ RSCanvasController  .
	figureType := PMFractalFigureByType.
	window := 5.
	duration := 1.
	connections := RSComposite new.