I represent a scene on which you can put fractal figures

### Example
To visualize a researcher with all his collaborators accross his entire career without animations:

```st
PMResearcher Researchers.

lanza := PMResearcher Researchers at: 'Michele Lanza'.

scene := PMResearchersScene new model: lanza.

scene open.
```

To animate a researcher and his collaborators from 2000 to 2020 with a 5 year window:

```st
PMResearcher Researchers.

lanza := PMResearchersScene Researchers at: 'Michele Lanza'.

scene := PMScene new model: lanza; startYear: 2000; endYear: 2020; window: 5.

scene open.
scene animate.
```