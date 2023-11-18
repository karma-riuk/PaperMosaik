accessing
startingYear: anObject
    (anObject isInteger)
        ifTrue: [startingYear := anObject]
        ifFalse: [self error: 'Invalid input: startingYear must be an integer'].