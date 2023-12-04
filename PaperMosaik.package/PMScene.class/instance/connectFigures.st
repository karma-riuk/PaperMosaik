helper methods
connectFigures

	| centralResearcher collaboratorToNumCollaborations maxCollaborations maxLineThickness minLineThickness |
	connections do: [ :line | self removeShape: line ].
	connections removeAll.
	
	centralResearcher := centralFigure model.
	collaboratorToNumCollaborations := centralResearcher getAuthorToNumCollaborations  .
	maxCollaborations := (collaboratorToNumCollaborations values) max.
	minLineThickness := 5.
	maxLineThickness := 15.
	
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