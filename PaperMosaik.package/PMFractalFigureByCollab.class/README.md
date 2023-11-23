I represent a fractal figure that displays the number of papers written by a researcher by each reseacher they collaborated with.

### Example

```st
PMResearcher Researchers.

ducasse := PMResearcher Researchers at: 'Stephane Ducasse'.

scene := PMScene new.

scene add: (PMFractalFigureByCollab new model: ducasse).

scene @ RSCanvasController.
scene zoomToFit.
scene open.
```