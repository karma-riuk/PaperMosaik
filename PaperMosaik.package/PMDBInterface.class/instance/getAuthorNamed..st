base
getAuthorNamed: inputName
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	|defaultName|
	defaultName:='Michele Lanza'.
	(inputName isMemberOf: String) ifFalse:  inputName=defaultName.
	dictionaries:=mongoHelper getPapersBy: inputName.
^dictionaries