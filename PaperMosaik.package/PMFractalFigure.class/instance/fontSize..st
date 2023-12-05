accessing
fontSize: fontSize
	
	label children do: [ :shape |
		shape class = RSLabel ifTrue: [ 
			shape fontSize: fontSize ] ].
	label adjustToChildren.
	self adjustToChildren.
