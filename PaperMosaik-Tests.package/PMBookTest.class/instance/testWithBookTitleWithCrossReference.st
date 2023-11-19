tests
testWithBookTitleWithCrossReference
	"Test the withBookTitle:withCrossReference: method"

    | bookTitle crossReference book |
    bookTitle := 'Book001'.
    crossReference := 'link'.

    book := PMBook withBookTitle: bookTitle withCrossReference: crossReference.

    "Verify that the author has the correct ID and name"
    self assert: book bookTitle equals: bookTitle.
    self assert: book crossReference equals: crossReference.