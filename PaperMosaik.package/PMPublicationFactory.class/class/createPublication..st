as yet unclassified
createPublication: dbPublication
	|type newPub|
	type:= dbPublication at: 'xmlTag'.
	type = 'article' ifTrue: [ newPub := newPub := PMJournalArticle  
		withPublicationId: (self prvtFindOrNil: dbPublication  key: '_id' ) 
		withTitle:  (self prvtFindOrNil: dbPublication  key: 'title')
		withAuthors: (self prvtFindOrNil: dbPublication  key:'authors' ) 
		withUrl:  (self prvtFindOrNil: dbPublication  key: 'url') 
		withYear: (self prvtFindOrNil: dbPublication  key: 'year') 
		withEe:  (self prvtFindOrNil: dbPublication  key: 'ee') 
		withNumberOfPages:(self prvtFindOrNil: dbPublication  key:'pages' ).
		newPub journalReference: (self prvtFindOrNil: dbPublication  key:'journal').
		^ newPub .].
	
	type = 'incollection' ifTrue: [ newPub :=  PMBook   
		withPublicationId: (self prvtFindOrNil: dbPublication  key:'_id' )
		 withTitle:  (self prvtFindOrNil: dbPublication  key: 'title')
		withAuthors: (self prvtFindOrNil: dbPublication  key: 'authors' ) 
		withUrl:  (self prvtFindOrNil: dbPublication  key: 'url') 
		withYear: (self prvtFindOrNil: dbPublication  key: 'year') 
		withEe:  (self prvtFindOrNil: dbPublication  key: 'ee') 
		withNumberOfPages:(self prvtFindOrNil: dbPublication  key:'pages' ).
		newPub bookTitle: (self prvtFindOrNil: dbPublication  key:'booktitle').
		newPub crossReference: (self prvtFindOrNil: dbPublication  key:'crossref').
		^ newPub .].
	
	
	type = 'inproceedings' ifTrue: [newPub := PMConferencePaper 
		withPublicationId: (self prvtFindOrNil: dbPublication  key:'_id' ) 
		withTitle:  (self prvtFindOrNil: dbPublication  key: 'title')
		withAuthors: (self prvtFindOrNil: dbPublication  key:'authors' ) 
		withUrl:  (self prvtFindOrNil: dbPublication  key: 'url') 
		withYear: (self prvtFindOrNil: dbPublication  key: 'year') 
		withEe:  (self prvtFindOrNil: dbPublication  key: 'ee') 
		withNumberOfPages:(self prvtFindOrNil: dbPublication  key: 'pages' ).
		newPub crossReference:  (self prvtFindOrNil: dbPublication  key:'crossref').
		newPub bookTitle: (self prvtFindOrNil: dbPublication  key: 'booktitle'). 
		^ newPub ].