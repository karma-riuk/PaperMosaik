accessing
addAuthorIfNotPresent: anAuthor
    "This class side method initializes the 'authors' dictionary if it is empty. 
    It then checks if the given 'anAuthor' instance is already present in the dictionary.
    If the author is not present, it adds them to the dictionary; 
    otherwise, it does nothing."

    (Authors at: anAuthor id ifAbsent: [nil]) ifNil: [Authors at: anAuthor id put: anAuthor].