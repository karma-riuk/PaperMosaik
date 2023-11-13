accessing
addAuthorInAuthors: anAuthor
    "This class side method adds an author to the dictionary."

    (self isAuthorInAuthors: anAuthor id)
        ifFalse: [Authors at: anAuthor id put: anAuthor].