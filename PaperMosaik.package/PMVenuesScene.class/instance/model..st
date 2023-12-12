animation
model: someFields
	 
	fields := someFields reject: [ :field | field = 'undefined' ].
	figures := fields collect: [ :field | PMFractalFigureByVenue new model: field ] into: RSGroup new.
	self addAll: figures.
	figures do: [ :fig | fig adjustToChildren ].
	self layoutFigures.
	self zoomToFit.
	startYear := 1970.
	endYear := 2020.
	