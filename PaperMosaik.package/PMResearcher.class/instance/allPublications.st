accessing
allPublications
	| allPublications |
	allPublications := OrderedCollection new .
	publications keysDo: [ :year | 
									allPublications addAll: (publications at: year) ] .
	^allPublications 