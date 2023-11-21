test
testGetAuthorNamed
	|pm result name dicts|
	pm := PMDBInterface new.
	pm setDBServer. "First set DB Type then do setup"
	pm setup.
	name:='Michele Lanza'.
	result:=pm getAuthorNamed: name. 
	dicts:= pm dictionaries. 
	self assert: result equals: dicts 