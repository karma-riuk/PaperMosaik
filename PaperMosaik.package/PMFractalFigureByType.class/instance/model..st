accessing
model: aResearcher
	model := aResearcher.
	self addAllParts: (aResearcher publicationsCategorizedByType).
	self addName: aResearcher id.
	