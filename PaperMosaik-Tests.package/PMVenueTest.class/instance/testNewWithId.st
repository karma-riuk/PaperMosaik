test
testNewWithId
    "Test the newWithId: method to ensure it correctly handles creating new venues and retrieving existing ones"

    | venue1 venue2 venueWithSameId |

    "Create a new venue with a unique ID"
    venue1 := PMVenue newWithId: 'venue1'.
    self assert: (PMVenue Venues at: 'venue1') = venue1.

    "Create a new venue with a different unique ID"
    venue2 := PMVenue newWithId: 'venue2'.
    self assert: (PMVenue Venues at: 'venue2') = venue2.

    "Attempt to create a new venue with an existing ID"
    venueWithSameId := PMVenue newWithId: 'venue1'.
    
    "Check if the original venue is returned instead of creating a new one"
    self assert: venueWithSameId = venue1.
    self assert: venueWithSameId ~= venue2.

	 PMVenue Venues removeKey: 'venue1'.
	 PMVenue Venues removeKey: 'venue2'.
	