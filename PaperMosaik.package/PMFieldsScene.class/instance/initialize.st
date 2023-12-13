initialization
initialize 
	super initialize.
	figure := PMFractalFigureByField new model: 2023.
	
	startYear := 2000.
	endYear := 2023.
	
	self add: figure.	
	self zoomToFit.