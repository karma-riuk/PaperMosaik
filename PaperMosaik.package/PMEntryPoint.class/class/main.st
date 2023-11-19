accessing
main

	| author metricsExtractor fractalManager |
	
	author := self getMockAuthor. "TODO: change to a call to the classes that handle the interaction with the DB"
	

	metricsExtractor := self getMockExtractorFromAuthor: author. "TODO: change to call the appropriate method on the author instance"
	
	fractalManager := PMFractalManager build.
	fractalManager animate: author with: metricsExtractor. "TODO: change to passing just the author. Right now we pass in the metrics because they are mocked but in the future, the fractalManager will call `author extractMetrics` or something like that."