accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			" Main project "
			spec
				package: 'PaperMosaik';
				package: 'PaperMosaik-Tests' with: [ spec requires: #('PaperMosaik') ].
				
			" Dependencies"
			spec 
				baseline: 'Roassal3'
				with: [ spec
					repository: 'github://ObjectProfile/Roassal3/src:v1.01'
				].
		]