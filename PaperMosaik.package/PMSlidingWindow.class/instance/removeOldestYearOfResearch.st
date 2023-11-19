removing
removeOldestYearOfResearch
    | toRemove |
    toRemove := yearsOfResearchInWindow first.
    
    toRemove typeBasedPublicationCounts keysAndValuesDo: [:key :value |
        self typeCountersInWindow at: key put: ((self typeCountersInWindow at: key) - value).
        ((self typeCountersInWindow at: key) = 0)
            ifTrue: [self typeCountersInWindow removeKey: key].
    ].
    
    yearsOfResearchInWindow removeFirst.
    currentMinYear := (yearsOfResearchInWindow first) year.
