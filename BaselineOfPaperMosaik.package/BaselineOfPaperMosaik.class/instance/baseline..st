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
				baseline: 'Roassal'
				with: [ spec
					repository: 'github://ObjectProfile/Roassal/src';
					loads: #('Full')
				].
		]