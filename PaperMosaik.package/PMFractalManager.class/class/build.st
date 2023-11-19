building
build
	| newFractalManager |
	newFractalManager := self new.
	newFractalManager setCanvas: RSCanvas new.
	newFractalManager setLayout: RSFlowLayout new.
	^ newFractalManager.
	