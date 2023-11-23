accessing
model: aResearcher
	model := aResearcher.
	self addAllParts: (aResearcher publicationsCategorizedByTypeFromYear: 2015 ToYear: 2018).
	self addName: aResearcher id.
	