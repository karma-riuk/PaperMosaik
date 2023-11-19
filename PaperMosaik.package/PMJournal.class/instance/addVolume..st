testing
addVolume: aVolume

	(self isVolumeInVolumes: aVolume volume)
        ifFalse: [volumes at: aVolume volume put: aVolume ]. 