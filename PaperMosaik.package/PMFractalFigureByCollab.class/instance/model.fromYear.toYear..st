accessing
model: aResearcher fromYear: startYear toYear: endYear
	model := aResearcher.
	self addAllParts: (aResearcher publicationsCategorizedByCollaboratorFromYear: startYear ToYear: endYear ).
	self addName: aResearcher id.
