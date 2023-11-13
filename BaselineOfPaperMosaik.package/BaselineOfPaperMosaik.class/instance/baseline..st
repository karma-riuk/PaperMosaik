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
				
			" Dependencies "
			spec baseline: 'Roassal' with: [ spec repository: 'github://pharo-graphics/Roassal/src' ].
			spec 
				baseline: 'MongoTalk'
				with: [ spec 
					repository: 'github://pharo-nosql/mongotalk/mc'
				].
			spec 
				baseline: 'NeoJSON' 
				with: [ spec
					 repository: 'github://svenvc/NeoJSON/repository' 
				].
		]