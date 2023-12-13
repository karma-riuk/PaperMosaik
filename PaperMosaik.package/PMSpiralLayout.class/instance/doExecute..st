hook
doExecute: elements
	| angle rad angleIncrement |
	rad := initialRadius.
	angle := self initialAngle.
	elements
		do: [ :each | | point diag radIncrement |
			diag := each diagonal.
			angleIncrement := diag / rad.
			radIncrement := (diag / 12).
			rad := rad + radIncrement.
			angle := angle + (angleIncrement/2).
			point := Point r: rad theta: angle.
			angle := angle + (angleIncrement/2).
			translator translate: each to: point. ]