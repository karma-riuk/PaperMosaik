accessing
maxSize: aTotal
	^aTotal = 0 ifTrue: [ 0.1 ] ifFalse: [ (aTotal/30) + 10 ].