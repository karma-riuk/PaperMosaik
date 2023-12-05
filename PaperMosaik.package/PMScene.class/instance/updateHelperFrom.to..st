helper methods
updateHelperFrom: from to: to
	centralFigure fromYear: from toYear: to.
	
	radialFigures do: [ :figure| 
					figure fromYear: from  toYear: to.
			].
"	self connectFigures."