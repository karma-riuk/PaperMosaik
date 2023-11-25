accessing
publicationsByYearFromYear: startYear toYear: endYear
|yearToPub|
	yearToPub := Dictionary new.
	startYear  to: endYear  do: [ :year |
		(publicationsByYear includesKey: year)
													ifTrue: [
														yearToPub at: year put: (publicationsByYear at: year).
												] 
											].
	yearToPub removeKey: self ifAbsent: [  ] .
	^(yearToPub)