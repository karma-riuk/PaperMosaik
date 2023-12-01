helper methods
connectFigures
	| collaborators alreadyConnectedCollaborators lineThickness |
	
	alreadyConnectedCollaborators := Set new.
	collaborators := centralFigure model allCollaborators.
	lineThickness := 2.
	
	collaborators do: [ :collab1 |
		collaborators do: [ :collab2 |
			(alreadyConnectedCollaborators includes: collab2) ifFalse: [ 
				alreadyConnectedCollaborators add: collab1.
				(collab1 allCollaborators includes: collab2) ifTrue: [ |lines|
					lines := RSEdgeBuilder line
					color: (Color r: 0.68 g: 0.83  b:0.91);
					width: lineThickness ;
					canvas: self;
					connectFrom: collab1  to: collab2.
					lines do: [ :l | 
						l attachPoint: (RSBorderAttachPoint new) .
						l pushBack.
						l capRound  .
						].
					 ].
				 ].
			 ].
		 ].