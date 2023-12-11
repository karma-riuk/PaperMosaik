accessing
model: aResearcher
	model := aResearcher.
	keyToPublication := self prvtKeyToPublication: aResearcher.
	self prvtSetHelperVars.
	self addAllParts: (self maxSize: total).
	self addName: aResearcher id.
	"self addAllParts: (aResearcher publicationsCategorizedByTypeFromYear: 2001 ToYear: 2003)"

	