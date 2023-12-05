tests
testVenuesByYearAndField
    "Test the venuesByYearAndField method to ensure it correctly groups venues by year and field"

    | publicationsByYear1 publicationsByYear2 testResult |

    "Setting up mock publications by year"
    publicationsByYear1 := Dictionary newFrom: {2023 -> OrderedCollection new. 2024 -> OrderedCollection new}.
    publicationsByYear2 := Dictionary newFrom: {2023 -> OrderedCollection new}.

    "Creating and adding mock venues with publicationsByYear and field"
    (1 to: 5) do: [ :i |
        (PMVenue newWithId: 'VenueTestCS', i asString)
            field: 'Computer Science';
            publicationsByYear: publicationsByYear1 ].

    (1 to: 2) do: [ :i |
        (PMVenue newWithId: 'VenueTestPhysics', i asString)
            field: 'Physics';
            publicationsByYear: publicationsByYear2 ].

    "Calling the method under test"
    testResult := PMVenue venuesByYearAndField.

    "Assertions to verify the correct grouping"
    self assert: ((testResult at: 2023) includesKey: 'Computer Science').
    self assert: ((testResult at: 2023) at: 'Computer Science') size = 5.
    self deny: ((testResult at: 2023) includesKey: 'Physics'). "Physics has fewer than 5 venues"
    self assert: ((testResult at: 2024) includesKey: 'Computer Science').
    self assert: (((testResult at: 2024) at: 'Computer Science') size = 5).
    self deny: ((testResult at: 2024) includesKey: 'Physics'). "Physics has fewer than 5 venues and no venues in 2024"

