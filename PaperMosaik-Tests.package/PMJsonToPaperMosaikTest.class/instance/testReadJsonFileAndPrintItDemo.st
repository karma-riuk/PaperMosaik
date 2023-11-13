tests
testReadJsonFileAndPrintItDemo
	|pm result|
	pm := PMJsonToPaperMosaik new.
	result:=pm readJsonFileAndPrintItDemo.
	self assert: result equals: true 