drawing - rectangles
draw: aDict authorName: authorName canvas: canvas

	| group label person icon blank compositeName iconComposite|
	group := self draw: aDict.
	
	icon := self makeDraggableIcon: 4 withColor:  Color black.
	blank := RSBox new color: Color transparent  .
	RSLocation new outer; left; move: icon on: blank .
	
	iconComposite := RSComposite new.
	iconComposite shapes: {  icon . blank}.
	
	
	label := RSLabel new text: authorName.
	RSLocation new outer; left; move: iconComposite on: label .
	
	compositeName := RSComposite new .

	compositeName shapes: {  iconComposite  . label}.
	
	RSLocation new above; move: group on: compositeName .

	person := RSComposite new .
	person shapes: { group . compositeName}.
	person @ RSDraggable.
	
	canvas add: person .
	^person.
	