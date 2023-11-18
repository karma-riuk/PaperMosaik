tests
testAddVolume

	| journal aVolume aVolumeNumber |
	aVolumeNumber  := '1'.
	aVolume := PMJournalVolume new.
	aVolume volume: aVolumeNumber.

	journal := PMJournal new.
	journal addVolume: aVolume.
	
	self assert: (journal volumes at: aVolumeNumber) equals: aVolume.