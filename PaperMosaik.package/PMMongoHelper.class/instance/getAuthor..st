initialization
getAuthor: name
	|foundAuthor newAuthor queryResult yor yearToYor paperKeys pubs|
	collection := database getCollection: 'Authors'.
	queryResult  := collection select: {'name'->name} asDictionary .
	queryResult size = 0 ifTrue: [^ nil].
	foundAuthor:= queryResult at: 1.
	newAuthor := PMAuthor withAuthorId: (foundAuthor at: '_id') withAuthorName: (foundAuthor at: 'name').
	yearToYor:= Dictionary new.
	(foundAuthor at: 'papersByYear') keysDo: [:year|
		yor:= PMYearOfResearch withAuthor: (foundAuthor at: 'name')  withYear: year.
		yor coAuthors: (foundAuthor at: 'coauthorsByYear').
		paperKeys := (foundAuthor at: 'papersByYear') at: year.
		pubs := OrderedCollection new.
		paperKeys do: [ :paperKey |
			pubs add:(PMPublicationFactory createPublication: (self getPaperByKey: paperKey ))
			]. 
		yor publications: pubs. 
		yearToYor at: year put: yor.
		  ]. 
	newAuthor yearsOfResearch: yearToYor .
	^ newAuthor  .