tests
testIncrementCountForBook
	| anYearOfResearch |
	anYearOfResearch := PMYearOfResearch new.
	
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'Book') equals: 0.
	anYearOfResearch incrementCountForBook .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'Book') equals: 1.
   anYearOfResearch incrementCountForJournalArticle .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'Book') equals: 1.
   anYearOfResearch incrementCountForBook .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'Book') equals: 2.
