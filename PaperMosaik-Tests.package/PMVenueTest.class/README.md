testVenuesCategorizedByFieldOfYear
    "Test the venuesCategorizedByFieldOfYear method to ensure it correctly groups venues by field for a specified year"

    | venue1 venue2 venue3 publicationsByYear1 publicationsByYear2 testResult testYear |

    testYear := 2023.

    "Setting up mock publications by year"
    publicationsByYear1 := Dictionary newFrom: {testYear -> OrderedCollection new}.
    publicationsByYear2 := Dictionary newFrom: {testYear -> OrderedCollection new; 2024 -> OrderedCollection new}.

    "Creating and adding mock venues"
    venue1 := PMVenue newWithId: 'Venue1'; field: 'Computer Science'; publicationsByYear: publicationsByYear1.
    venue2 := PMVenue newWithId: 'Venue2'; field: 'Physics'; publicationsByYear: publicationsByYear1.
    venue3 := PMVenue newWithId: 'Venue3'; field: 'Computer Science'; publicationsByYear: publicationsByYear2.

    "Adding mock venues to PMVenue class-side dictionary"
    PMVenue clearVenues. "Clear existing venues before adding mocks"
    PMVenue add: venue1.
    PMVenue add: venue2.
    PMVenue add: venue3.

    "Calling the method under test"
    testResult := PMVenue venuesCategorizedByFieldOfYear: testYear.

    "Assertions to verify the correct grouping"
    self assert: (testResult includesKey: 'Computer Science').
    self assert: ((testResult at: 'Computer Science') size = 2).
    self assert: (testResult includesKey: 'Physics').
    self assert: ((testResult at: 'Physics') size = 1).
    self deny: (testResult includesKey: 'Biology'). "Assuming no Biology venues were added"
