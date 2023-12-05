adding
addName: aName
	label := RSLabel new text: aName.
"	label fontSize: self model publications size / 10."
	RSLocation new below; outer; move: label on: self shapes.
	self add: label.