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
					repository: 'github://pharo-graphics/Roassal/src';
					loads: #('Full')
				].
			spec 
				baseline: 'MongoTalk'
				with: [ spec 
					repository: 'github://pharo-nosql/mongotalk/mc';
					loads: #('Full')
					 ].
			spec 
				baseline: 'XMLParser'
				with: [ spec 
					repository: 'github://pharo-contributions/XML-XMLParser/src';
					loads: #('Full')
					 ].
		]