adding
addVenueEditionInVenueEditions: aVenueEdition

	(self venueEditionsIncludesVenueEditionWithId: aVenueEdition id)
		ifFalse: [ VenueEditions at: aVenueEdition id put: aVenueEdition ]