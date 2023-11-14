accessing
addCoAuthorInCoAuthors: aCoAuthor
    "This method adds a coAuthor to the dictionary."

    (self isCoAuthorInCoAuthors: aCoAuthor authorId)
        ifFalse: [coAuthors at: aCoAuthor authorId put: aCoAuthor ].