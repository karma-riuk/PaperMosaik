private - accessing
cleanAndSort: aDict
	| filteredDict keysToValueSortedByValue |
	filteredDict := aDict associationsSelect: [ :association | association value > 0 ].
	keysToValueSortedByValue := filteredDict associations sort: #value descending .

	^ keysToValueSortedByValue 