initialization
getPapersBy: name from: startYear to: endYear
	"must be full name separated by spaces"
	"startYear and endYear are inclusive"
	^collection select: {'authors'->{'name'->name} asDictionary. 'year'->{'$gte' -> startYear asString. '$lte'-> endYear asString} asDictionary.}.