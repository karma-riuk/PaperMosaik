accessing
model: publications
	super model: publications .
	
	self @ (RSMenuActivable new menuDo: [ :menu :element | menu add: 'Inspect' target: (element model) selector: #inspect ]).
