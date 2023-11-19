initialization
setDatabase: dbName
	connection = nil ifTrue:  [ 
		connection := Mongo host: host port: port.
		connection stream: (ReadWriteStream on:(OrderedCollection new)).
		].
	database:= connection databaseNamed: dbName .