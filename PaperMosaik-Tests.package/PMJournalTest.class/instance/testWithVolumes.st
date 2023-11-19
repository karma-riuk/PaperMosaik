tests
testWithVolumes

	| aJournal volumeCollection volume1 volume2 volume3|
	
	volume1 := PMPublication new.
	volume2 := PMPublication new.
	volume3 := PMPublication new.
	volumeCollection := #(volume1 volume2 volume3).

	aJournal  := PMJournal withVolumes: volumeCollection.
	
	self assert: aJournal volumes equals: volumeCollection.