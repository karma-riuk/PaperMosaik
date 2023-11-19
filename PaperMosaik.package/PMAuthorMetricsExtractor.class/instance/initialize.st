initialization
initialize 
	super initialize .
	self slidingWindowSize: 10 .
	self publicationCountersByTypeByYear: Dictionary new .
	self coAuthorsToAddByYear: Dictionary new .
	self coAuthorsToRemoveByYear: Dictionary new .