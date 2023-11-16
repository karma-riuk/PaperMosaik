accessing
connect
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	connection := Mongo host: host port: port.
	connection authenticateUsername: user password: pass database: database. "Added problem here?"
	connection open.
	