construction
withAuthor: anAuthor withStartingYear: aStartingYear withEndingYear: anEndingYear
	(aStartingYear < anEndingYear)
	ifTrue: [ ^(self new author: anAuthor ; startingYear: aStartingYear ; endingYear: anEndingYear ) ] 
	ifFalse: [ ^nil ].