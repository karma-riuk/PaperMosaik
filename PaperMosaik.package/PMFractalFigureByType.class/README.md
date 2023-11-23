I represent a fractal figure that displays the number of papers written by a researcher by each type of paper they write.

### Example

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.
ducasse := PMResearcher Researchers at: 'Stephane Ducasse'.
dambros := PMResearcher Researchers at: 'Marco D''Ambros'.


canvas := PMScene new.

canvas add: (PMFractalFigureByType new model: lanza).
canvas add: (PMFractalFigureByType new model: ducasse).
canvas add: (PMFractalFigureByType new model: dambros).

canvas @ RSCanvasController.
canvas zoomToFit.
canvas open.
```