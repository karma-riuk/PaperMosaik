as yet unclassified
withHost: host andPort: port
	|newMongoHelper|	
	newMongoHelper := PM_MongoHelper new.
	newMongoHelper host: host.
	newMongoHelper port: port.
	newMongoHelper connect.
	^ newMongoHelper 