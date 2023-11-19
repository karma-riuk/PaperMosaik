adding
addIssue: anIssue

	(self isIssueInIssues: anIssue issueNumber)
        ifFalse: [issues at: anIssue issueNumber put: anIssue ]. 