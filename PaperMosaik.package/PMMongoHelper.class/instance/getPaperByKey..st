initialization
getPaperByKey: key
	|result|
	collection := database getCollection: 'Papers'.
	result := collection select: {'key'->key}.
	result size = 0 ifTrue: [ ^ nil] ifFalse:  [ ^ result at: 1 ]. 