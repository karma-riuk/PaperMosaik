adding
addJournalInJournals: aJournal

	(self isJournalInJournals: aJournal name)
		ifFalse: [self Journals at: aJournal name put: aJournal].