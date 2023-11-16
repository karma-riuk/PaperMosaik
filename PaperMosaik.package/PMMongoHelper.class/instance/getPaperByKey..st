initialization
getPaperByKey: key
	collection := database getCollection: 'Papers'.
	^collection select: {'key'->key}.