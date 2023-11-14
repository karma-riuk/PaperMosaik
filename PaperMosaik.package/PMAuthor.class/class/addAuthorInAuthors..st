accessing
addAuthorInAuthors: anAuthor
    "This class side method adds an author to the dictionary."

    (self isAuthorInAuthors: anAuthor authorId)
        ifFalse: [Authors at: anAuthor authorId put: anAuthor].