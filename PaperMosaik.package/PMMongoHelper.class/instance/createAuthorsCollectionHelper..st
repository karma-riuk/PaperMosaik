accessing
createAuthorsCollectionHelper: year
	|sourceCollection targetCollection authors papers au auCopy tmpPaper|
	sourceCollection := database getCollection: 'Papers'.
	targetCollection := database getCollection: 'Authors'.
	"name to a dict of year to coauthor and year to papers"
	authors := Dictionary new.
	
		papers := sourceCollection  select: {'year' -> year asString}.
		papers do: [ :paper| au:=paper at:'authors'.
			au do:[:author | 
				auCopy:= OrderedCollection new.
				auCopy addAll: au.
				auCopy remove: author.
				tmpPaper := OrderedCollection new.
				tmpPaper add: (paper at: '_id').
				
				(authors includesKey: author) 
				ifTrue: [  (((authors at: (author at: 'name')) at: 'coauthorsByYear') at: year) addAll: auCopy.
					(((authors at: author) at: 'parseByYear') at: year) add: (paper at: '_id')] 
				ifFalse: [  authors at: (author at: 'name') put: 
					{ 'name'-> (author at: 'name').
					'coauthorsByYear'->{year-> auCopy} asDictionary. 
					'papersByYear'->{year ->  tmpPaper .} asDictionary } asDictionary . ].
					].
				].
		^ authors.
	
		