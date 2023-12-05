accessing
fontSize: fontSize
	
	self shapes do: [ :shape |
		shape class = RSLabel ifTrue: [ 
			shape fontSize: fontSize ] ].
	self adjustToChildren.
