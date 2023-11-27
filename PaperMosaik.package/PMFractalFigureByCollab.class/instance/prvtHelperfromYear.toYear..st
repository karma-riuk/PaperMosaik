accessing
prvtHelperfromYear: startYear toYear: endYear
	self addAllParts: ((self model) publicationsCategorizedByCollaboratorFromYear: startYear ToYear: endYear ).
	self addName: (self model) id.
