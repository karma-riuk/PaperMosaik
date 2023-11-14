tests
testAddPublicationInYearOfResearch
    "Test the addPublicationInYearOfResearch: method."

    | anAuthor publication existingYear newYear publicationForExistingYear publicationForNewYear |
    
    "Setup"
    anAuthor := PMAuthor new.
    existingYear := 2022.
    newYear := 2023.
	 
	 publication := PMPublication new .
	 publication year: existingYear .
	 publication publicationId: 'first2022' .
	
	 publicationForExistingYear := PMPublication new .
	 publicationForExistingYear year: existingYear .
	 publicationForExistingYear publicationId: 'second2022' .
	
	 publicationForNewYear := PMPublication new .
	 publicationForNewYear year: newYear .
	 publicationForNewYear publicationId: 'thirdButFirst2023' .

    "Test adding a publication to a new year for the first time"
    anAuthor addPublicationInYearOfResearch: publication.

    "Test adding a publication to an existing year"
    anAuthor addPublicationInYearOfResearch: publicationForExistingYear.
    self assert: (anAuthor isYearInYearsOfResearch: publicationForExistingYear year).

    "Test adding a publication to a new year"
    self deny: (anAuthor yearsOfResearch includesKey: newYear).
    anAuthor addPublicationInYearOfResearch: publicationForNewYear.
    self assert: (anAuthor yearsOfResearch includesKey: newYear).
    self assert: (anAuthor isYearInYearsOfResearch: publicationForNewYear year).
