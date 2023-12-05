adding
addName: aName
	| name rest labelName labelRest |
	name := aName copyUpTo: Character space.
	rest := aName copyAfter: Character space.
	
	 
	labelName := RSLabel new text: name; fontSize: 100.
	labelRest := RSLabel new text: rest; fontSize: 100.
	RSLocation new below; center; stick: labelRest on: labelName.
	
	label add: labelName.
	label add: labelRest.
	label adjustToChildren .
	
	RSLocation new below; center; stick: label on: parts.
	parts when: RSExtentChangedEvent do: [ :event |
		self placeLabel ].
	self add: label.
	self adjustToChildren.
	
	
