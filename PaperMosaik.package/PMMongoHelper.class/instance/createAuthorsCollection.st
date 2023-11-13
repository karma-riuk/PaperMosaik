accessing
createAuthorsCollection
	|sourceCollection targetCollection authors tmp old|
	sourceCollection := database getCollection: 'Papers'.
	targetCollection := database getCollection: 'Authors'.
	"name to a dict of year to coauthor and year to papers"
	authors := Dictionary new.
	2000 to: 2002 do: [ :i | 
		authors := self createAuthorsCollectionHelper: i asString.
		authors do: [ :author| 
			tmp := targetCollection  detect: { 'name'-> (author at: 'name')} .
			tmp = nil ifTrue: [ targetCollection commandInsert: (author asDictionary)  writeConcern: nil ] 
			ifFalse: [
				old:= tmp clone.
				(tmp at: 'coauthorsByYear') addAll: (author at: 'coauthorsByYear').
				(tmp at: 'papersByYear') addAll: (author at: 'papersByYear').
				targetCollection commandUpdate: old asDictionary with: tmp asDictionary.
				].
			 ] .
		].
		
	^ authors.
	
		