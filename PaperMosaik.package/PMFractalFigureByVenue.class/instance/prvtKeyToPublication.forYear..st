private - accessing
prvtKeyToPublication: aField forYear: aYear
	| fractalPartsContents ret |
	ret := Dictionary new .
	fractalPartsContents := PMVenue venuesToPublicationsOfYear: aYear ofField: aField .
	

	fractalPartsContents keysDo: [ :venue | 
		ret at: (PMLabeledObject new label: (venue name); object: venue)
			put: (
			(venue publicationsByYear includesKey: aYear) 
				ifTrue: [venue publicationsByYear at: aYear ]
				ifFalse: [OrderedCollection new ]
		).
	] .
	^ ret.