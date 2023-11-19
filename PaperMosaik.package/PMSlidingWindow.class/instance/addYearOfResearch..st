adding
addYearOfResearch: aPMYearOfResearch
    | currentSize |
    currentSize := yearsOfResearchInWindow size.

    currentSize >= maximumSize ifTrue: [self removeOldestYearOfResearch].
    
    yearsOfResearchInWindow addLast: aPMYearOfResearch.
    
    aPMYearOfResearch typeBasedPublicationCounts keysAndValuesDo: [:key :value |
        (self typeCountersInWindow includesKey: key) ifTrue: [
            self typeCountersInWindow at: key put: ((self typeCountersInWindow at: key) + value).
        ] ifFalse: [
            self typeCountersInWindow at: key put: value.
        ].
    ].
    
    currentMaxYear := aPMYearOfResearch year.
    currentMinYear := (yearsOfResearchInWindow first year) max: (currentMaxYear - maximumSize + 1).
