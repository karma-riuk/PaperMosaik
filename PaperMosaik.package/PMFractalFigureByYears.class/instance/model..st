accessing
model: aResearcher
	model := aResearcher.
	self addAllParts: (aResearcher publicationsCategorizedByYear ).
 	self addName: aResearcher id.
	
	