initialization
initialize  
	super initialize.  
	palette := OrderedCollection new   
	add: (Color fromString: 'ef476f') ; "Dark pink"  
	add: (Color fromString: 'ffd166'); "Light yellow"  
	add: (Color fromString: '06d6a0'); "Green"  
	add: (Color fromString: '118ab2'); "Light blue"  
	add: (Color fromString: '343a40'); "Dark gray"  
	yourself.
	transparency := 1.
	parts := RSComposite new size: 10.
	self add: parts.
	label := RSComposite new.