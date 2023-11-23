accessing
model: aResearcher
	model := aResearcher.
	self addAllParts: (aResearcher publicationsCategorizedByCollaboratorFromYear: 2001 ToYear: 2003).
	self addName: aResearcher id.
