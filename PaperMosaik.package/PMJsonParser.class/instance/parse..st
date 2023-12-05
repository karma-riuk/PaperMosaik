parsing
parse: inputPath

    | fileReference path workingDirectory |
    workingDirectory := FileLocator workingDirectory.
    path :=  workingDirectory fullName , '/pharo-local/iceberg/2023/papermosaik/MockData/mock_dblp_data.json' .
	 Transcript show: path; cr. 
    inputPath notNil ifTrue: [path := inputPath].
	
	 "Parse venues' data before starting with publications' data"
	 self parseVenues .

    fileReference := path asFileReference.
    fileReference exists ifFalse: [^self error: 'File not found.'].
	 PMResearcher clearResearchers . 
    fileReference readStreamDo: [:readStream | 
        (NeoJSONReader on: readStream) next collect: [:eachItem | 
            | publication authors venue |
			     
				publication := PMPublication newWithId: ((eachItem at: 'key_parts' ifAbsent: [nil]) joinUsing: '') .
				publication type: (eachItem at: 'key_parts') first ,'-' ,  (eachItem at: 'dblp_tag') ;
					title: (eachItem at: 'title') ;
					year: (eachItem at: 'year') asInteger .
					
				venue := PMVenue newWithId: ((eachItem at: 'key_parts') second) . "use venue name as id"
				venue type: (eachItem at: 'key_parts') first .
				venue addPublication: publication.
			
            authors := ((eachItem at: 'authors') 
									ifNotNil: [:authorArray | 
                authorArray collect: [:eachAuthorId | 
                    					| aResearcher |
											(PMResearcher researchersIncludesResearcherWithId: eachAuthorId)
												ifTrue: [ aResearcher := PMResearcher Researchers at: eachAuthorId ]
												ifFalse: [ aResearcher := PMResearcher newWithId: eachAuthorId ] .
											aResearcher								
									] .
							
			 	]).
             publication authors: authors.
				(publication  authors) do: [: author1 |  
					author1 addPublicationInPublicationsByYear: publication 
					]
            ]
   ]
