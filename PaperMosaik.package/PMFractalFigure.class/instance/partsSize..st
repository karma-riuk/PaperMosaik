accessing
partsSize: newSize
	parts width > 0 ifTrue: [ parts scaleBy: newSize / parts width. ].
	parts adjustToChildren.
	