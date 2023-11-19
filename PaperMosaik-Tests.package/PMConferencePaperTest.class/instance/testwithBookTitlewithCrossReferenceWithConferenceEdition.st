tests
testwithBookTitlewithCrossReferenceWithConferenceEdition
	 "Test the testwithBookTitle:aBookTitleIdwithCrossReference:aCrossReferencewithConferenceEdition:aConferenceEdition constructor ."
	
    | conferencePaper aBookTitle aConferenceReference aConferenceEdition |

	
		aBookTitle := 'My Book' . 
		aConferenceReference := 'Ref' .
		aConferenceEdition := (PMConferenceEdition new) . 
		conferencePaper := PMConferencePaper withBookTitle: 'My Book' withCrossReference: 'Ref' withConferenceEdition:  aConferenceEdition  .
		
    	self assert: conferencePaper bookTitle equals: aBookTitle .
    	self assert: conferencePaper conferenceEdition equals: aConferenceEdition .
    	self assert: conferencePaper crossReference equals: aConferenceReference .