as yet unclassified
create: aName withCoauthors: coauthors withPapers: papers withId: id
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
	|newAuthor|
	newAuthor := PMAuthor new.
	newAuthor setName: aName.
	newAuthor setCoauthors: coauthors .
	newAuthor setPapers: papers .
	newAuthor setId: id.
	^ newAuthor .