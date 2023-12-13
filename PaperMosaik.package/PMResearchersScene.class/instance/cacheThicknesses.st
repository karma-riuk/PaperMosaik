helper methods
cacheThicknesses
	" Creates a 3D dictionary: 
	startYear -> endYear -> collaborator : number of collaborations
	"
	| centralResearcher thicknesses |
	
	cachedThicknesses := Dictionary new.
	centralResearcher := centralFigure model.
	
	startYear to: endYear do: [ :currentStartYear | | thicknessesForCurrentStartYear |
		thicknessesForCurrentStartYear := Dictionary new.
		
		currentStartYear to: endYear do: [ :currentEndYear |	 
				| collaboratorToNumCollaborations maxCollaborations | 
				collaboratorToNumCollaborations := 
					centralResearcher getAuthorToNumCollaborationsFrom: currentStartYear to: currentEndYear.
				maxCollaborations := collaboratorToNumCollaborations 
					ifEmpty: [ 0 ]
					ifNotEmpty: [ collaboratorToNumCollaborations max ].
				thicknesses :=  collaboratorToNumCollaborations collect: [ :assoc |
					minConnectionThickness + (assoc value / maxCollaborations
		              * (maxConnectionThickness - minConnectionThickness))
			             ceiling
					].	
		
				
				thicknessesForCurrentStartYear at: currentEndYear put: thicknesses.
			].
		
		cachedThicknesses at: currentStartYear put: thicknessesForCurrentStartYear.
		].