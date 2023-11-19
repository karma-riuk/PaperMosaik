tests
testJournalReference

	| journalArticle journal journalTitle |
	journalTitle := 'The journal name'.
	journal := PMJournal new.
	journal name: journalTitle.
	
	journalArticle := PMJournalArticle new.
	journalArticle journalReference: journal.
	
	self assert: (journalArticle journalReference) name equals: journalTitle.