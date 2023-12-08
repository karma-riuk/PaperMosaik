accessing
addAllParts: keyToPublication
	self addAllParts: keyToPublication size: (self maxSize: (self total: keyToPublication)).
	"maxSize := self maxSize: total. ""Size is proportional of the total value"