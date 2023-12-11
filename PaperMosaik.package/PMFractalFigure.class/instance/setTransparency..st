accessing
setTransparency: tr
	  parts children do: [ :child | 
		child color:(child color alpha: tr).
		 ].
	