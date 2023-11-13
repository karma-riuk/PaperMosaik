adding
addJournalIfNotPresent: aJournal
    
Journals ifNil: [Journals := Dictionary new].
(Journals at: aJournal name ifAbsent: [nil]) ifNil: [Journals at: aJournal name put: aJournal].