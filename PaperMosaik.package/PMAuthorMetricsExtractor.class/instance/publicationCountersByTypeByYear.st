accessing
publicationCountersByTypeByYear

	| sortedYearsOfResearch lastYearMax endYear range publicationCounterForYear |
	publicationCountersByTypeByYear ifNotNil: [ 
		^ publicationCountersByTypeByYear ].
	publicationCountersByTypeByYear ifNil: [ 
		(PMAuthor isAuthorInAuthors: author authorId) ifFalse: [ 
			self error:
				'Invalid input: author not found in global dictionary of Authors in PMAuthors' ].
		(PMAuthor isAuthorInAuthors: author authorId) ifTrue: [
			"Initialize the counter"
			self publicationCountersByTypeByYear: Dictionary new. 
			"Collect all years of reseach with new publications"
			sortedYearsOfResearch := author allYearsOfResearch.
			lastYearMax := sortedYearsOfResearch last.
			"Compute the minimum between the last yearOfResearch and the endingYear of the PMAuhtorMetricsExtractor instance"
			endYear := endingYear min: lastYearMax.

			"Ensure that sortedYearsOfResearch first and endYear are integers"
			range := (sortedYearsOfResearch first asInteger) to: (endYear asInteger).
			"Iterate over the range of years"
			range do: [ :year | 
				publicationCounterForYear := (sortedYearsOfResearch includes: year)
					                             ifTrue: [ 
						                             (publicationCountersByTypeByYear 
							                              at: year) ifAbsent: [ 
																"TODO: implement the actual logic. wait for the sliding window"
							                             Dictionary new .  ] ]
					                             ifFalse: [ 
						                             (publicationCountersByTypeByYear 
							                              at: year - 1) ifAbsent: [ 
							                             self error:
								                             'Invalid year. The current year is trying to collect information from a preavious not existing year' ] ].
				self
					addPublicationCountersForYear: year
					publicationCounters: publicationCounterForYear ] ] ]