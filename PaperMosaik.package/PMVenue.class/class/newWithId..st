instance creation
newWithId: anId
	| aVenue |
	aVenue := super newWithId: anId .
	self addVenueInVenues: aVenue .
	^aVenue .
	