initialization
getPapersFrom: name
	"must be full name separated by spaces"
	^collection select: {'authors'->{'name'->name} asDictionary }.