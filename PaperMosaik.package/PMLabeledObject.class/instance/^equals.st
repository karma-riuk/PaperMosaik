comparing
= anOtherLabeledObject
	anOtherLabeledObject class = self class ifFalse: [ ^ false ].
	^ label = (anOtherLabeledObject label) and: object = (anOtherLabeledObject object)