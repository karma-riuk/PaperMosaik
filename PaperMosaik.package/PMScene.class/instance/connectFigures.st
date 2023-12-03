helper methods
connectFigures

	| alreadyConnectedFigures lineThickness |
	connections do: [ :line | self removeShape: line ].
	connections removeAll.

	alreadyConnectedFigures := Set new.
	lineThickness := 2.

	radialFigures do: [ :fig1 | 
		radialFigures do: [ :fig2 | 
			(alreadyConnectedFigures includes: fig2) ifFalse: [ 
				alreadyConnectedFigures add: fig1.
				(fig1 model collaboratedWith: fig2 model) ifTrue: [ 
					| line |
					line := RSLine new
						        attachPoint: RSCenteredAttachPoint new;
						        color: (Color r: 0.68 g: 0.83 b: 0.91);
						        width: lineThickness;
						        from: fig1;
						        to: fig2.
					self add: line.
					line pushBack.
					connections add: line ] ] ] ]