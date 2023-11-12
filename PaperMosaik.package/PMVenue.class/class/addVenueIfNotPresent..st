adding
addVenueIfNotPresent: aVenue
    
Venues ifNil: [Venues := Dictionary new].
(Venues at: aVenue name ifAbsent: [nil]) ifNil: [Venues at: aVenue name put: aVenue].