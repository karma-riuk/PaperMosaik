I represent a fractal figure that displays the number of papers written by a researcher by each type of paper they write.

### Example

```st
PMResearcher Researchers.

ducasse := PMResearcher Researchers at: 'Stephane Ducasse'.
lanza := PMResearcher Researchers at: 'Michele Lanza'.
dambros := PMResearcher Researchers at: 'Marco D''Ambros'.

scene := PMScene new.

scene add: (PMFractalFigureByType new model: ducasse).
scene add: (PMFractalFigureByType new model: lanza).
scene add: (PMFractalFigureByType new model: dambros).

scene @ RSCanvasController.
scene zoomToFit.
scene open.
```