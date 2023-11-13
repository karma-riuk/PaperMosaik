tests
testIsAuthorInAuthors
    "Test the isAuthorInAuthors: method."

    | existingAuthorId newAuthorId author |
    existingAuthorId := 'ExistingAuthor001'.
    newAuthorId := 'NewAuthor001'.

    "Add an author to ensure it exists in the dictionary"
    author := PMAuthor new.
    author authorId: existingAuthorId.
    PMAuthor addAuthorInAuthors: author.

    "Test with an existing author ID"
    self assert: (PMAuthor isAuthorInAuthors: existingAuthorId).

    "Test with a non-existing author ID"
    self deny: (PMAuthor isAuthorInAuthors: newAuthorId).
