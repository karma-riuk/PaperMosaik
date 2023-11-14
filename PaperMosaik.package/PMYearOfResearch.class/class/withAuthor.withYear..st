constructor
withAuthor: anAuthor withYear: anYear
"|c|
c := self new.
c id: aId .
c name: aName. 
^ c."
^ self new author: anAuthor ; year: anYear ; coAuthors: Dictionary new; publications: Dictionary new .