drawing - rectangles
makeDraggableIcon:  size withColor: color
	"p1 and p3 are point: (10 @ 10), c is a color"
	"Internal static method used by PMFractal draw:"
	|composite polygon1 polygon2 polygon3 polygon4 polygon5 polygon6| 
	
	composite := RSComposite new .

	polygon1 := RSPolygon new
	points: { (0.49 * size) @ (1.25 * size) . (2.51 * size) @ (1.25 * size) . (2.51 * size) @ (1.75 * size) . (0.49 * size) @ (1.75 * size)};
	color: color.

	polygon2 := RSPolygon new
	points: { (1.25 * size) @ (0.49 * size) . (1.25 * size) @ (2.51 * size) . (1.75 * size) @ (2.51 * size) . (1.75 * size) @ (0.49 * size)};
	color: color.

	polygon3 := RSPolygon new
	points: { (1.5 * size) @ (0 * size) . (1 * size) @ (0.5 * size) . (2 * size) @ (0.5 * size)};
	color: color.

	polygon4 := RSPolygon new
	points: { (0 * size) @ (1.5 * size) . (0.5 * size) @ (1 * size) . (0.5 * size) @ (2 * size)};
	color: color.

	polygon5 := RSPolygon new
	points: { (1.5 * size) @ (3 * size) . (1 * size) @ (2.5 * size) . (2 * size) @ (2.5 * size)};
	color: color.

	polygon6 := RSPolygon new
	points: { (3 * size) @ (1.5 * size) . (2.5 * size) @ (1 * size) . (2.5 * size) @ (2 * size)};
	color: color.

	composite shapes: { polygon1 . polygon2 . polygon3 . polygon4 . polygon5 . polygon6}.
	
^ composite