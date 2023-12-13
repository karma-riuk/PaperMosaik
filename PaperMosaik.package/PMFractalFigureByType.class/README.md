I represent a fractal figure that displays the number of papers written by a researcher by type of paper.

### Example

```st
lanza := PMResearcher Researchers at: 'Michele Lanza'.

scene := PMResearchersScene  new model: lanza.

scene open.
```