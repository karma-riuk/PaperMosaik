tests
testWithAuthorWithYear
    "Test the withAuthorId:withAuthorName: class side method for YearOfResearch constructor implementation."

    | author year yearOfResearch |
	 author := PMAuthor new .
	 author authorName: 'Foo' .
	 year := 2023 .
	
	 yearOfResearch := PMYearOfResearch withAuthor: author withYear: year .

    "Verify that the yearOfResearch has the correct author, year, and that publications is a dictionary"
    self assert: (yearOfResearch author authorName) equals: (author authorName) .
    self assert: (yearOfResearch year) equals: (year).
	 self assert: ((yearOfResearch publications) isKindOf: Dictionary) .