animation
updateFiguresForYear: aYear
	figures do: [ :fig | fig year: aYear; adjustToChildren. ]
	