adding
addPublication: aPublication

	(self isPublicationInPublications: aPublication publicationId)
        ifFalse: [publications at: aPublication publicationId put: aPublication ]. 