as yet unclassified
prvtKeyToPublicationForYear: aYear
	| fractalPartsContents ret fractalPartsContentsFiltered |
	ret := Dictionary new .
	fractalPartsContents := PMVenue VenuesByYearAndField at: aYear .
	
	fractalPartsContentsFiltered := Dictionary new.
	fractalPartsContents associationsDo: [ :association | 
		association key = 'undefined' ifFalse: [ fractalPartsContentsFiltered at: association key put: association value ] ].

	fractalPartsContentsFiltered keysDo: [ :field | |venues|
		venues := PMVenue VenuesByYearAndField at: aYear at: field.
		
		ret at: (PMLabeledObject new label: field; object: field)
			put: venues.
	] .
	^ ret.