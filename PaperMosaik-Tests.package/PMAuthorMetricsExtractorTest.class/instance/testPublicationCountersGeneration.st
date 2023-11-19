tests
testPublicationCountersGeneration
	|anAuthor anExtractor dictionaryOfAuthors pub1 pub2 pub3 yearOfResearch1999 yearOfResearch2000 yearOfResearch2002 yearsOfResearchMock|
	 anAuthor := PMAuthor withAuthorId: 'MicheleLanza001' withAuthorName: 'Michele Lanza'.

	"Example of dictionary for publication with single author"
	dictionaryOfAuthors := Dictionary new at: anAuthor authorName put: anAuthor.

	"An example for 1999"
	pub1 := PMJournalArticle withPublicationId: 'pub01' withTitle: 'First Title' withAuthors: dictionaryOfAuthors withUrl: 'www.google.com' withYear: 1999 withEe: 'doi' 	withNumberOfPages: 24 .

	yearOfResearch1999 := PMYearOfResearch withAuthor: anAuthor withYear: 1999 . yearOfResearch1999 publications at: (pub1 publicationId) put: pub1 .
	yearOfResearch1999 incrementCountForJournalArticle .

	"An example for 2000"
	pub2 := PMJournalArticle withPublicationId: 'pub02' withTitle: 'Second Title' withAuthors: dictionaryOfAuthors withUrl: 'www.google.com' withYear: 2000 withEe: 'doi' 	withNumberOfPages: 35 .

	yearOfResearch2000 := PMYearOfResearch withAuthor: anAuthor withYear: 2000 . yearOfResearch2000 publications at: (pub2 publicationId) put: pub2 .
	yearOfResearch2000 incrementCountForJournalArticle .

	"An example for 2002"
	pub3 := PMJournalArticle withPublicationId: 'pub03' withTitle: 'Third Title' withAuthors: dictionaryOfAuthors withUrl: 'www.google.com' withYear: 2002 withEe: 'doi' 	withNumberOfPages: 24 .

	yearOfResearch2002 := PMYearOfResearch withAuthor: anAuthor withYear: 2002 . yearOfResearch2002 publications at: (pub3 publicationId) put: pub3 .
	yearOfResearch2002 incrementCountForJournalArticle .

	"Link author and yearOfResearch"
	yearsOfResearchMock := Dictionary new 
		at: 1999 put: yearOfResearch1999 ;
		at: 2000 put: yearOfResearch2000 ;
		at: 2002 put: yearOfResearch2002 ;
		yourself .
	anAuthor yearsOfResearch: yearsOfResearchMock .

	"Add the author to the global dictionary"
	PMAuthor addAuthorInAuthors: anAuthor .

	"Initialize PMAuthorMetricExtractor"
	anExtractor := PMAuthorMetricsExtractor withAuthor: anAuthor withStartingYear: 1999 withEndingYear: 2002 .

	anExtractor publicationCountersGeneration .
		
   self assert: (anExtractor publicationCountersByTypeByYear includesKey: 1999).
   self assert: (anExtractor publicationCountersByTypeByYear includesKey: 2000).
   self assert: (anExtractor publicationCountersByTypeByYear includesKey: 2002).

	"Check not trivial year: 2001"
	self assert: (anExtractor publicationCountersByTypeByYear includesKey: 2001).
	
	"Check not existing year"
	self deny: (anExtractor publicationCountersByTypeByYear includesKey: 1998).
	self deny: (anExtractor publicationCountersByTypeByYear includesKey: 2003).
	self deny: (anExtractor publicationCountersByTypeByYear includesKey: 2020).
	
	"Remove test author from global dictionary: "
	PMAuthor removeAuthorFromAuthors: anAuthor authorId .
