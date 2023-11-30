accessing
layoutHelper
	| radius maxWidth |
	
	maxWidth := 0.
	radialResearchers  do: [ :each | maxWidth < each width ifTrue: [ maxWidth = each width ] ].
	maxWidth < centralResearcher width ifTrue: [ maxWidth := centralResearcher width ].
	radius := 2 * maxWidth.
	
	(RSWeightedCircleLayout new radius: radius) on: radialResearchers.
	
"	centralResearcher translateTopLeftTo: (self extent x / 2) @ (self extent y / 2)."
	RSLocation new center; stick: centralResearcher on: radialResearchers.