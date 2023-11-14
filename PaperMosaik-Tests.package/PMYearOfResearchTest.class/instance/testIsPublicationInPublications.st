tests
testIsPublicationInPublications
    "Test the isPublicationInPublications method."

    | existingPublicationId newPublicationId publication yearOfResearch|
    existingPublicationId := '23pubKey'.
    newPublicationId := 'NewPubKey123'.

    "Add an publication to ensure it exists in the dictionary"
    publication := PMPublication new.
    publication publicationId: existingPublicationId.
    yearOfResearch := PMYearOfResearch withAuthor: PMAuthor new withYear: 2000 .
	 yearOfResearch addPublicationInPublications: publication .

    "Test with an existing publication ID"
    self assert: (yearOfResearch isPublicationInPublications: existingPublicationId ).

    "Test with a non-existing publication ID"
    self deny: (yearOfResearch isPublicationInPublications: newPublicationId ).