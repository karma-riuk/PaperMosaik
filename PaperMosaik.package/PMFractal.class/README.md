"I draw fractal images"

"I return a shape that can be added to a canvas with a label"

"I am a static class"

Public API and Key Messages

- How to create a fractal.
	PMFractal draw: aDictionary authorName: aName  

example:

```st
|canvas fractal|
canvas := RSCanvas new.

dict := Dictionary newFrom: { 'a' -> 3 . 'b' -> 5 . 'd' -> 2 }.

fractal := PMFractal draw: dict authorName: 'example name'.

canvas add: fractal.

```

- Internal method, this is used by the method draw to draw a rectangle with a color and a label shown when hovering
	PMFractal makeCube: p1 to: p2  color: color label 'label'
	p1 and p2 are Point like:	 (0 @ 10)
	color is like:	 Color red
	it will return a RSPolygon:

	p1 ---------- #
	|				  |
	|				  |
	|				  |
	# ----------- p2