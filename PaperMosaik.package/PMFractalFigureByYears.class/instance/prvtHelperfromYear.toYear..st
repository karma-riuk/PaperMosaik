accessing
prvtHelperfromYear: startYear toYear: endYear
	self addAllParts: ((self model) publicationsCategorizedByYearFromYear: startYear ToYear: endYear ).
	
	