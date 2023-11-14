test
testReadFromDBByAuthorName
	|pm result name dicts|
	pm := PMJsonToPaperMosaik new.
	pm setDBServer. "First set DB Type then do setup"
	pm setup.
	name:='Michele Lanza'.
	result:=pm readFromDBByAuthorName: name. 
	dicts:= pm dictionaries. 
	self assert: result equals: dicts 