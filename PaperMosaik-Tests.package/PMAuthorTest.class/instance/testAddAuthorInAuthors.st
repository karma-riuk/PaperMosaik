tests
testAddAuthorInAuthors
    "Test the addAuthorInAuthors: method."

    | author existingAuthor newAuthorId |
    newAuthorId := 'MarcoRossi001'.
    author := PMAuthor new.
	 author authorId: newAuthorId .
    PMAuthor addAuthorInAuthors: author.
    self assert: ((PMAuthor Authors at: newAuthorId) authorName) = author authorName .

    "Test adding an existing author"
    existingAuthor := (PMAuthor Authors) at: newAuthorId ifAbsent: [nil].
    self assert: existingAuthor notNil.