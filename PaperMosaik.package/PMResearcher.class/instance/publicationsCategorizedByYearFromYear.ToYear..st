accessing
publicationsCategorizedByYearFromYear: startYear ToYear: endYear
|yearToPub|
	yearToPub := Dictionary new.
	startYear  to: endYear  do: [ :year |
		(publicationsByYear includesKey: year)
													ifTrue: [
														yearToPub at: (PMLabeledObject new label: year; object: year) put: (publicationsByYear at: year).
												] 
											].
	
	^(yearToPub)