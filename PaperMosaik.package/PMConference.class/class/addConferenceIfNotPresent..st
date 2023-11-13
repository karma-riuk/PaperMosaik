adding
addConferenceIfNotPresent: aConference
    
Conferences ifNil: [Conferences := Dictionary new].
(Conferences at: aConference name ifAbsent: [nil]) ifNil: [Conferences at: aConference name put: aConference].