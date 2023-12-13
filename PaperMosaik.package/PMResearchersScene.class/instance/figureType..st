accessing
figureType: anObject

	figureType := anObject.
	centralFigure ifNotNil: [ | researcher |
		researcher := centralFigure model.
		self shapes do: [ :shape | self removeShape: shape ].
		self model: researcher.
		 ]