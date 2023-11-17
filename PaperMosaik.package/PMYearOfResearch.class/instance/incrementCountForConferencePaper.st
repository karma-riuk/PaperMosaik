counter metadata
incrementCountForConferencePaper
    | currentCount |
    currentCount := typeBasedPublicationCounts at: 'ConferencePaper' ifAbsent: [0].
    typeBasedPublicationCounts at: 'ConferencePaper' put: (currentCount + 1).
