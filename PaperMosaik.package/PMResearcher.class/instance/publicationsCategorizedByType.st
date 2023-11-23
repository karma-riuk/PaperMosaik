accessing
publicationsCategorizedByType
	|publicationsByType|
	publicationsByType := Dictionary new.
	
	(self publications) do: [ :publication |
		(publicationsByType includesKey: publication type)
		ifFalse: [ publicationsByType at: publication type put: OrderedCollection new 
			] .
		(publicationsByType at: publication type) add: publication 
		].
														
	^(publicationsByType)