accessing
addPublication: aPublication

(publicationsByYear includesKey: aPublication year) ifFalse: [ publicationsByYear at: aPublication year put: OrderedCollection new ].

(publicationsByYear at: aPublication year) add: aPublication .