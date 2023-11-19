initialization
setDatabase: dbName
	connection = nil ifTrue:  [ 
		connection := Mongo host: host port: port.
		connection open.
		].
	database:= connection databaseNamed: dbName .