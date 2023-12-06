as yet unclassified
venuesToPublicationsOfYear: anYear ofField: aField
	| allData fieldData venuesToPublications |
	
	allData := PMVenue venuesCategorizedByFieldOfYear: anYear.
	fieldData := Dictionary new.
	(allData includesKey: aField) ifTrue: [ fieldData := allData at: aField ]. "Now we have a list with all the venues"
	venuesToPublications := Dictionary new .
	
	fieldData do: [ :venue | 
			(venuesToPublications includesKey: venue) ifFalse: [ venuesToPublications at: venue put: OrderedCollection new ] .
			(venuesToPublications at: venue) addAll: (venue publicationsByYear at: anYear) 
		 ].
	
	^venuesToPublications 
	
	
	