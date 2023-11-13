drawing - rectangles
draw: aList authorName: authorName

	| group label person|
	group := self draw: aList.
	
	label := RSLabel new text: authorName.
	RSLocation new above; move: group on: label.
	
	person := RSComposite new.
	person shapes: { group . label}.
	person @ RSDraggable.
	
	^ person .
	