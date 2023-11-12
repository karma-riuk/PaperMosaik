adding
addJournalIfNotPresent: aJournal
    
journals ifNil: [journals := Dictionary new].
(journals at: aJournal name ifAbsent: [nil]) ifNil: [journals at: aJournal name put: aJournal].