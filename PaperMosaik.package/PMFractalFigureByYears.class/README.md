I represent a fractal figure that displays the number of papers written by a researcher by each year.

### Example

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.

scene := PMScene new figureType: PMFractalFigureByYears; model: lanza.

scene open.
```