helper methods
connectFiguresFrom: from to: to

	| centralResearcher collaboratorToNumCollaborations maxCollaborations maxLineThickness minLineThickness radialResearchers nCols w |
	connections do: [ :line | self removeShape: line ].
	connections removeAll.

	centralResearcher := centralFigure model.
	collaboratorToNumCollaborations := centralResearcher
		                                   getAuthorToNumCollaborationsFrom:
		                                   from
		                                   to: to.
	self zoomToFit.

	w := self encompassingRectangle width.



	minLineThickness := (w * (1 / 1000)) ceiling.
	maxLineThickness := (w * (10 / 1000)) ceiling.

	radialResearchers := OrderedCollection new.
	radialFigures do: [ :fig | radialResearchers add: fig model ].

	nCols := OrderedCollection new.
	radialResearchers do: [ :res | 
		(collaboratorToNumCollaborations includesKey: res) ifTrue: [ 
			nCols add: (collaboratorToNumCollaborations at: res) ] ].


	maxCollaborations := nCols max.

	radialFigures do: [ :fig | 
		| col nCol thickness line |
		(collaboratorToNumCollaborations includesKey: fig model) ifTrue: [ 
			col := fig model.
			nCol := collaboratorToNumCollaborations at: col.
			thickness := minLineThickness
			             +
				             (nCol / maxCollaborations
				              * (maxLineThickness - minLineThickness)) ceiling.

			line := RSLine new
				        attachPoint: RSCenteredAttachPoint new;
				        color: (Color r: 0.68 g: 0.83 b: 0.91);
				        width: thickness;
				        from: fig;
				        to: centralFigure.
			self add: line.
			line pushBack.
			connections add: line ] ]