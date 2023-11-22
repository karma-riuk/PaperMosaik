tests
testAddPublicationInPublicationsByYear
    | researcher publication year anotherPublication differentYear differentYearPublication |

    researcher := PMResearcher newWithId: 'resId'.
    year := 2021.

    "Create a mock publication with a specific year"
    publication := PMPublication newWithId: 'pubId01'.
    publication year: year.

    "Add publication to the researcher"
    researcher addPublicationInPublicationsByYear: publication.

    "Verify that the publication is added under the correct year"
    self assert: ((researcher publicationsByYear at: year) includes: publication).

    "Add another publication for the same year and verify it's added in the same collection"
    anotherPublication := PMPublication newWithId: 'pubId02'.
    anotherPublication year: year.
    researcher addPublicationInPublicationsByYear: anotherPublication.

    self assert: ((researcher publicationsByYear at: year) includes: anotherPublication).
    self assert: ((researcher publicationsByYear at: year) size = 2).

    "Add a publication for a different year and verify a new entry is created"
    differentYear := 2022.
    differentYearPublication := PMPublication newWithId: 'pubId03'.
    differentYearPublication year: differentYear.
    researcher addPublicationInPublicationsByYear: differentYearPublication.

    self assert: (researcher publicationsByYear includesKey: differentYear).
    self assert: ((researcher publicationsByYear at: differentYear) includes: differentYearPublication).
