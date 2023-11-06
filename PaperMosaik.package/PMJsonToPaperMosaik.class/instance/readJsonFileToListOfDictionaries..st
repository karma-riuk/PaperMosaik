base
readJsonFileToListOfDictionaries: inputPath
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	"uses the following path as default, if path not instance of class String"
	path := '/Users/l/OneDrive - USI/master/3o-sem/Design 101/group project/MicheleLanza_db/MicheleLanza_author_db.json'.
	(inputPath isMemberOf: String) ifTrue: path=inputPath.
	
	dictionaries:= OrderedCollection new.
	(path asFileReference)
		readStreamDo: [ :readStream |
			dictionaries add:(NeoJSONReader on: readStream) next ]. "add single Dictionary 1 by 1"
	
	^dictionaries