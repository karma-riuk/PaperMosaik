accessing
setTransparency: tr
	transparency := tr.
	  parts children do: [ :child | 
		child color: (child color alpha: tr).
		 ].
		label children do: [ :child | 
		child color: (child color alpha: tr).
		 ].