accessing
venuesByField
    "Return a dictionary where keys are field strings and values are collections of venues belonging to that field.
     Only include fields with at least two venues."
	^(PMVenue venuesByField: 5)