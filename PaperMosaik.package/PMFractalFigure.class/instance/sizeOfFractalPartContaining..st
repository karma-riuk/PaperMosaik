as yet unclassified
sizeOfFractalPartContaining: aFractalPartContent

	^(aFractalPartContent collect: [ :oldValue | 
		                     oldValue size ] )

	