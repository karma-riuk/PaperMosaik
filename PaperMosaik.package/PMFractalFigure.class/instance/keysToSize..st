adding
keysToSize: keyToPublication

	^ (self keysToSizeSortedBySize: keyToPublication) collect: #key.