tests
testAddPublicationInPublications

	"Test the addPublicationInPublications: method."

	| yearOfResearch publication existingPublication newPublicationId |
	newPublicationId := 'pubKey234'.
	publication := PMPublication new.
	publication publicationId: newPublicationId.
	publication title: 'Title of the publication'.

	yearOfResearch := PMYearOfResearch
		                  withAuthor: PMAuthor new
		                  withYear: 1999.
	yearOfResearch addPublicationInPublications: publication.
	self
		assert: (yearOfResearch publications at: newPublicationId) title
		equals: publication title.
	existingPublication := yearOfResearch publications
		                       at: newPublicationId
		                       ifAbsent: [ nil ].
	self assert: existingPublication notNil