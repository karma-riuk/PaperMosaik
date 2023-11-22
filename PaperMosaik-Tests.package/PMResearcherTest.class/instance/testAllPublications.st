tests
testAllPublications
    | researcher expectedPublications actualPublications publication1 publication2 publication3 |

    researcher := PMResearcher newWithId: 'testId001'.

    "Mock publications"
    publication1 := PMPublication newWithId: 'pubId001'.
    publication2 := PMPublication newWithId: 'pubId002'.
    publication3 := PMPublication newWithId: 'pubId003'.

    "Assign publications to researcher"
    researcher publications: (Dictionary new
        at: 2020 put: (OrderedCollection with: publication1);
        at: 2022 put: (OrderedCollection with: publication2 with: publication3);
        yourself).

    "Define expected publications"
    expectedPublications := OrderedCollection with: publication1 with: publication2 with: publication3.

    "Call the method"
    actualPublications := researcher allPublications.

    "Assert that the actual publications match the expected ones"
    self assert: actualPublications equals: expectedPublications.