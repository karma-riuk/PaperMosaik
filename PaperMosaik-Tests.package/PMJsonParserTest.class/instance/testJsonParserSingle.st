tests
testJsonParserSingle
    | parser mockJSON article fileReference stream pubblication pubblication2 |

    "Mock JSON data for a journal article"
    mockJSON := '[
                    {
        "dblp_tag": "incollection",
        "key_parts": [
            "reference",
            "dmkdh",
            "MaleticM10"
        ],
        "authors": [
            "Jonathan I. Maletic",
            "Andrian Marcus"
        ],
        "title": "Data Cleansing: A Prelude to Knowledge Discovery.",
        "year": 2010
    					}

                ]'.

	fileReference := 'mockData.json' asFileReference.
	stream := fileReference writeStream.
	stream nextPutAll: mockJSON.
	stream close.
   parser := PMJsonParser  new.
   article := (parser parse: fileReference)  .

	self assert: (PMResearcher researchersIncludesResearcherWithId: 'Jonathan I. Maletic') .
	self assert: (PMResearcher researchersIncludesResearcherWithId: 'Andrian Marcus') .
	
	pubblication := (PMResearcher Researchers at: 'Andrian Marcus') publications first.
	self assert: (pubblication notNil).
	self assert: 'Data Cleansing: A Prelude to Knowledge Discovery.' equals: pubblication title.
	self assert: 2010 equals: pubblication year.
	self assert: pubblication type equals: 'reference-incollection' .
	
	pubblication2 := (PMResearcher Researchers at: 'Jonathan I. Maletic') publications first .
	self assert: pubblication equals: pubblication2 .
	
	
	
	
	