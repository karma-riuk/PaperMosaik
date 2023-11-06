initialization
getPapersBy: name
	"must be full name separated by spaces"
	"adding a collection Author might speed this up"
	^collection select: {'authors'->{'name'->name} asDictionary }.