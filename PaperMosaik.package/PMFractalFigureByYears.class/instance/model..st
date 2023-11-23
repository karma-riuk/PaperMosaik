accessing
model: aResearcher
	model := aResearcher.
	self addAllParts: (aResearcher publicationsByYear).
 	self addName: aResearcher id.
	
	