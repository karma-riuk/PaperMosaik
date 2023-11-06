base
readFromDBByAuthorName: inputName
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	|mongoHelper info host port db collection defaultName|
	host:='mongodb+srv://user:pgFiqVz118jxvvyy@cluster.82l8d2v.mongodb.net/?retryWrites=true&w=majority'.
	port:=27017.
	db:='PharoTest'.
	defaultName:='Michele Lanza'.
	collection:='Papers'.
	mongoHelper:=PMMongoHelper withHost: host andPort: port.
	mongoHelper setDatabase: db.
	mongoHelper setCollection: collection.
	(inputName isMemberOf: String) ifFalse:  inputName=defaultName.
	info:=mongoHelper getPapersBy: inputName.
^info