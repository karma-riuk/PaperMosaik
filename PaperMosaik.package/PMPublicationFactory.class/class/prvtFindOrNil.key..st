as yet unclassified
prvtFindOrNil: dbPublication key: key
	(dbPublication includesKey: key) ifTrue: [ ^ dbPublication at: key ] ifFalse: [ ^ nil ].