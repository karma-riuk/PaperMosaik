tests
testAddIssue

	| journalVolume anIssue anIssueNumber |
	anIssueNumber  := '1'.
	anIssue := PMJournalIssue new.
	anIssue issueNumber: anIssueNumber.

	journalVolume := PMJournalVolume new.
	journalVolume addIssue: anIssue.
	
	self assert: (journalVolume issues at: anIssueNumber) equals: anIssue.