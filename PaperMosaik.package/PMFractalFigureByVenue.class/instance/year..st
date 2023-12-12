accessing
year: aYear
	year := aYear.
	keyToPublication :=  self prvtKeyToPublication: model forYear: aYear.
	self prvtSetHelperVars.
	self addAllParts: (self maxSize: total).