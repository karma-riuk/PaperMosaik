accessing
Authors
    "Class side getter method for the Authors variable. 
    Initializes Authors as a new Dictionary if it is nil."

    Authors ifNil: [Authors := Dictionary new].
    ^Authors

