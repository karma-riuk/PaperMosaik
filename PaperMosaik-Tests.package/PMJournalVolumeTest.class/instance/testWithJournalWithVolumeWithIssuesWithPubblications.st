tests
testWithJournalWithVolumeWithIssuesWithPubblications

	| journalVolume aJournal aVolume anIssueCollection aPubblicationCollection publication1 publication2 publication3 issue1 issue2 issue3|
	
	publication1 := PMPublication new.
	publication2 := PMPublication new.
	publication3 := PMPublication new.
	aPubblicationCollection := #(publication1 publication2 publication3).
	
	issue1 := PMPublication new.
	issue2 := PMPublication new.
	issue3 := PMPublication new.
	anIssueCollection := #(issue1 issue2 issue3).
	
	aJournal := PMJournal new.
	aVolume := 5.

	journalVolume  := PMJournalVolume
		withJournal: aJournal
		withVolume: aVolume
		withIssues: anIssueCollection
		withPubblications: aPubblicationCollection.
	
	self assert: journalVolume journal equals: aJournal.
	self assert: journalVolume volume equals: aVolume.
	self assert: journalVolume issues equals: anIssueCollection.
	self assert: journalVolume publications equals: aPubblicationCollection.