I represent a fractal figure that displays the number of papers written by a researcher by each reseacher they collaborated with.

### Example

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.
ducasse := PMResearcher Researchers at: 'Stephane Ducasse'.
dambros := PMResearcher Researchers at: 'Marco D''Ambros'.


canvas := PMScene new.

canvas add: (PMFractalFigureByCollab new model: lanza).
canvas add: (PMFractalFigureByCollab new model: ducasse).
canvas add: (PMFractalFigureByCollab new model: dambros).

canvas @ RSCanvasController.
canvas zoomToFit.
canvas open.
```