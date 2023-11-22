parsing
parse: inputPath

    | fileReference path |
    path := 'put_your_path/mock_dblp_data.json'.
    inputPath notNil ifTrue: [path := inputPath].

    fileReference := path asFileReference.
    fileReference exists ifFalse: [^self error: 'File not found.'].

	 PMResearcher clearResearchers . 
    fileReference readStreamDo: [:readStream | 
        (NeoJSONReader on: readStream) next collect: [:eachItem | 
            | publication authors |
			     
				publication := PMPublication newWithId: ((eachItem at: 'key_parts' ifAbsent: [nil]) joinUsing: '') .
										publication 
										type: (eachItem at: 'key_parts') first ,'-' ,  (eachItem at: 'dblp_tag') ;
										title: (eachItem at: 'title') ;
										year: (eachItem at: 'year') asInteger .
			
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
