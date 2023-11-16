adding
addJournalInJournals: aJournal

	(self isJournalInJournals: aJournal name)
		ifFalse: [Journals at: aJournal name put: aJournal].