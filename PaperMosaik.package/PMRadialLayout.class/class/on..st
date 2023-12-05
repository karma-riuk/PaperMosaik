instance creation
on: aCollection
	"main entry point of the class"
	
	"If aCollection is empty, then there is not much to do"
	aCollection isEmpty ifTrue: [ ^ aCollection ].
	self new initialAngleInDegree: -109; applyOn: aCollection.
	^ aCollection