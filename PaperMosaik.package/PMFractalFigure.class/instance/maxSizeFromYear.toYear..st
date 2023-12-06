accessing
maxSizeFromYear: from toYear: to
	| yearToNumOfPapers keysToValueSortedByValue keysSortedByValue total |
	yearToNumOfPapers := (self prvtKeyToPublicationsFromYear: from toYear: to) collect: [ :oldValue | 
		                     oldValue size ] .

	keysToValueSortedByValue := self cleanAndSort: yearToNumOfPapers.
	keysToValueSortedByValue := keysToValueSortedByValue first: (15 min: keysToValueSortedByValue size).
	keysSortedByValue := keysToValueSortedByValue collect: #key.
	
	total := keysToValueSortedByValue
		         inject: 0
		         into: [ :sum :each | sum + each value ]. "sum the total values"
	^ self maxSize: total