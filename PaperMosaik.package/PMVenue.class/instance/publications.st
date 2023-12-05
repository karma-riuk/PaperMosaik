accessing
publications
	| allPublications |
	allPublications := OrderedCollection new .
	publicationsByYear keysDo: [ :year | 
									allPublications addAll: (publicationsByYear at: year) ] .
	^allPublications 