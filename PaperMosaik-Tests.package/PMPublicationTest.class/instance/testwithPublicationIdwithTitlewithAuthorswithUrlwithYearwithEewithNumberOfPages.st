tests
testwithPublicationIdwithTitlewithAuthorswithUrlwithYearwithEewithNumberOfPages
    "Test the withPublicationId:  withTitle:  withAuthors:  withUrl:  withYear:  withEe:  withNumberOfPages:  method."

    | publication aPublicationId anAuthorCollection aTitle anUrl anYear anEe aNumberOfPages |
	
		aPublicationId := 'idOfPub123' . 
		anAuthorCollection := (Dictionary new) .
		aTitle := 'Pub title' . 
		anUrl := 'www.google.it' . 
		anYear := 1999 . 
		anEe := 'doi.com/ajhgdbaw' .
		aNumberOfPages := 123 .
		

    publication := PMPublication withPublicationId: 'idOfPub123' withTitle: 'Pub title' withAuthors: (Dictionary new) withUrl: 'www.google.it' withYear: 1999 withEe: 'doi.com/ajhgdbaw' withNumberOfPages: 123 .

    "Verify that the author has the correct ID and name"
    self assert: publication publicationId equals: aPublicationId .
    self assert: publication authors equals: anAuthorCollection .
    self assert: publication title equals: aTitle .
	 self assert: publication url equals: anUrl . 
	 self assert: publication year equals: anYear .
 	 self assert: publication ee equals: anEe .
	 self assert: publication numberOfPages equals: aNumberOfPages .