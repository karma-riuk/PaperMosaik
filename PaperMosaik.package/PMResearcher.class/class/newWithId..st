instance creation
newWithId: anId
	| aResearcher |
	aResearcher := super newWithId: anId .
	self addResearcherInResearchers: aResearcher .
	^aResearcher .
	