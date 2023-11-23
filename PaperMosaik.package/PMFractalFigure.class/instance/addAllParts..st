accessing
addAllParts: keyToPublication
	| maxSize total currentWidth maxArea currentOrigin shapesToAdd currentHeight yearToNumOfPapers keysSortedByValue |
	self @ RSDraggable.
	
	yearToNumOfPapers := keyToPublication collect: [ :oldValue | 
		                     oldValue size ].

	keysSortedByValue := self cleanAndSort: yearToNumOfPapers.

	total := yearToNumOfPapers
		         inject: 0
		         into: [ :sum :each | sum + each value ]. "sum the total values"

	maxSize := total. "Size is proportional of the total value"
	maxArea := maxSize * maxSize.

	"The origins of every new cube, they are updated every iteration"
	currentWidth := maxSize. "currently the size of the max edge on x axis"
	currentHeight := maxSize. "same as above but for y axis"
	currentOrigin := 0 @ 0.

	shapesToAdd := RSGroup new.

	keysSortedByValue withIndexDo: [ :currentKey :iteration | 
		| fractalPart percentage percentageArea |
		percentage := ((yearToNumOfPapers at: currentKey) / total) asFloat.
		percentageArea := maxArea * percentage.

		iteration % 2 = 1
			ifTrue: [ "If vertical" 
				currentWidth := (percentageArea / currentHeight) asFloat ]
			ifFalse: [ "If horizontal" 
				currentHeight := (percentageArea / currentWidth) asFloat ].

		fractalPart := PMFractalPart
			               withWidth: currentWidth
			               withHeight: currentHeight
			               withColor:
			               (palette at: iteration % palette size + 1).
		fractalPart model: (keyToPublication at: currentKey).
		fractalPart translateTopLeftTo: currentOrigin.
		fractalPart @ (RSPopup new text: currentKey).

		currentOrigin := iteration % 2 = 1
			                 ifTrue: [ currentOrigin + (currentWidth @ 0) ]
			                 ifFalse: [ currentOrigin + (0 @ currentHeight) ].
		currentWidth := maxSize - currentOrigin x.
		currentHeight := maxSize - currentOrigin y.

		shapesToAdd add: fractalPart ].
	self shapes: shapesToAdd