tests
testAllYearsOfResearch
|anAuthor sortedYears expectedOrder|
anAuthor := PMAuthor withAuthorId: 'id1' withAuthorName: 'AuthorName' .

anAuthor yearsOfResearch: (Dictionary new
        at: 2022 put: (PMYearOfResearch new);
        at: 2019 put: (PMYearOfResearch new);
        at: 2020 put: (PMYearOfResearch new);
        yourself).

sortedYears := anAuthor allYearsOfResearch.
expectedOrder := #(2019 2020 2022) asOrderedCollection.
self assert: sortedYears equals: expectedOrder.

"Test empty research"
anAuthor yearsOfResearch: Dictionary new.
sortedYears := anAuthor allYearsOfResearch.
expectedOrder := #() asOrderedCollection.
self assert: sortedYears equals: expectedOrder.