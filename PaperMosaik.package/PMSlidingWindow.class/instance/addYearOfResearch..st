adding
addYearOfResearch: aPMYearOfResearch
    | currentSize |
	 "The length of the current window"
    currentSize := yearsOfResearchInWindow size.

    currentSize >= maximumSize ifTrue: [ self removeOldestYearOfResearch. ].
    
    yearsOfResearchInWindow addLast: aPMYearOfResearch.
	 "TODO: change the current counter"
	
    currentMaxYear := aPMYearOfResearch year.
	 currentMinYear := aPMYearOfResearch year - currentSize .