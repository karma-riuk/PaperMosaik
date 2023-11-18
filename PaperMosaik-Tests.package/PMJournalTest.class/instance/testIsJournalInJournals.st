tests
testIsJournalInJournals

    | existingJournalName nexistingJournalName journal |
    existingJournalName := 'journal1'.
    nexistingJournalName := 'journal2'.

    journal := PMJournal new.
    journal name: existingJournalName.
    PMJournal addJournalInJournals: journal.

    self assert: (PMJournal isJournalInJournals: existingJournalName).

    self deny: (PMJournal isJournalInJournals: nexistingJournalName).
