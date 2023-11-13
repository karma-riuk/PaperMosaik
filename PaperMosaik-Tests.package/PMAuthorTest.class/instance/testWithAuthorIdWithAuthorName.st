tests
testWithAuthorIdWithAuthorName
    "Test the withAuthorId:withAuthorName: method."

    | authorId authorName author |
    authorId := 'Author001'.
    authorName := 'John Doe'.

    author := PMAuthor withAuthorId: authorId withAuthorName: authorName.

    "Verify that the author has the correct ID and name"
    self assert: author authorId equals: authorId.
    self assert: author authorName equals: authorName.