private - accessing
cleanAndSort: aDict
	| filteredDict keysSortedByValue |
	filteredDict := aDict associationsSelect: [ :association | association value > 0 ].
	keysSortedByValue := (filteredDict associations sort: #value descending ) collect: #key.
	^ keysSortedByValue 