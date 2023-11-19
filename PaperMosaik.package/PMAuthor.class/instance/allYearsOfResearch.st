accessing
allYearsOfResearch
	|sortedYears|
	sortedYears := yearsOfResearch keys asArray sort.
   		^sortedYears asOrderedCollection .