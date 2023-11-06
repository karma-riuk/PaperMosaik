as yet unclassified
withHost: host andPort: port
	|newMongoHelper|	
	newMongoHelper := PMMongoHelper new.
	newMongoHelper host: host.
	newMongoHelper port: port.
	newMongoHelper connect.
	^ newMongoHelper 