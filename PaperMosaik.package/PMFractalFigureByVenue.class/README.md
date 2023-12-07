I represent a fractal figures for Venues.

### Example

```st
canvas := RSCanvas new .

figureAIfield := PMFractalFigureByVenue new model: 'Artificial Intelligence' year: 2018 .
figureSWEfield := PMFractalFigureByVenue new model: 'Software Engineering' year: 2018 .
figureMLfield := PMFractalFigureByVenue new model: 'Machine Learning' year: 2018 .
figureCIfield := PMFractalFigureByVenue new model: 'Computational Intelligence' year: 2018 .

group := RSGroup new.
group add: figureAIfield.
group add: figureSWEfield.
group add: figureMLfield.
group add: figureCIfield.

"And if you want to test other fields: PMVenue allFields return the fields"

grid := RSGridLayout new.
grid applyOn: group .

canvas add: group asShape  .

canvas @ RSCanvasController  .

canvas open.

1.
```

## Example with all fields

```st
canvas := RSCanvas new .

group := RSGroup new.

PMVenue allFields do: [ :fieldName | group add: (PMFractalFigureByVenue new model: fieldName year: 2018 ) ] .

grid := RSGridLayout new.
grid applyOn: group .

canvas add: group asShape  .

canvas @ RSCanvasController  .

canvas open.

1.
```