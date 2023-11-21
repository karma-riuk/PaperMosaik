adding
addResearcherInResearchers: aResearcher

	(self researchersIncludesResearcherWithId: aResearcher id)
		ifFalse: [ Researchers at: aResearcher id put: aResearcher ]
		