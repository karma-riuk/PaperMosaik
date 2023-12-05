test
testInitialize
    "Test the initialize method to ensure it correctly initializes the publicationsByYear dictionary"

    | venue |

    "Create a venue instance"
    venue := PMVenue newWithId: 'TestId'.

    "Check if publicationsByYear is initialized correctly"
    self assert: (venue publicationsByYear isKindOf: Dictionary).
    self assert: (venue publicationsByYear isEmpty).
	 self assert: venue id = 'TestId' .
	
	 (PMVenue Venues) removeKey: 'TestId' .
	
	 
