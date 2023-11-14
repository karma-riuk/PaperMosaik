accessing
addPublicationInPublications: aPublication
    "This method adds a publication to the dictionary."

    (self isPublicationInPublications: aPublication publicationId)
        ifFalse: [publications at: aPublication publicationId put: aPublication ].