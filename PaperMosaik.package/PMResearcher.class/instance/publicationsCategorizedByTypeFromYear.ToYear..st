accessing
publicationsCategorizedByTypeFromYear: startingYear ToYear: endingYear
	|publicationsByType|
	publicationsByType := Dictionary new.
	startingYear to: endingYear do: [ :year |
												(publications at: year) do: [ :publication |
																									(publicationsByType includesKey: publication type)
																										ifFalse: [ publicationsByType at: publication type put: OrderedCollection new ] .
																									(publicationsByType at: publication type) add: publication 
																						] 
												] .
	^(publicationsByType)