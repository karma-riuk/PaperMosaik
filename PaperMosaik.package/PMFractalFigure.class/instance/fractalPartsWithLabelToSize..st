as yet unclassified
fractalPartsWithLabelToSize: aFractalPartContent

	^(aFractalPartContent collect: [ :value | 
		                     value size ] )

	