private - accessing
maxSizeForYear: aYear
	| oldKeyToPublication ret |
	oldKeyToPublication := keyToPublication.
	
	keyToPublication := self prvtKeyToPublication: model forYear: aYear.
	self prvtSetHelperVars.
	ret := self maxSize: total.
	
	keyToPublication := oldKeyToPublication.
	self prvtSetHelperVars.
	
	^ ret