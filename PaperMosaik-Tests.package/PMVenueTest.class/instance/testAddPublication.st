test
testAddPublication
    "Test the addPublication: method to ensure it correctly adds publications to the publicationsByYear dictionary"

    | venue publication1 publication2 year1 year2 |

    "Create a venue and publications for testing"
    venue := PMVenue newWithId: 'venueTest1'.
    publication1 := (PMPublication newWithId: 'pub1') year: 2023; yourself.
    publication2 := (PMPublication newWithId: 'pub2') year: 2023; yourself.
    year1 := publication1 year.
    year2 := publication2 year.

    "Add the first publication and check if it was added correctly"
    venue addPublication: publication1.
    self assert: (venue publicationsByYear includesKey: year1).
    self assert: (venue publicationsByYear at: year1) size = 1.

    "Add the second publication and check if it was added correctly"
    venue addPublication: publication2.
    self assert: (venue publicationsByYear at: year1) size = 2.

	 (PMVenue Venues) removeKey: 'venueTest1' .

	 
