counter metadata
incrementCountForJournalArticle
    | currentCount |
    currentCount := typeBasedPublicationCounts at: 'JournalArticle' ifAbsent: [0].
    typeBasedPublicationCounts at: 'JournalArticle' put: (currentCount + 1).
