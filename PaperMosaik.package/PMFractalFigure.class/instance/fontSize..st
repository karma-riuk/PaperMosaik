accessing
fontSize: fontSize
	self shapes do: [ :shape |
		shape class = RSLabel ifTrue: [ 
			shape fontSize: fontSize ] ].
	self removeShape: label.
	RSLocation new below; outer; move: label on: self shapes.
	self add: label.