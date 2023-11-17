tests
testIncrementCountForPublicationType
	| anYearOfResearch |
	anYearOfResearch := PMYearOfResearch new.
	
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 0.
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'ConferencePaper') equals: 0.
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'Book') equals: 0.
	"Test typo"
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JornalArticle' ifAbsent: [nil]) equals: nil.
	
	anYearOfResearch incrementCountForPublicationType: 'JournalArticle' .
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 1.
	
	anYearOfResearch incrementCountForPublicationType: 'JournalArticle' .
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'JournalArticle') equals: 2.
	
	anYearOfResearch incrementCountForPublicationType: 'Book' .
	self assert: (anYearOfResearch typeBasedPublicationCounts at: 'Book') equals: 1.
	
	
