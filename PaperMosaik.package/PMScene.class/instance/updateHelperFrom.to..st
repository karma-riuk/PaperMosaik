accessing
updateHelperFrom: startYear to: currentYear
	centralResearcher fromYear: startYear toYear: currentYear.
	radialResearchers do: [ :researcher| 
				researcher class = PMFractalFigure ifTrue: [ 
					researcher fromYear: startYear  toYear: currentYear  .
					 ].
			].