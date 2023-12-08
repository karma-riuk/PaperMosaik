accessing
total: keyToPublication
	 ^ (self keysToSizeSortedBySize: keyToPublication)
		         inject: 0
		         into: [ :sum :each | sum + each value ]. "sum the total values"