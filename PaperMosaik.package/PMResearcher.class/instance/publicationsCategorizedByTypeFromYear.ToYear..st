accessing
publicationsCategorizedByTypeFromYear: startingYear ToYear: endingYear
	|publicationsByTypeAsString publicationsByTypeAsLabeledObject|
	publicationsByTypeAsString := Dictionary new.
	startingYear to: endingYear do: [ :year |
												(publicationsByYear includesKey: year)
													ifTrue: [
														(publicationsByYear at: year) do: [ :publication |
																									(publicationsByTypeAsString includesKey: publication type)
																										ifFalse: [ publicationsByTypeAsString at: publication type put: OrderedCollection new ] .
																									(publicationsByTypeAsString at: publication type) add: publication 
																						]
														]
												].
	publicationsByTypeAsLabeledObject := Dictionary new.
	publicationsByTypeAsString keysAndValuesDo: [ :key :value | publicationsByTypeAsLabeledObject at: (PMLabeledObject new label: key; object: key) put: value ].
	
	^(publicationsByTypeAsLabeledObject)