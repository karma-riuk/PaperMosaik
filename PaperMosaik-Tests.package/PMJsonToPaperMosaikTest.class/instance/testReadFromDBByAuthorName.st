test
testReadFromDBByAuthorName
	|pm result name|
	pm := PMJsonToPaperMosaik new.
	name:='Michele Lanza'.
	result:=pm readFromDBByAuthorName: name. 
	self assert: (result isMemberOf: Collection)