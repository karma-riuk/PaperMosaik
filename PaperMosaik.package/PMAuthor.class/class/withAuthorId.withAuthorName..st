construction
withAuthorId: aId withAuthorName: aName
"|c|
c := self new.
c id: aId .
c name: aName. 
^ c."
^ self new authorId: aId ; authorName: aName 