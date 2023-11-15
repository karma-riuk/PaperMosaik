accessing
addPublicationInYearOfResearch: publication
    "This instance side method adds a publication to the dictionary handling the logic ad adding the first publication of that year or not."

	 | yearOfThePublication newYearOfResearch |
	 yearOfThePublication := publication year .

    (self isYearInYearsOfResearch: yearOfThePublication)
		  ifTrue:  [(yearsOfResearch at: yearOfThePublication) addPublicationInPublications: publication ] 
		  ifFalse: [newYearOfResearch := PMYearOfResearch withAuthor: self withYear: yearOfThePublication .
						yearsOfResearch at: yearOfThePublication put: newYearOfResearch .
						newYearOfResearch addPublicationInPublications: publication
					  ].