tests
testNew
    "Verify that calling new raises an error"
    self should: [PMObjectModel new] raise: Error.