initialization
initialize 
	super initialize .
	publications := Dictionary new .
	coAuthors := Dictionary new .
	typeBasedPublicationCounts := Dictionary new .

   "Initialize typeBasedPublicationCounts with default publication types"
   typeBasedPublicationCounts at: 'JournalArticle' put: 0.
   typeBasedPublicationCounts at: 'ConferencePaper' put: 0.
   typeBasedPublicationCounts at: 'Book' put: 0.