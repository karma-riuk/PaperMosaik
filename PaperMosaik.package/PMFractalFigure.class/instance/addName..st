adding
addName: aName
	
	label := RSLabel new text: aName; fontSize: 50.
	
	RSLocation new below; outer; stick: label on: parts.
	parts when: RSExtentChangedEvent do: [ :event |
		self placeLabel ].
	self add: label.
	self adjustToChildren.
	
	
