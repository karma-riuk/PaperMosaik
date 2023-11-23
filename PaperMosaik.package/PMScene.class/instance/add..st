adding
add: aFractalFigure
	super add: aFractalFigure.
	centralResearcher ifNil: [ centralResearcher := aFractalFigure ] 
						   ifNotNil: [ radialResearchers add: aFractalFigure ].
	