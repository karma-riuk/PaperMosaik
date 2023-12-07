accessing
model: aField year: anYear
	| fractalPartsContents fromLabelVenueToPublications  |
	model := aField.
	fractalPartsContents := PMVenue venuesToPublicationsOfYear: anYear ofField: aField .
	
	fromLabelVenueToPublications := Dictionary new .
	fractalPartsContents keysDo: [ :venue | fromLabelVenueToPublications at: (PMLabeledObject new label: (venue name) ; object: venue) put: ((venue publicationsByYear includesKey: anYear) 
		ifTrue: [venue publicationsByYear at: anYear ]
		ifFalse: [OrderedCollection new ] ).
	] .
	
	self addAllParts: fromLabelVenueToPublications.
	self addName: aField.
	self year: anYear.