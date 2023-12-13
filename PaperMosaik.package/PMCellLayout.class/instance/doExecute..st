hook
doExecute: shapes 
	| lineItemSize pointer columnCount rowCount maxHeight columnsWidths rowHeights |
	lineItemSize := self lineItemsCountBlock rsValue: shapes.

	"We compute the size of the grid"
	columnCount := 1.
	rowCount := 1.
	maxHeight := 0.
	columnsWidths := OrderedCollection new.
	rowHeights := OrderedCollection new.
	shapes do: [ :e | | maxSizeOverTime |
		columnsWidths size < columnCount ifTrue: [ columnsWidths add: 0 ].
		
		maxSizeOverTime := self getMaxSizeOverTime: e.
		maxSizeOverTime := maxSizeOverTime max: e label width.
		maxSizeOverTime := maxSizeOverTime max: e label height.
		
		columnsWidths at: columnCount put: ((columnsWidths at: columnCount) max: maxSizeOverTime).		
		maxHeight := maxHeight max: maxSizeOverTime + e label height.
		columnCount := columnCount + 1.
		
		columnCount > lineItemSize
			ifTrue: [ 
				columnCount := 1. 
				rowHeights add: maxHeight.
				maxHeight := 0 ]
	].
	rowHeights add: maxHeight.


	"We do the translation"
	columnCount := 1.
	rowCount := 1.
	pointer := (((columnsWidths at: 1) / 2) @ ((rowHeights at: 1) / 2)).
	shapes do: [ :e | 
		e translateTo: pointer.
		pointer := pointer + (self gapSize * 2 @ 0) + (((columnsWidths at: columnCount) / 2) @ 0).

		columnCount := columnCount + 1.
		columnCount > lineItemSize
			ifTrue: [ 
				columnCount := 1.
				pointer := (((columnsWidths at: 1) / 2) @ pointer y)  + (0 @ ((rowHeights at: rowCount) / 2)).
				rowCount := rowCount + 1.
				rowCount <= rowHeights size 
					ifTrue: [ pointer := pointer + (0 @ ((rowHeights at: rowCount) / 2)) ].				 
				 ]
			ifFalse: [ pointer := pointer + (self gapSize * 2 @ 0) + (((columnsWidths at: columnCount ) / 2) @ 0) ].
	]