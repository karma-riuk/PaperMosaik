test
testPublications
    "Test the publications method to ensure it correctly aggregates all publications into an OrderedCollection"

    | venue publication1 publication2 publication3 allPublications |

    "Create a venue and publications for testing"
    venue := PMVenue newWithId: 'venueTest1'.
    publication1 := (PMPublication newWithId: 'pub1') year: 2023; yourself.
    publication2 := (PMPublication newWithId: 'pub2') year: 2023; yourself.
    publication3 := (PMPublication newWithId: 'pub3') year: 2024; yourself.

    "Add publications to the venue"
    venue addPublication: publication1.
    venue addPublication: publication2.
    venue addPublication: publication3.

    "Retrieve all publications using the publications method"
    allPublications := venue publications.

    "Check if all publications are present and in correct order"
    self assert: allPublications size = 3.
    self assert: (allPublications includes: publication1).
    self assert: (allPublications includes: publication2).
    self assert: (allPublications includes: publication3).

	 (PMVenue Venues) removeKey: 'venueTest1' .
