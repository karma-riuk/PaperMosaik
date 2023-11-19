accessing
publicationCountersGeneration

	| sortedYearsOfResearch lastYearMax endYear range |
	(PMAuthor isAuthorInAuthors: author authorId) ifFalse: [ 
		self error:
			'Invalid input: author not found in global dictionary of Authors in PMAuthors' ].
	
	(PMAuthor isAuthorInAuthors: author authorId) ifFalse: [ ^ self ].
	
	"Collect all years of reseach with new publications"
	sortedYearsOfResearch := author allYearsOfResearch.
	lastYearMax := sortedYearsOfResearch last.
	endYear := endingYear min: lastYearMax.
	range := sortedYearsOfResearch first asInteger to: endYear asInteger.
	range do: [ :year | 
		(sortedYearsOfResearch includes: year)
			ifTrue: [ 
				"TODO: dictionary implementation inside the slidingWindow logic"
				self
					addPublicationCountersForYear: year
					publicationCounters: (Dictionary new
							 at: 'testType' put: 5;
							 yourself) ]
			ifFalse: [ 
				(publicationCountersByTypeByYear includesKey: year - 1) 
					ifFalse: [ self error:'Invalid year. The current year is trying to collect information from a preavious not existing year' ] .
					self addPublicationCountersForYear: year
					publicationCounters: (publicationCountersByTypeByYear at: year - 1) 
				]
		]