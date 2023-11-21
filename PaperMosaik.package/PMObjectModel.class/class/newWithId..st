instance creation
newWithId: anId
	| anObject |
	anObject := super new.
	anObject id: anId.
	^anObject 
	