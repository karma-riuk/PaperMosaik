adding
addConferenceIfNotPresent: aConference
    
conferences ifNil: [conferences := Dictionary new].
(conferences at: aConference name ifAbsent: [nil]) ifNil: [conferences at: aConference name put: aConference].