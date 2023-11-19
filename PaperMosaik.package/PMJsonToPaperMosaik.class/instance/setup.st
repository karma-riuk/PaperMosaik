setup
setup
	|tempHelper return|
	port:=27017.
	dbName:='PharoTest'.
	collection:='Papers'.
	
	return:=(dbHost isNil) not. "if is nil->ERROR First set DB Type, then do setup->return false"
	
	"tempHelper:=PMMongoHelper withHost: dbHost andPort: port."
	tempHelper := PMMongoHelper withHost: dbHost andPort: port  andUser: user andPassword: pass andDatabase: dbName.
	"tempHelper user: user.
	tempHelper pass: pass.
	tempHelper setDatabase: dbName."
	tempHelper setCollection: collection.

	mongoHelper:= tempHelper.
	^return 