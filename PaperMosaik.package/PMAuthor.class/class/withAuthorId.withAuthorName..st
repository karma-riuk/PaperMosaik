construction
withAuthorId: aId withAuthorName: aName
"|c|
c := self new.
c id: aId .
c name: aName. 
^ c."
^ self new idAuthor: aId ; authorName: aName .