test
testReadJsonFileToListOfDictionaries
	|pm result path dicts|
	path := '/Users/l/OneDrive - USI/master/3o-sem/Design 101/group project/MicheleLanza_db/MicheleLanza_author_db.json'.
	pm := PMJsonToPaperMosaik new.
	result:=pm readJsonFileToListOfDictionaries: path.
	dicts:= pm dictionaries. 
	self assert: result equals: dicts  