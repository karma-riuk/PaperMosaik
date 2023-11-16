as yet unclassified
create: aName withCoauthors: coauthors withPapers: papers withId: id
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
	|newAuthor|
	newAuthor := PMAuthor new.
	newAuthor authorName: aName.
	newAuthor setCoauthors: coauthors .
	newAuthor setPapers: papers .
	newAuthor authorId: id.
	^ newAuthor .