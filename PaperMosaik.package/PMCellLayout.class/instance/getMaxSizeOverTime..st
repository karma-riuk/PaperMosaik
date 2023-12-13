as yet unclassified
getMaxSizeOverTime: shape
	| startYear endYear |
	startYear := shape canvas startYear.
	endYear := shape canvas endYear.
	
	^ ((startYear to: endYear) collect: [ :year | shape maxSizeForYear: year ]) max.
