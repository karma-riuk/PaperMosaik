initialization
initialize 
	super initialize .
	self slidingWindowSize: 10 .
	"Due to the lazy initialization logic of publicationCountersByTypeByYear"
	self publicationCountersByTypeByYear: nil .
	self coAuthorsToAddByYear: Dictionary new .
	self coAuthorsToRemoveByYear: Dictionary new .