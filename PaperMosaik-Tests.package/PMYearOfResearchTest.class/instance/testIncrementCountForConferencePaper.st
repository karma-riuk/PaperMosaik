tests
testIncrementCountForConferencePaper
	| anYearOfResearch |
	anYearOfResearch := PMYearOfResearch new.
	
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'ConferencePaper') equals: 0.
	anYearOfResearch incrementCountForConferencePaper .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'ConferencePaper') equals: 1.
   anYearOfResearch incrementCountForBook .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'ConferencePaper') equals: 1.
   anYearOfResearch incrementCountForConferencePaper .
   anYearOfResearch incrementCountForConferencePaper .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'ConferencePaper') equals: 3.
