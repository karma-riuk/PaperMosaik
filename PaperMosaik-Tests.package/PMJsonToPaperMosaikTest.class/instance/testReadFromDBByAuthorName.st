test
testReadFromDBByAuthorName
	|pm result name dicts|
	pm := PMJsonToPaperMosaik new.
	name:='Michele Lanza'.
	result:=pm readFromDBByAuthorName: name. 
	dicts:= pm dictionaries. 
	self assert: result equals: dicts 