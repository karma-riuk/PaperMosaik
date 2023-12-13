private - accessing
year: aYear
	year := aYear.
	keyToPublication :=  self prvtKeyToPublicationForYear: aYear.
	self prvtSetHelperVars.
	self addAllParts: (self maxSize: total).