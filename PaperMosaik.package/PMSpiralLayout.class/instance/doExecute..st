hook
doExecute: elements
	| angle rad angleIncrement |
"	rad := self computeRadiusFor: elements."
	rad := 2500.
"	angleIncrement := 0.08."
	angle := self initialAngle.
	elements
		do: [ :each | | point diag |
			diag := each diagonal.
			angleIncrement := diag / rad.
			rad := rad + ((diag / 12)) .
			angle := angle + (angleIncrement/2).
			point := Point r: rad theta: angle.
			angle := angle + (angleIncrement/2).
			translator translate: each to: point. ]