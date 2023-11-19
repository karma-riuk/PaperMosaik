tests
testIsPublicationInPublications	
	
	| journalVolume existingPublicationId nexistingPublicationId aPublication |
   existingPublicationId := 'pubKey123'.
   nexistingPublicationId := 'pubKey456'.
	aPublication := PMPublication new.
	aPublication publicationId: existingPublicationId.
	
	journalVolume := PMJournalVolume  new.
	journalVolume addPublication: aPublication.

    self assert: (journalVolume isPublicationInPublications: existingPublicationId).
    self deny: (journalVolume isPublicationInPublications: nexistingPublicationId).