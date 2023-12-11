accessing
model: aResearcher fromYear: startYear toYear: endYear
	model := aResearcher.
	keyToPublication := self prvtHelperfromYear: startYear toYear: endYear.
	self prvtSetHelperVars.
	self addAllParts: (self maxSize: total).
	self addName: aResearcher id.
	
	