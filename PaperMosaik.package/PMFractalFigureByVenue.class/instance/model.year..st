accessing
model: aField year: aYear
	
	model := aField.
	keyToPublication := self prvtKeyToPublication: aField forYear: aYear.
	self prvtSetHelperVars.
"	self addAllParts: keyToPublication."
	self addAllParts: (self maxSize: total).
	self addName: aField.
	self year: aYear.