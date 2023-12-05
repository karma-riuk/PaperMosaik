accessing
prvtHelperfromYear: startYear toYear: endYear
	self addAllParts: ((self model) publicationsCategorizedByTypeFromYear: startYear ToYear: endYear).