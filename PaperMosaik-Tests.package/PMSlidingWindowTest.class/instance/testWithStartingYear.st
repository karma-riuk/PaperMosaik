tests
testWithStartingYear
    | slidingWindow validYear invalidYear |
    validYear := 2020.
    slidingWindow := PMSlidingWindow withStartingYear: validYear.
    self assert: slidingWindow currentMinYear equals: validYear.
    self assert: slidingWindow currentMaxYear equals: validYear.

    invalidYear := 'NotAnInteger'.
    self should: [PMSlidingWindow withStartingYear: invalidYear] raise: Error.

	 "Check if the initialize works"
    self assert: (slidingWindow yearsOfResearchInWindow isEmpty).