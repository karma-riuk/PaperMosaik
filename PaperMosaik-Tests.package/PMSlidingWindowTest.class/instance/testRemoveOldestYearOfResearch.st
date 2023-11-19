tests
testRemoveOldestYearOfResearch
	| slidingWindow year2019 year2020 year2021 |

	 slidingWindow := PMSlidingWindow new.
    slidingWindow maximumSize: 2.  "Set the sliding window size to 2"
    
    year2019 := PMYearOfResearch new year: 2019; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 2; at: 'ConferencePaper' put: 1; yourself).
    year2020 := PMYearOfResearch new year: 2020; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 1; yourself).
    year2021 := PMYearOfResearch new year: 2021; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 1; yourself).

    slidingWindow addYearOfResearch: year2019.
    slidingWindow addYearOfResearch: year2020.
    
    "Before removing"
    self assert: (slidingWindow yearsOfResearchInWindow size) equals: 2.
    self assert: (slidingWindow typeCountersInWindow at: 'JournalArticle') equals: 3.  "2 from 2019 + 1 from 2020"
    self assert: (slidingWindow typeCountersInWindow at: 'ConferencePaper') equals: 1.  "1 from 2019"

    "Add another year to trigger removal of the oldest year (2019)"
    slidingWindow addYearOfResearch: year2021.
    
    "After removing"
    self assert: (slidingWindow yearsOfResearchInWindow size) equals: 2.
    self assert: (slidingWindow yearsOfResearchInWindow anySatisfy: [:each | each year = 2019]) not.
    self assert: (slidingWindow typeCountersInWindow at: 'JournalArticle') equals: 2.  "1 from 2020 + 1 from 2021"
    self assert: (slidingWindow typeCountersInWindow includesKey: 'ConferencePaper') not.  "ConferencePaper count should be removed"
    self assert: (slidingWindow currentMinYear) equals: 2020.
