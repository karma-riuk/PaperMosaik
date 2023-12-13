as yet unclassified
model: aYear
	year := aYear.
	keyToPublication := self prvtKeyToPublicationForYear: aYear.
	self prvtSetHelperVars.
"	self addAllParts: keyToPublication."
	self addAllParts: (self maxSize: total).
	
	