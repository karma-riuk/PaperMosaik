as yet unclassified
createPublication: dbPublication
	|type newPub|
	type:= dbPublication at: 'xmlTag'.
	type = 'article' ifTrue: [ newPub := newPub := PMJournalArticle  withPublicationId: (dbPublication at:'_id' ) withTitle:  (dbPublication at: 'title')withAuthors: (dbPublication at: 'authors' ) withUrl:  (dbPublication at: 'url') withYear: (dbPublication at: 'year') withEe:  (dbPublication at: 'ee') withNumberOfPages:(dbPublication at:'pages' ).
		newPub journalReference: (dbPublication at: 'journal').
		^ newPub .].
	
	type = 'incollection' ifTrue: [ newPub :=  PMBook   withPublicationId: (dbPublication at:'_id' ) withTitle:  (dbPublication at: 'title')withAuthors: (dbPublication at: 'authors' ) withUrl:  (dbPublication at: 'url') withYear: (dbPublication at: 'year') withEe:  (dbPublication at: 'ee') withNumberOfPages:(dbPublication at:'pages' ).
		newPub bookTitle: (dbPublication at: 'booktitle').
		newPub crossReference: (dbPublication at: 'crossref').
		^ newPub .].
	
	
	type = 'inproceedings' ifTrue: [newPub := PMConferencePaper withPublicationId: (dbPublication at:'_id' ) withTitle:  (dbPublication at: 'title')withAuthors: (dbPublication at: 'authors' ) withUrl:  (dbPublication at: 'url') withYear: (dbPublication at: 'year') withEe:  (dbPublication at: 'ee') withNumberOfPages:(dbPublication at:'pages' ).
		newPub crossReference:  (dbPublication at: 'crossref').
		newPub bookTitle: (dbPublication at: 'booktitle'). 
		^ newPub ].