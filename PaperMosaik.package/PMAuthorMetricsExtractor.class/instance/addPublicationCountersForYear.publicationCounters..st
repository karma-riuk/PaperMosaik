adding
addPublicationCountersForYear: aYear publicationCounters: publicationCounter
    (aYear isInteger)
        ifTrue: [
				(publicationCounter isDictionary)
					ifTrue: [publicationCountersByTypeByYear at: aYear put: publicationCounter]
					ifFalse: [ self error: 'Invalid publicationCounter. PublicationCounter must be a Dictionary<type, counter>' ]
		  ]
        ifFalse: [self error: 'Invalid year type. Year must be an integer'].