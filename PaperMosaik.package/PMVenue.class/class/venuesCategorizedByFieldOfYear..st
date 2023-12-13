accessing
venuesCategorizedByFieldOfYear: anYear
	(VenuesByYearAndFields isEmptyOrNil ) 
		ifTrue: [ 
			"The getter automatically trigger a lazy initialization"
			PMVenue venuesByYearAndField  .
			"But if the entire db is not parsed the VenuesByYearAndFields dictionary remains empty"
			(VenuesByYearAndFields isEmpty) 
				ifTrue: [ self error: 'Venues were not parsed correctly. Use PMJsonParser parsePhase3: to parse the entire db and load all the data in the image'  ].
			] .
		
	(VenuesByYearAndFields includesKey: anYear) 
			ifTrue: [ ^(VenuesByYearAndFields at: anYear) ] 
			ifFalse: [ self error: 'Year not valid! If data is parsed corrected: 1953 < anYear < 2023' ] .
	
