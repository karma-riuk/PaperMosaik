tests
testWithJournalReference

    | aJournal journalArticle |
    aJournal := PMJournal new.

    journalArticle  := PMJournalArticle withJournalReference: aJournal.
	
    self assert: journalArticle journalReference equals: aJournal.