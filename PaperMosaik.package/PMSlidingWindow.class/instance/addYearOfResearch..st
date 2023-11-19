adding
addYearOfResearch: aPMYearOfResearch
    | currentSize |
    currentSize := yearsOfResearchInWindow size.

    currentSize >= maximumSize ifTrue: [
        self removeOldestYearOfResearch.
    ].
    
    yearsOfResearchInWindow addLast: aPMYearOfResearch.
    currentMaxYear := aPMYearOfResearch year.

    currentSize = 0 ifTrue: [
        currentMinYear := aPMYearOfResearch year.
    ].