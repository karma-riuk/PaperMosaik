instance creation
newWithId: anId
	| aVenueEdition |
	aVenueEdition := super newWithId: anId .
	self addVenueEditionInVenueEditions: aVenueEdition .
	^aVenueEdition .
	