tests
testPublicationCountersByType
    | validYear invalidYear nonIntegerYear publicationCounters expectedCounters |
    
    "Setup"
    validYear := 2020.
    invalidYear := 2022.
    nonIntegerYear := '2020'.
    expectedCounters := Dictionary new.
    publicationCounters := PMAuthorMetricsExtractor new.
    publicationCounters publicationCountersByTypeByYear: (Dictionary new
        at: validYear put: expectedCounters;
        yourself).

    "Test with valid year"
    self assert: (publicationCounters publicationCountersByType: validYear) equals: expectedCounters.

    "Test with invalid year"
    self should: [publicationCounters publicationCountersByType: invalidYear] raise: Error.

    "Test with non-integer year"
    self should: [publicationCounters publicationCountersByType: nonIntegerYear] raise: Error.
