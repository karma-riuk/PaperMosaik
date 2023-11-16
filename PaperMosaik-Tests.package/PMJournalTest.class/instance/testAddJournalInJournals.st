tests
testAddJournalInJournals

	| existingJournalName nexistingJournalName journal |
	existingJournalName := 'JournalId1'.
	nexistingJournalName := 'JournalId2'.
	
	journal := PMJournal new.
	journal name: nexistingJournalName.
	
	PMJournal addJournalInJournals: journal.

	self assert: ((PMJournal Journals at: nexistingJournalName) name) equals: journal name .

	journal := PMJournal Journals at: nexistingJournalName ifAbsent: [nil].
	self assert: journal notNil.