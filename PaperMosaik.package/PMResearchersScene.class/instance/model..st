accessing
model: aResearcher
	startYear ifNil: [ 
		startYear := aResearcher firstYearWithPublication
	].
	endYear ifNil: [ 
		endYear := aResearcher lastYearWithPublication
	].
	centralFigure := figureType new model: aResearcher.	
	radialFigures := aResearcher allCollaborators collect: [ :collab | figureType new model: collab ] into: RSGroup new.	
	self add: centralFigure.
	self addAll: radialFigures.
	self layoutFigures.
	self adjustFontSize.
	self connectFigures.
	
	
	


	
