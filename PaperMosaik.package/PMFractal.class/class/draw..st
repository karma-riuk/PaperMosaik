drawing - rectangles
draw: aList
	"draw a fractal from a list"
	| sortedList group total isVertical deltaX deltaY maxSize maxArea currentMaxEdgeX currentMaxEdgeY colorPalette iteration|
	"final immutable variable"
	colorPalette := OrderedCollection new. "for now the color is hard-coded"
	colorPalette add: Color red; add: Color blue; add: Color green; add: Color orange; add: Color purple; add: Color yellow.
	maxSize := 100. "for now the size is hard-coded, the returned shape can still be moved and resized"
	maxArea := maxSize * maxSize.
	group := RSGroup new.
	
	"mutable variables"
	iteration := 0. "the current itteration, used to select the color"
	isVertical := false. "boolean to distinguish if the rectangle draw is going to be vertical or horizontal"
	"The origins of every new cube, they are updated every iteration"
	deltaX := 0.0. 
	deltaY := 0.0. 
	currentMaxEdgeX := maxSize. "currently the size of the max edge on x axis"
	currentMaxEdgeY := maxSize. "same as above but for y axis"
	
	sortedList := aList sorted reversed. "sort and reverse the list"
	total := aList sum. "summ of all the element in the array"
	
	sortedList do: [:element | 
		| part shape size coverArea |
		part := (element / total) asFloat. "percentage of the element respect to the total"
		coverArea := maxArea * part. "area that the shape should cover"
		
		isVertical ifTrue: [ " vertical setup "
			size := (coverArea / currentMaxEdgeX ) asFloat. "size of the other edge"											"use a modulo finction to choose the color"
			shape := self makeCube: (deltaX @ deltaY ) to: (maxSize @ (deltaY + size)  ) color: (colorPalette at: ((iteration % colorPalette size) + 1)).
			deltaY := deltaY + size. "update delta, origin of the next cube"
			currentMaxEdgeY := currentMaxEdgeY - size. "update the size of the edge"
			
		]  ifFalse: [ " Horizontal setup "
			size := (coverArea / currentMaxEdgeY ) asFloat. "size of the other edge"
			shape := self makeCube: (deltaX @ deltaY ) to: (  (deltaX + size )@ maxSize ) color: (colorPalette at: ((iteration % colorPalette size) + 1)) .
			deltaX := deltaX + size. "update delta, origin of the next cube"
			currentMaxEdgeX := currentMaxEdgeX - size. "update the size of the edge"
		
		].
		isVertical := isVertical not. "set to the opposite"
		group add: shape.
		iteration := iteration + 1.
	].
	
	^ group asShape.
	