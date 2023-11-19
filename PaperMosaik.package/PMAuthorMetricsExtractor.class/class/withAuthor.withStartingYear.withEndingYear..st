construction
withAuthor: anAuthor withStartingYear: aStartingYear withEndingYear: anEndingYear
	(aStartingYear isInteger) ifFalse: [ self error: 'Invalid input: starting year is not a number' ].	
	(anEndingYear isInteger) ifFalse: [ self error: 'Invalid input: ending year is not a number' ].
	(aStartingYear < anEndingYear)
	ifTrue: [ ^(self new author: anAuthor ; startingYear: aStartingYear ; endingYear: anEndingYear ) ] 
	ifFalse: [ self error: 'Invalid input: starting year should be less than ending year' ].