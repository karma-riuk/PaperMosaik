tests
testPublicationsCategorizedByYearFromYearToYear
    | researcher expectedCategorizedPublications actualCategorizedPublications publication1 publication2 publication3 publication4 |

    researcher := PMResearcher newWithId: 'testId001'.

    "Mock publications"
    publication1 := (PMPublication newWithId: 'pubId001') type: 'Journal'.
    publication1 year: 2020.
    publication2 := (PMPublication newWithId: 'pubId002') type: 'Conference'.
    publication2 year: 2020.
    publication3 := (PMPublication newWithId: 'pubId003') type: 'Journal'.
    publication3 year: 2022.
    publication4 := (PMPublication newWithId: 'pubId003') type: 'Paper'.
    publication4 year: 2023.

    "Assign publications to researcher"
    researcher publicationsByYear: (Dictionary new
        at: 2020 put: (OrderedCollection with: publication1 with: publication2);
        at: 2022 put: (OrderedCollection with: publication3);
        at: 2023 put: (OrderedCollection with: publication4);
        yourself).


    "Define expected categorized publications"
    expectedCategorizedPublications := Dictionary new.
    expectedCategorizedPublications at: (PMLabeledObject new object: 2020; label: 2020) put: (OrderedCollection with: publication1 with: publication2).
    expectedCategorizedPublications at: (PMLabeledObject new object: 2022; label: 2022) put: (OrderedCollection with: publication3).

    "Call the method"
    actualCategorizedPublications := researcher publicationsCategorizedByYearFromYear: 2020 ToYear: 2022.

    "Assert that the actual categorized publications match the expected ones"
    self assert: actualCategorizedPublications equals: expectedCategorizedPublications.

	"Assert that the publication outside the range is not in the result"
    self deny: (actualCategorizedPublications includesKey: (PMLabeledObject new label: 2023; object: 2023)).
