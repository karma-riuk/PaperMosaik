tests
testJsonParserMultiple
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
    },
    {
        "dblp_tag": "incollection",
        "key_parts": [
            "reference",
            "se",
            "Gueheneuc10"
        ],
        "authors": [
            "Yann-Gael Gueheneuc"
        ],
        "title": "Design: Patterns.",
        "year": 2010
    },
    {
        "dblp_tag": "incollection",
        "key_parts": [
            "reference",
            "se",
            "ZaidmanPD10"
        ],
        "authors": [
            "Jonathan I. Maletic",
            "Martin Pinzger 0001",
            "Arie van Deursen"
        ],
        "title": "Software Evolution.",
        "year": 2010
    },
    {
        "dblp_tag": "incollection",
        "key_parts": [
            "reference",
            "crc",
            "CugolaMP06"
        ],
        "authors": [
            "Gianpaolo Cugola",
            "Amy L. Murphy",
            "Gian Pietro Picco"
        ],
        "title": "Content-Based Publish-Subscribe in a Mobile Environment.",
        "year": 2006
    }

                ]'.

   

	fileReference := 'mockData.json' asFileReference.
	stream := fileReference writeStream.
	stream nextPutAll: mockJSON.
	stream close.
   parser := PMJsonParser  new.
   parser parse: fileReference .
   "One is repeated "
   self assert: (PMResearcher Researchers size) equals: 8.
   "self assert: (((PMResearcher researchersIncludesResearcherWithId: 'Jonathan I. Maletic') publicationsByYear: 2010) size) equals: 2."
