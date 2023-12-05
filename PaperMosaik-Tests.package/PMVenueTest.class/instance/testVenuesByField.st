tests
testVenuesByField
    "Test the venuesByField method to ensure it correctly returns a dictionary of field strings to collections of venues with each field having at least two venues"

    | venue1 venue2 venue3 field1 field2 venuesByFieldDict |

    "Set up fields and venues"
    field1 := 'Computer ScienceTest'.
    field2 := 'BiologyTest'.
    venue1 := (PMVenue newWithId: 'venue1') field: field1; yourself.
    venue2 := (PMVenue newWithId: 'venue2') field: field1; yourself.
    venue3 := (PMVenue newWithId: 'venue3') field: field2; yourself.

    "Retrieve dictionary of venues by field"
	 "Min 2 Venues in the dictionary should be present in order to take in consideration a 'field'"
    venuesByFieldDict := PMVenue venuesByField: 2.

    "Check if the dictionary includes the correct fields and venues"
    self assert: (venuesByFieldDict includesKey: field1).
    self assert: ((venuesByFieldDict at: field1) includes: venue1).
    self assert: ((venuesByFieldDict at: field1) includes: venue2).
    self assert: ((venuesByFieldDict at: field1) size = 2).

    "Check if fields with less than two venues are not included"
    self deny: (venuesByFieldDict includesKey: field2).

    "Check if nil or 'Undefined' fields are not included"
    self deny: (venuesByFieldDict includesKey: nil).
    self deny: (venuesByFieldDict includesKey: 'Undefined').

	PMVenue Venues removeKey: 'venue1'.
	PMVenue Venues removeKey: 'venue2'.
	PMVenue Venues removeKey: 'venue3'.
