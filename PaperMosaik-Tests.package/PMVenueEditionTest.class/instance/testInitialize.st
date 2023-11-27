tests
testInitialize

    | venueEdition anId aVenueName aVenueEdition|
	
		anId := 'VenName-ab12' . 
		aVenueName := 'VenName' .
		aVenueEdition := 'ab12' . 

    venueEdition := (PMVenueEdition newWithId: anId) venueName: aVenueName ; venueEdition: aVenueEdition .

    self assert: venueEdition id equals: anId .
    self assert: venueEdition venueName equals: aVenueName .
    self assert: venueEdition venueEdition equals: aVenueEdition .