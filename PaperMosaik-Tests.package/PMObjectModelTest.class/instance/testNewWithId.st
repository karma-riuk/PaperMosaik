tests
testNewWithId
    | objectId instance |

    objectId := 'testId123'.
    instance := PMObjectModel newWithId: objectId.

    "Verify that the instance has the correct ID"
    self assert: instance id equals: objectId.
