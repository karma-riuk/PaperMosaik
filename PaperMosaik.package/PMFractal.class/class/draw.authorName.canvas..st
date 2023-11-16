drawing - rectangles
draw: aDict authorName: authorName canvas: canvas

	| group label person  |
	group := self draw: aDict.
	
	label := RSLabel new text: authorName.
	RSLocation new above; move: group on: label.

	person := RSComposite new.
	person shapes: { group . label}.
	person @ RSDraggable.
	
	canvas add: person .
	