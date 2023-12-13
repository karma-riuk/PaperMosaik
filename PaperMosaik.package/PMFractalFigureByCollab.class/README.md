I represent a fractal figure that displays the number of papers written by a researcher by each reseacher they collaborated with.

### Example

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.

scene := PMResearchersScene new figureType: PMFractalFigureByCollab; model: lanza.

scene open.
```