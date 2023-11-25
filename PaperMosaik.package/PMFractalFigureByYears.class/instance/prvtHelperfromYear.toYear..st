accessing
prvtHelperfromYear: startYear toYear: endYear
	self addAllParts: ((self model) publicationsByYearFromYear: startYear toYear: endYear ).
 	self addName: (self model) id.
	
	