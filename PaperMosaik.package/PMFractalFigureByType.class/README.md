I represent a fractal figure that displays the number of papers written by a researcher by each type of paper they write.

### Example

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.

scene := PMScene new figureType: PMFractalFigureByType; model: lanza.

scene open.
```
