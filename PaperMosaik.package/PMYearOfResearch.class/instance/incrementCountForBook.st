counter metadata
incrementCountForBook
    | currentCount |
    currentCount := typeBasedPublicationCounts at: 'Book' ifAbsent: [0].
    typeBasedPublicationCounts at: 'Book' put: (currentCount + 1).
