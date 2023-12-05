parsing
parsePhase3: pathEntireDblpDb
    | fileReference path |
	
    pathEntireDblpDb notNil ifTrue: [path := pathEntireDblpDb] ifFalse: [self error: 'Path of the entire dblp db required'].
	
	 "Parse venues' data before starting with publications' data"
	 self parseVenues .

    fileReference := path asFileReference.
    fileReference exists ifFalse: [^self error: 'File not found.'].
	 PMResearcher clearResearchers . 
    fileReference readStreamDo: [:readStream | 
        (NeoJSONReader on: readStream) next collect: [:eachItem | 
            | publication venue |
			     
				publication := PMPublication newWithId: ((eachItem at: 'key_parts' ifAbsent: [nil]) joinUsing: '') .
				publication	title: (eachItem at: 'title') ;
					year: (eachItem at: 'year') asInteger .
					
				venue := PMVenue Venues at: ((eachItem at: 'key_parts') second) . "use venue name as id"
				venue addPublication: publication.
			]
   ]
