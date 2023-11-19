removing
removeAuthorFromAuthors: anAuthorId
    "This class side method removes an author from the dictionary."

    (self isAuthorInAuthors: anAuthorId)
        ifTrue: [Authors removeKey: anAuthorId]
		  ifFalse: [self error: 'Author not found in class side dictionary of Authors'].