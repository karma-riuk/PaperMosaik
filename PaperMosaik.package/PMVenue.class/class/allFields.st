accessing
allFields
"Retrieve all possible fields for all years"
"It is useful because not all year contains all fields so at the beginning is usefult to get this data and distribute it on a plane in the visualization phase"
	^(self venuesByField keys sorted asOrderedCollection)