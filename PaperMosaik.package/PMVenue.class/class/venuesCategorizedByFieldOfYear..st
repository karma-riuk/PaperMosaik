accessing
venuesCategorizedByFieldOfYear: anYear
	(VenuesByYearAndFields isEmptyOrNil ) ifTrue: [ PMVenue venuesByYearAndField ] .
	(VenuesByYearAndFields includesKey: anYear) 
			ifTrue: [ ^(VenuesByYearAndFields at: anYear) ] 
			ifFalse: [ self error: 'Year not valid! If data is parsed corrected: 1953 < anYear < 2023' ] .
	
