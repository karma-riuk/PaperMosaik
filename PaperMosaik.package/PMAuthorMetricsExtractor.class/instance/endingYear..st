accessing
endingYear: anObject
    (anObject isInteger)
        ifTrue: [endingYear := anObject]
        ifFalse: [self error: 'Invalid input: endingYear must be an integer'].