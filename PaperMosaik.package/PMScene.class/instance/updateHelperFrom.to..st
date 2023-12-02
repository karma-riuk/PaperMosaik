helper methods
updateHelperFrom: from to: to
	centralFigure fromYear: from toYear: to.
	
"	radialFigures do: [ :figure| 
					figure fromYear: from  toYear: to.
			]."
	radialFigures do: [ :figure | self removeShape: figure ].
	radialFigures := ((centralFigure model) allCollaboratorsFromYear: from ToYear: to) collect: [ :collab | figureType new model: collab ] into: RSGroup new.
	radialFigures := radialFigures reject: [ :figure | figure numberOfPapersToShow = 0 ].
	self addAll: radialFigures.