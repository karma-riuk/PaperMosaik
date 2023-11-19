tests
testAddPublication

	| journalVolume aPublication anId |
	anId := 'pubKey123'.
	aPublication := PMPublication new.
	aPublication publicationId: anId.
	aPublication title: 'Title of the publication'.

	journalVolume := PMJournalVolume new.
	journalVolume addPublication: aPublication.
	
	self assert: (journalVolume publications at: anId) title equals: aPublication title.