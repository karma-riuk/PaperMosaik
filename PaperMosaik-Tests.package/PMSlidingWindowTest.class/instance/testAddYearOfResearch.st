tests
testAddYearOfResearch

| slidingWindow year2019 year2020 year2021 |
	 slidingWindow := PMSlidingWindow new.
    slidingWindow maximumSize: 3. 
    
    year2019 := PMYearOfResearch new year: 2019; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 2 ; at: 'ConferencePaper' put: 1 ; yourself).
    year2020 := PMYearOfResearch new year: 2020; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 3 ; yourself).
    year2021 := PMYearOfResearch new year: 2021; typeBasedPublicationCounts: (Dictionary new at: 'ConferencePaper' put: 4 ; yourself).

    slidingWindow addYearOfResearch: year2019.
    self assert: (slidingWindow yearsOfResearchInWindow size) equals: 1.
    self assert: (slidingWindow typeCountersInWindow at: 'JournalArticle') equals: 2.
    self assert: (slidingWindow typeCountersInWindow at: 'ConferencePaper') equals: 1.

    slidingWindow addYearOfResearch: year2020.
    self assert: (slidingWindow yearsOfResearchInWindow size) equals: 2.
    self assert: (slidingWindow typeCountersInWindow at: 'JournalArticle') equals: 5.  "2 from 2019 + 3 from 2020"

    slidingWindow addYearOfResearch: year2021.
    self assert: (slidingWindow yearsOfResearchInWindow size) equals: 3.
    self assert: (slidingWindow typeCountersInWindow at: 'ConferencePaper') equals: 5.  "1 from 2019 + 4 from 2021"
    self assert: (slidingWindow currentMaxYear) equals: 2021.
    self assert: (slidingWindow currentMinYear) equals: 2019.

    "Adding another year to trigger the removal of the oldest year (2019)"
    slidingWindow addYearOfResearch: (PMYearOfResearch new year: 2022; typeBasedPublicationCounts: (Dictionary new at: 'JournalArticle' put: 1 ; yourself)).
    self assert: (slidingWindow yearsOfResearchInWindow size) equals: 3.  "Size remains at maximumSize"
    self assert: (slidingWindow yearsOfResearchInWindow anySatisfy: [:each | each year = 2019]) not.
    self assert: (slidingWindow currentMinYear) equals: 2020.
	 self assert: (slidingWindow typeCountersInWindow at: 'ConferencePaper') equals: 4. "(1+4)-1"
	 self assert: (slidingWindow typeCountersInWindow at: 'JournalArticle') equals: 4. "(2+3)+1-2"
