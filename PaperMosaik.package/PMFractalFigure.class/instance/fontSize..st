accessing
fontSize: fontSize
	
	| name rest |
	label children do: [ :shape |
		shape class = RSLabel ifTrue: [ 
			shape fontSize: fontSize ] ].
	name := label children at: 1.
	rest := label children at: 2.
	RSLocation new below; center; offset: 0 @ -100; stick: rest on: name.
	label adjustToChildren.
	self adjustToChildren.
