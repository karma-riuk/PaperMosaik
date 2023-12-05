helper methods
connectFigures

	| centralResearcher collaboratorToNumCollaborations maxCollaborations maxLineThickness minLineThickness radialResearchers nCols w |
	connections do: [ :line | self removeShape: line ].
	connections removeAll.
	
	centralResearcher := centralFigure model.
	collaboratorToNumCollaborations := centralResearcher getAuthorToNumCollaborations  .
	self zoomToFit .
	
	w := self encompassingRectangle  width.

	
	
	minLineThickness := (w*(5/100))  ceiling.
	maxLineThickness := (w*(30/100))  ceiling.
	
	radialResearchers := OrderedCollection new.
	radialFigures do: [:fig| 
		radialResearchers add: (fig model).
		].
	
	nCols := OrderedCollection new.
	radialResearchers do: [ :res|
		nCols add: (collaboratorToNumCollaborations at: res).
		 ].
	
	
	maxCollaborations := nCols max.
	
	radialFigures do: [:fig| |col nCol thickness line|
		col := fig model.
		nCol := collaboratorToNumCollaborations at: col.
		thickness := minLineThickness + (((nCol/maxCollaborations)*(maxLineThickness-minLineThickness)) ceiling ).
		
		line := RSLine new
			attachPoint: RSCenteredAttachPoint new;
			color: (Color r: 0.68 g: 0.83 b: 0.91);
			width: thickness ;
			from: fig;
			to: centralFigure .
		self add: line.
		line pushBack.
		connections add: line.
		].