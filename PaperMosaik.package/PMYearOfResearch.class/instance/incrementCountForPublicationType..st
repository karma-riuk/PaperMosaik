counter metadata
incrementCountForPublicationType: aPublicationType
    | currentCount |
    currentCount := typeBasedPublicationCounts at: aPublicationType ifAbsent: [0].
    typeBasedPublicationCounts at: aPublicationType put: (currentCount + 1).

