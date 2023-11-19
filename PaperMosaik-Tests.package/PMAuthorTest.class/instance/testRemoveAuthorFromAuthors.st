tests
testRemoveAuthorFromAuthors
    | existingAuthorId nonExistingAuthorId |

    existingAuthorId := 'Author001'.
    PMAuthor addAuthorInAuthors: (PMAuthor withAuthorId: existingAuthorId withAuthorName: 'Existing Author').
    self assert: (PMAuthor isAuthorInAuthors: existingAuthorId).
    PMAuthor removeAuthorFromAuthors: existingAuthorId.
    self deny: (PMAuthor isAuthorInAuthors: existingAuthorId).

    nonExistingAuthorId := 'NonExistingAuthor'.
    self should: [PMAuthor removeAuthorFromAuthors: nonExistingAuthorId] raise: Error.