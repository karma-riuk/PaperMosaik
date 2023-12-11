instance creation
fromYear: startYear toYear: endYear
"	self resetChildren ."
	keyToPublication :=  self prvtHelperfromYear: startYear toYear: endYear .
	self prvtSetHelperVars.
	self addAllParts: (self maxSize: total).