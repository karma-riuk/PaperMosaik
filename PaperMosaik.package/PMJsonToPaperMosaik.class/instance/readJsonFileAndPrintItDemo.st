demo
readJsonFileAndPrintItDemo
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	path := '/Users/l/OneDrive - USI/master/3o-sem/Design 101/group project/MicheleLanza_db/MicheleLanza_author_db.json'.
	path asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream) next ]. "a Dictionary('foo'->42.0 )"
	^true 