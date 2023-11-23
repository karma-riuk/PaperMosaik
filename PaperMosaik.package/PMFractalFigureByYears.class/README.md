I represent a fractal figure that displays the number of papers written by a researcher by each year.

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