tests
testAllCollaboratorsFromYearToYear
    | researcher expectedCollaborators actualCollaborators publication1 publication2 publication3 author1 author2 |

    researcher := PMResearcher newWithId: 'testId001'.

    "Mock authors"
    author1 := PMResearcher newWithId: 'collabId1'.
    author2 := PMResearcher newWithId: 'collabId2'.

    "Mock publications"
    publication1 := PMPublication newWithId: 'pubId001'.
    publication1 title: 'Title 1'; year: 2020; type: 'Journal'; authors: (Set with: author1 with: author2).

    publication2 := PMPublication newWithId: 'pubId002'.
    publication2 title: 'Title 2'; year: 2020; type: 'Conference'; authors: (Set with: author1).

    publication3 := PMPublication newWithId: 'pubId003'.
    publication3 title: 'Title 3'; year: 2021; type: 'Journal'; authors: (Set with: author2).

    "Assign publications to researcher"
    researcher publications: (Dictionary new
        at: 2020 put: (OrderedCollection with: publication1 with: publication2);
        at: 2021 put: (OrderedCollection with: publication3);
        yourself).

    expectedCollaborators := Set with: author1 with: author2.
    actualCollaborators := researcher allCollaboratorsFromYear: 2020 ToYear: 2021.

    self assert: actualCollaborators equals: expectedCollaborators.
    self deny: (actualCollaborators includes: researcher).
    self assert: (actualCollaborators allSatisfy: [:each | each isKindOf: PMResearcher]).
    self assert: actualCollaborators size equals: actualCollaborators asSet size.

    self assert: (actualCollaborators allSatisfy: [:collaborator | 
        (researcher publications anySatisfy: [:pubCollection | 
            (pubCollection anySatisfy: [:pub | (pub authors includes: collaborator) and: [pub year >= 2020 and: [pub year <= 2021]]])
        ])
    ]).

    self assert: (actualCollaborators noneSatisfy: [:collaborator | 
        (researcher publications anySatisfy: [:pubCollection | 
            (pubCollection anySatisfy: [:pub | (pub authors includes: collaborator) and: [pub year < 2020 or: [pub year > 2021]]])
        ])
    ]).

    self assert: (researcher allCollaboratorsFromYear: 2025 ToYear: 2026) isEmpty.
