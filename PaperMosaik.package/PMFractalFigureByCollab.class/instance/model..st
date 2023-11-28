accessing
model: aResearcher
	model := aResearcher.
	self addAllParts: (aResearcher publicationsCategorizedByCollaborator).
	self addName: aResearcher id.
