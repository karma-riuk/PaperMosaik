test
testAuthorName
    | researcherWithDigits researcherWithoutDigits expectedNameWithDigits expectedNameWithoutDigits |

    "Create a researcher with digits in the ID"
    researcherWithDigits := PMResearcher newWithId: 'JohnDoe123'.

    "Create a researcher without digits in the ID"
    researcherWithoutDigits := PMResearcher newWithId: 'JaneDoe'.

    "Expected names after removing digits"
    expectedNameWithDigits := 'JohnDoe'.
    expectedNameWithoutDigits := 'JaneDoe'.

    "Verify that authorName returns the ID without digits"
    self assert: researcherWithDigits authorName equals: expectedNameWithDigits.

    "Verify that authorName returns the ID as is if no digits"
    self assert: researcherWithoutDigits authorName equals: expectedNameWithoutDigits.

