accessing
addAllParts: keyToPublication
	| maxSize total currentWidth maxArea offset currentHeight yearToNumOfPapers keysSortedByValue oldPart oldExtent |
	
	parts resetChildren .
	
	
"	parts do: [ :part | self removeShape: part ].
	parts removeAll.
"
	
	yearToNumOfPapers := keyToPublication collect: [ :oldValue | 
		                     oldValue size ].

	keysSortedByValue := self cleanAndSort: yearToNumOfPapers.

	total := yearToNumOfPapers
		         inject: 0
		         into: [ :sum :each | sum + each value ]. "sum the total values"
	


	maxSize := 5 * (total + 100). "Size is proportional of the total value"
	maxArea := maxSize * maxSize.

	"The origins of every new cube, they are updated every iteration"
	currentWidth := maxSize. "currently the size of the max edge on x axis"
	currentHeight := maxSize. "same as above but for y axis"
	offset := 0 @ 0.

	
	oldPart := RSBox new size: 0.
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
"		fractalPart translateTopLeftTo: offset."
		fractalPart @ (RSPopup new text: currentKey label).

		iteration % 2 = 1 ifTrue: [ 
			offset := offset + (currentWidth @ 0).
			RSLocation new below; left; offset: fractalPart width @ 0; stick: fractalPart on: oldPart.] 
		ifFalse: [ 
			offset := offset + (0 @ currentHeight).
			RSLocation new above; right; outer; offset: 0 @ fractalPart height; stick: fractalPart on: oldPart. ].
		oldPart := fractalPart.
		currentWidth := maxSize - offset x.
		currentHeight := maxSize - offset y.

		parts add: fractalPart ].

	parts adjustToChildren.
	self add: parts.


"	self placeLabel."
	