helper methods
updateHelperFrom: startYear to: currentYear
	centralFigure fromYear: startYear toYear: currentYear.
	radialFigures do: [ :researcher| 
					researcher fromYear: startYear  toYear: currentYear.
			].