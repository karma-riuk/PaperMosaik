tests
testPublicationsCategorizedByCollaborator
    | researcher collaborator1 collaborator2 publication1 publication2 publication3 expectedCategorizedPublications actualCategorizedPublications |

    researcher := PMResearcher newWithId: 'testId001'.
    
    collaborator1 := PMResearcher newWithId: 'collabId1'.
    collaborator2 := PMResearcher newWithId: 'collabId2'.

    "Mock publications"
    
    publication1 := (PMPublication newWithId: 'pubId001') year: 2020; authors: (Set with: collaborator1).
    publication2 := (PMPublication newWithId: 'pubId002') year: 2020; authors: (Set with: collaborator2).
    publication3 := (PMPublication newWithId: 'pubId003') year: 2021; authors: (Set with: collaborator1 with: collaborator2).

    "Assign publications to researcher"
    researcher publicationsByYear: (Dictionary new
        at: 2020 put: (OrderedCollection with: publication1 with: publication2);
        at: 2021 put: (OrderedCollection with: publication3);
        yourself).

    "Define expected categorized publications"
    expectedCategorizedPublications := Dictionary new.
    expectedCategorizedPublications at: (PMLabeledObject new label: collaborator1 id; object: collaborator1) put: (Set with: publication1 with: publication3).
    expectedCategorizedPublications at: (PMLabeledObject new label: collaborator2 id; object: collaborator2) put: (Set with: publication2 with: publication3).
	 

    "Call the method"
    actualCategorizedPublications := researcher publicationsCategorizedByCollaborator.
	 
	
    "Assert that the actual categorized publications match the expected ones"
    self assert: actualCategorizedPublications equals: expectedCategorizedPublications.

    "Assert that the researcher is not included in the collaborators"
    self deny: (actualCategorizedPublications includesKey: (PMLabeledObject new label: researcher id; object: researcher)).
    
