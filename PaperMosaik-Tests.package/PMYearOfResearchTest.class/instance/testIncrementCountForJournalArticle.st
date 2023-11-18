tests
testIncrementCountForJournalArticle
	| anYearOfResearch |
	anYearOfResearch := PMYearOfResearch new.
	
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 0.
	anYearOfResearch incrementCountForJournalArticle .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 1.
   anYearOfResearch incrementCountForBook .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 1.
   anYearOfResearch incrementCountForJournalArticle .
   anYearOfResearch incrementCountForJournalArticle .
   anYearOfResearch incrementCountForJournalArticle .
   self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 4.
