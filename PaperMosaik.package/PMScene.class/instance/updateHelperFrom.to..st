helper methods
updateHelperFrom: from to: to
	centralFigure fromYear: from toYear: to.
	
"	radialFigures do: [ :figure| 
					figure fromYear: from  toYear: to.
			]."
"	radialFigures do: [ :figure | self removeShape: figure ].
	radialFigures := ((centralFigure model) allCollaboratorsFromYear: from ToYear: to) collect: [ :collab | figureType new model: collab ] into: RSGroup new.
	self addAll: radialFigures.
	self connectFigures."