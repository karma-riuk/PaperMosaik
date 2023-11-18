tests
testWithIssueNumberWithPublicationsWithJournalWithVolume

	| journalIssue anIssueNumber aPublicationCollection aJournal aVolume publication1 publication2 publication3|
	
	publication1 := PMPublication new.
	publication2 := PMPublication new.
	publication3 := PMPublication new.
	
	anIssueNumber := 10.
	aPublicationCollection := #(publication1 publication2 publication3).
	aJournal := PMJournal new.
	aVolume := 5.

	journalIssue  := PMJournalIssue 
		withIssueNumber: anIssueNumber
		withPublications: aPublicationCollection
		withJournal: aJournal
		withVolume: aVolume.
	
	self assert: journalIssue issueNumber equals: anIssueNumber.
	self assert: journalIssue publications equals: aPublicationCollection.
	self assert: journalIssue journal equals: aJournal.
	self assert: journalIssue volume equals: aVolume.