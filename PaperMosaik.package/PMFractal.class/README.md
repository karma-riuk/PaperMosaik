"I draw fractal images"

"I return a shape that can be added to a canvas"

"I am a static class"

Public API and Key Messages

- How to create a fractal.
	PMFractal draw: anArray  

example:

|canvas fractal|
canvas := RSCanvas new.
fractal := PMFractal draw: #( 3 5 4 2 1 2 7 1).
canvas add: fractal.


- Internal method, this is used by the method draw to draw a rectangle
	PMFractal makeCube: p1 to: p2  color: color
	p1 and p2 are Point like:	 (0 @ 10)
	color is like:	 Color red
	it will return a RSPolygon:

	p1 ---------- #
	|				  |
	|				  |
	|				  |
	# ----------- p2