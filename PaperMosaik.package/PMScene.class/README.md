I represent a scene on which you can put fractal figures

### Example

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.
ducasse := PMResearcher Researchers at: 'Stephane Ducasse'.
dambros := PMResearcher Researchers at: 'Marco D''Ambros'.


canvas := PMScene new.

canvas add: (PMFractalFigureByYears new model: lanza).
canvas add: (PMFractalFigureByYears new model: ducasse).
canvas add: (PMFractalFigureByYears new model: dambros).

canvas @ RSCanvasController.
canvas zoomToFit.
canvas open.
```