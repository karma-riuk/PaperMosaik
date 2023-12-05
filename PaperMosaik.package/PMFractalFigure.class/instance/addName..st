adding
addName: aName
	| name rest labelName labelRest |
	name := aName copyUpTo: Character space.
	rest := aName copyAfter: Character space.
	
	 
	labelName := RSLabel new text: name.
	labelRest := RSLabel new text: rest.
	RSLocation new below; center; stick: labelRest on: labelName.
	
	label add: labelName.
	label add: labelRest.
	
	
	RSLocation new below; center; stick: label on: parts.
	parts when: RSExtentChangedEvent do: [ :event |
		self placeLabel ].
	self add: label.
	self adjustToChildren.
	
	
