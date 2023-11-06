drawing - rectangles
makeCube: p1 to: p3 color: c
	"p1 and p3 are point: (10 @ 10), c is a color"
	"Internal static method used by PMFractal draw:"
	| p2 p4 |
	p2 := (p3 x) @ (p1 y).
	p4 := (p1 x) @ (p3 y).
	
	^ RSPolygon new
		points: { p1 . p2 . p3 . p4 };
		color: c.