tests
testAuthors

	"Test the Authors class side method."

self assert: ((PMAuthor Authors) isKindOf: Dictionary).
self deny: (PMAuthor Authors) isNil.
self assert: (PMAuthor Authors) == (PMAuthor Authors). "Ensure the same instance is returned on subsequent calls"