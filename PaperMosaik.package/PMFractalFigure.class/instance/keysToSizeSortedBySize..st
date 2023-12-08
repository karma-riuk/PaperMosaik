adding
keysToSizeSortedBySize: keyToPublication

	| yearToNumOfPapers keysToSizeSortedBySize |
	yearToNumOfPapers := keyToPublication collect: [ :oldValue | 
		                     oldValue size ] .

	keysToSizeSortedBySize := self cleanAndSort: yearToNumOfPapers.
	^ keysToSizeSortedBySize first: (15 min: keysToSizeSortedBySize size)