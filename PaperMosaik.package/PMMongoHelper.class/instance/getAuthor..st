initialization
getAuthor: name
	"must be full name separated by spaces"
	"startYear and endYear are inclusive"
	"adding a collection Author might speed this up"
	|foundAuthor newAuthor queryResult|
	collection := database getCollection: 'Authors'.
	queryResult  := collection select: {'name'->name} asDictionary .
	queryResult size = 0 ifTrue: [^ nil].
	foundAuthor:= queryResult at: 1.
	newAuthor := PMAuthor create: (foundAuthor at: 'name')
	 withCoauthors: (foundAuthor at: 'coauthorsByYear') withPapers: (foundAuthor at: 'papersByYear') withId: (foundAuthor at: '_id').
	^ newAuthor  .