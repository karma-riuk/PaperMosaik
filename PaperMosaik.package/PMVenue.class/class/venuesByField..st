accessing
venuesByField: minNumVenue
    "Return a dictionary where keys are field strings and values are collections of venues belonging to that field.
     Only include fields with at least two venues."

    | dictionaryByField aField venuesInField |
    dictionaryByField := Dictionary new.
    Venues values do: [ :venue | 
        aField := venue field.
        venuesInField := dictionaryByField
                             at: aField
                             ifAbsent: [ OrderedCollection new ].
        venuesInField add: venue.
        dictionaryByField at: aField put: venuesInField ].
    
    dictionaryByField keys do: [ :key |
        (dictionaryByField at: key) size < minNumVenue ifTrue: [
            dictionaryByField removeKey: key ] ].
	 
	dictionaryByField removeKey: nil ifAbsent: [].
	dictionaryByField removeKey: 'Undefined' ifAbsent: [].

    ^ dictionaryByField