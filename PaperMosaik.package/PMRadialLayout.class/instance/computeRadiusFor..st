hook
computeRadiusFor: elements
	| circonference |
	circonference := elements inject: 0 into: [ :sum :each | 
		sum + each diagonal.
		].
	^ (circonference / (2 * Float pi))asFloat
	