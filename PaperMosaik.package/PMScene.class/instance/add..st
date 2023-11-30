adding
add: aFractalFigure
	|fractalFigures lineThickness a|
	aFractalFigure class = RSLine ifTrue: [ 
		a := 1.
		 ].
	super add: aFractalFigure.
	
	fractalFigures := (self shapes) select: [: el |
		el isKindOf: PMFractalFigure .
		].
	
	
	lineThickness := 2.
	
	fractalFigures  do: [ :shape|  |researcher lines|
		researcher:= shape model.
		((researcher allCollaborators) includes: (aFractalFigure model)) ifTrue: [ 
			lines := RSEdgeBuilder line
			color: (Color r: 0.68 g: 0.83  b:0.91);
			width: lineThickness ;
			canvas: self;
			connectFrom: (aFractalFigure model)  to: (shape model).
			lines do: [ :l | 
				l attachPoint: (RSBorderAttachPoint new) .
				l pushBack.
				l capRound  .
				].
			 ].
		].
	 
	centralResearcher ifNil: [ centralResearcher := aFractalFigure ] 
						 	ifNotNil: [  
										 radialResearchers add: aFractalFigure.
									].
	