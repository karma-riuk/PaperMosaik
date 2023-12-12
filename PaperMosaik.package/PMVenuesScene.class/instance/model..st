animation
model: someFields
	fields := someFields.
	figures := someFields collect: [ :field | PMFractalFigureByVenue new model: field. ] into: RSGroup new.
	self addAll: figures.
	RSGridLayout on: figures.