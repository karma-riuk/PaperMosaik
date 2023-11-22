tests
testPublicationsCategorizedByTypeFromYearToYear
    | researcher expectedCategorizedPublications actualCategorizedPublications publication1 publication2 publication3 |

    researcher := PMResearcher newWithId: 'testId001'.

    "Mock publications"
    publication1 := (PMPublication newWithId: 'pubId001') type: 'Journal'.
    publication1 year: 2020.
    publication2 := (PMPublication newWithId: 'pubId002') type: 'Conference'.
    publication2 year: 2020.
    publication3 := (PMPublication newWithId: 'pubId003') type: 'Journal'.
    publication3 year: 2021.

    "Assign publications to researcher"
    researcher publications: (Dictionary new
        at: 2020 put: (OrderedCollection with: publication1 with: publication2);
        at: 2021 put: (OrderedCollection with: publication3);
        yourself).

    "Define expected categorized publications"
    expectedCategorizedPublications := Dictionary new.
    expectedCategorizedPublications at: 'Journal' put: (OrderedCollection with: publication1 with: publication3).
    expectedCategorizedPublications at: 'Conference' put: (OrderedCollection with: publication2).

    "Call the method"
    actualCategorizedPublications := researcher publicationsCategorizedByTypeFromYear: 2020 ToYear: 2021.

    "Assert that the actual categorized publications match the expected ones"
    self assert: actualCategorizedPublications equals: expectedCategorizedPublications.
