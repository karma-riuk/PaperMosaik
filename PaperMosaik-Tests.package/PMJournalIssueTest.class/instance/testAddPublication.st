tests
testAddPublication

	| journalIssue aPublication anId |
	anId := 'pubKey123'.
	aPublication := PMPublication new.
	aPublication publicationId: anId.
	aPublication title: 'Title of the publication'.

	journalIssue := PMJournalIssue new.
	journalIssue addPublication: aPublication.
	
	self assert: (journalIssue publications at: anId) title equals: aPublication title.