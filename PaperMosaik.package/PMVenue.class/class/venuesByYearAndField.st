accessing
venuesByYearAndField
    "Return a dictionary where keys are years and values are dictionaries.
     These dictionaries map field strings to collections of venues having publications in that year."

    | venuesByField venuesByYearAndField |
    venuesByField := self venuesByField. "Use the default minNumVenue value to clear the 'field' with small number of values"
    venuesByYearAndField := Dictionary new.

    venuesByField keysDo: [ :field |
        (venuesByField at: field) do: [ :venue |
            venue publicationsByYear keysDo: [ :year |
                | venuesInYear |
                venuesInYear := (venuesByYearAndField at: year ifAbsent: [Dictionary new]).
                venuesInYear at: field ifAbsentPut: [OrderedCollection new].
                (venuesInYear at: field) add: venue.
                venuesByYearAndField at: year put: venuesInYear
            ]
        ]
    ].
    ^venuesByYearAndField