drawing - rectangles
draw: aDict authorName: authorName

	| group label person canvas |
	group := self draw: aDict.
	
	label := RSLabel new text: authorName.
	RSLocation new above; move: group on: label.
	canvas := RSCanvas new.
	person := RSComposite new.
	person shapes: { group . label}.
	person @ RSDraggable.
	
	canvas add: person.
	canvas zoomToFit.
	
	^ canvas .
	