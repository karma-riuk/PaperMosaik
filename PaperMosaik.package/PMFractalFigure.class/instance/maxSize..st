accessing
maxSize: n
	n = 0 ifTrue: [ ^0.1 ] ifFalse: [ ^ 5 * n + 250 ].