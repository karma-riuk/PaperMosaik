tests
testIsPublicationInPublications	
	
	| journalIssue existingPublicationId nexistingPublicationId aPublication |
    existingPublicationId := 'pubKey123'.
    nexistingPublicationId := 'pubKey456'.
	aPublication := PMPublication new.
	aPublication publicationId: existingPublicationId.
	
	journalIssue := PMJournalIssue new.
	journalIssue addPublication: aPublication.

    self assert: (journalIssue isPublicationInPublications: existingPublicationId).
    self deny: (journalIssue isPublicationInPublications: nexistingPublicationId).