private - accessing
prvtSetHelperVars
	
	keyToNumOfPapers := keyToPublication collect: [ :oldValue | 
		                     oldValue size ] .

	keysToSizeSortedBySize := self cleanAndSort: keyToNumOfPapers.
	keysToSizeSortedBySize := keysToSizeSortedBySize first: (15 min: keysToSizeSortedBySize size).
	
	keysSortedBySize := keysToSizeSortedBySize collect: #key.
	
	total := keysToSizeSortedBySize
		         inject: 0
		         into: [ :sum :each | sum + each value ]. "sum the total values"