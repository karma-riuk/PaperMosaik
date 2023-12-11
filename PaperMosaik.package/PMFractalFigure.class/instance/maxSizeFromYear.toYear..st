accessing
maxSizeFromYear: from toYear: to
	| oldKeyToPublication ret |
	oldKeyToPublication := keyToPublication.
	
	keyToPublication := self prvtHelperfromYear: from toYear: to.
	self prvtSetHelperVars.
	ret := self maxSize: total.
	
	keyToPublication := oldKeyToPublication.
	self prvtSetHelperVars.
	
	^ ret