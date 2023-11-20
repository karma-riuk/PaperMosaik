tests
testReadJsonFileAndPrintItDemo
	|pm result|
	pm := PMDBInterface new.
	result:=pm readJsonFileAndPrintItDemo.
	self assert: result equals: true 