tests
testInitialize

    | publication anId anAuthorsSet aTitle anYear|
	
		anId := 'idOfPub123' . 
		anAuthorsSet := (Set new) .
		aTitle := 'Pub title' . 
		anYear := 1999 . 

    publication := (PMPublication newWithId: anId) year: anYear ; title: aTitle ; authors: anAuthorsSet .

    self assert: publication id equals: anId .
    self assert: publication authors equals: anAuthorsSet .
    self assert: publication title equals: aTitle .
	 self assert: publication year equals: anYear .