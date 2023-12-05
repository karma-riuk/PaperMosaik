parsing
parseVenues

    | fileReference path workingDirectory |
    workingDirectory := FileLocator workingDirectory.
    path :=  workingDirectory fullName , '/pharo-local/iceberg/2023/papermosaik/VenueData/venues_data.json' .
	 Transcript show: path; cr. 
	
	 PMVenue clearVenues .

    fileReference := path asFileReference.
    fileReference exists ifFalse: [^self error: 'File not found.'].
	 PMResearcher clearResearchers . 
    fileReference readStreamDo: [:readStream | 
        (NeoJSONReader on: readStream) next collect: [:eachItem | 
            | venue |
					
				venue := PMVenue newWithId: (eachItem at: 'key') . "use venue name as id"
				venue name: (eachItem at: 'name') ; type: (eachItem at: 'type') ; field: (eachItem at: 'field') .
   ]]
