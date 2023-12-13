private - accessing
prvtSetHelperVars
	
	
	keyToNumOfPapers := keyToPublication collect: [ :venues | 
		                     (venues collectAll: [ :venue | 
				(venue publicationsByYear includesKey: year) 
				ifTrue: [ venue publicationsByYear at: year ]
				ifFalse: [OrderedCollection new ].
			]) size ] .

	keysToSizeSortedBySize := self cleanAndSort: keyToNumOfPapers.
	
	
	keysSortedBySize := keysToSizeSortedBySize collect: #key.
	
	total := keysToSizeSortedBySize
		         inject: 0
		         into: [ :sum :each | sum + each value ]. "sum the total values"