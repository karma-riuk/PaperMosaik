tests
testIsIssueInIssues	
	
	| journalVolume existingIssueNumber nexistingIssueNumber anIssue |
   existingIssueNumber := '1'.
   nexistingIssueNumber := '2'.
	anIssue := PMJournalIssue  new.
	anIssue issueNumber: existingIssueNumber.
	
	journalVolume := PMJournalVolume  new.
	journalVolume addIssue: anIssue.

    self assert: (journalVolume isIssueInIssues: existingIssueNumber).
    self deny: (journalVolume isIssueInIssues: nexistingIssueNumber).