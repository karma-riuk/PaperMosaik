animation
model: someFields
	 
	fields := someFields reject: [ :field | field = 'undefined' ].
	figures := fields collect: [ :field | PMFractalFigureByVenue new model: field ] into: RSGroup new.
	
	startYear := 2000.
	endYear := 2023.
	
	self addAll: figures.
	figures do: [ :fig | fig adjustToChildren ].
	self layoutFigures.
	self adjustFontSize.
	self zoomToFit.
	