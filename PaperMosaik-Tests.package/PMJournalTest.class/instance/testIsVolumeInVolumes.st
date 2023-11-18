tests
testIsVolumeInVolumes	
	
	| journal existingVolumeNumber nexistingVolumeNumber aVolume |
   existingVolumeNumber := '1'.
   nexistingVolumeNumber := '2'.
	aVolume := PMJournalVolume  new.
	aVolume volume: existingVolumeNumber.
	
	journal := PMJournal  new.
	journal addVolume: aVolume.

    self assert: (journal isVolumeInVolumes: existingVolumeNumber).
    self deny: (journal isVolumeInVolumes: nexistingVolumeNumber).