accessing
publicationCountersGeneration

    | sortedYearsOfResearch lastYearMax endYear range slidingWindow pmYearOfResearch tmpDictionary |
    (PMAuthor isAuthorInAuthors: author authorId) ifFalse: [ 
        self error:
            'Invalid input: author not found in global dictionary of Authors in PMAuthors' ].

    slidingWindow := PMSlidingWindow withStartingYear: self startingYear .
    slidingWindow maximumSize: self slidingWindowSize. 

    sortedYearsOfResearch := author allYearsOfResearch.
    lastYearMax := sortedYearsOfResearch last.
    endYear := endingYear min: lastYearMax.
    range := sortedYearsOfResearch first asInteger to: endYear asInteger.
    range do: [:year | 
       pmYearOfResearch := (author yearsOfResearch includesKey: year) 
				ifFalse: [PMYearOfResearch new year: year; typeBasedPublicationCounts: Dictionary new; yourself]
				ifTrue: [ author yearsOfResearch at: year ].
        slidingWindow addYearOfResearch: pmYearOfResearch.
		  
		  "Make a deep copy of the current state of the slidingWindow"
		  tmpDictionary := Dictionary new .
		  slidingWindow typeCountersInWindow keysAndValuesDo: [ :key :value | tmpDictionary at: key put: value copy] .
		  publicationCountersByTypeByYear at: year put: tmpDictionary .
    	].