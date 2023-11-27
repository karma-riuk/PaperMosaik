adding
add: aFractalFigure
	|fractalFigures lineThickness|
	super add: aFractalFigure.
	
	fractalFigures := (self shapes) select: [: el |
		el isKindOf: PMFractalFigure .
		].
	
	
	lineThickness := 5.
	
	fractalFigures  do: [ :shape|  |researcher lines|
		researcher:= shape model.
		((researcher allCollaborators) includes: (aFractalFigure model)) ifTrue: [ 
			lines := RSEdgeBuilder line
			width: lineThickness ;
			canvas: self;
			connectFrom: (aFractalFigure model)  to: (shape model).
			lines do: [ :l | l attachPoint: (RSBorderAttachPoint new) ].
			 ].
		].
	
	centralResearcher ifNil: [ centralResearcher := aFractalFigure ] 
						   ifNotNil: [ radialResearchers add: aFractalFigure ].
	