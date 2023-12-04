adding
addVenueInVenues: aVenueEdition

	(self venuesIncludesVenueWithId: aVenueEdition id)
		ifFalse: [ Venues at: aVenueEdition id put: aVenueEdition ]