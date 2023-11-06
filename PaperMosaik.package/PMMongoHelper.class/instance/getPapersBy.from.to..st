initialization
getPapersBy: name from: startYear to: endYear
	"must be full name separated by spaces"
	"startYear and endYear are inclusive"
	"adding a collection Author might speed this up"
	^collection select: {'authors'->{'name'->name} asDictionary. 'year'->{'$gte' -> startYear asString. '$lte'-> endYear asString} asDictionary.}.