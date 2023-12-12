parsing
parseVenues

    | fileReference path workingDirectory |
    workingDirectory := FileLocator workingDirectory.
    path :=  "workingDirectory fullName , '/pharo-local/iceberg/2023/papermosaik/VenueData/venues_data.json'" 'C:\Users\Xmachines\Downloads\venues_split_strategy_splitted.json' .
	 Transcript show: path; cr. 

    fileReference := path asFileReference.
    fileReference exists ifFalse: [^self error: 'File not found.'].

    fileReference readStreamDo: [:readStream | 
        (NeoJSONReader on: readStream) next collect: [:eachItem | 
					
				(PMVenue newWithId: (eachItem at: 'key'))  "use venue name as id"
					name: (eachItem at: 'name') ; type: (eachItem at: 'type') ; field: (eachItem at: 'category') .
   ]]
