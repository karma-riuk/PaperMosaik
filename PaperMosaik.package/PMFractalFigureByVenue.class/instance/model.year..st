accessing
model: aField year: anYear
	| fractalPartsContents |
	model := aField.
	
	fractalPartsContents := PMVenue venuesToPublicationsOfYear: anYear ofField: aField .
	
	self addAllParts: fractalPartsContents.
	self addName: aField.
	self year: anYear.