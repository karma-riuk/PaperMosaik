as yet unclassified
withHost: host andPort: port andUser: user andPassword: password andDatabase: database
	|newMongoHelper|	
	newMongoHelper := PMMongoHelper new.
	newMongoHelper host: host.
	newMongoHelper port: port.
	newMongoHelper pass: password .
	newMongoHelper user: user .
	newMongoHelper setDatabase: (database) .
	newMongoHelper connectWithAuthentication .
	^ newMongoHelper 