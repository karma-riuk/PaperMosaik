accessing
populateDbFromXml: xmlPath
	"Should be called only once to populate the database"
	"This is very slow"
	|aStream info|
	aStream := xmlPath asFileReference readStream.
	info := XMLDOMParser parse: xmlPath.