helper methods
connectFigures
	| centralResearcher collaboratorToNumCollaborations maxCollaborations radialResearchers w |

	centralResearcher := centralFigure model.
	collaboratorToNumCollaborations := centralResearcher
		                                   getAuthorToNumCollaborationsFrom:
		                                   centralResearcher firstYearWithPublication 
		                                   to: centralResearcher lastYearWithPublication.
	

	w := self encompassingRectangle width.



	minConnectionThickness  := (w * (1 / 1000)) ceiling.
	maxConnectionThickness := (w * (10 / 1000)) ceiling.

	radialResearchers := radialFigures collect: [ :fig | fig model ] into: OrderedCollection new.
	
	maxCollaborations := (collaboratorToNumCollaborations collect: #value) max.

	radialFigures do: [ :fig | 
		| col nCol thickness line |
		(collaboratorToNumCollaborations includesKey: fig model) ifTrue: [ 
			col := fig model.
			nCol := collaboratorToNumCollaborations at: col.
			thickness := minConnectionThickness
			             +
				             (nCol / maxCollaborations
				              * (maxConnectionThickness - minConnectionThickness)) ceiling.

			line := RSLine new
				        attachPoint: RSCenteredAttachPoint new;
				        color: (Color r: 0.68 g: 0.83 b: 0.91);
				        width: thickness;
				        from: fig;
				        to: centralFigure.
			connections add: line.
			] ].
	connections adjustToChildren.
	self add: connections.
	connections pushBack.
	