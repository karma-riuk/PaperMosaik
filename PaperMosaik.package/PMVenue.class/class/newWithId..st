instance creation
newWithId: anId
	| aVenue |
	(PMVenue Venues includesKey: anId) ifTrue: [ ^Venues at: anId ].
	
	aVenue := super newWithId: anId .
	self addVenueInVenues: aVenue .
	^aVenue .
	