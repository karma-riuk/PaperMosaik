I represent a part of a fractal figure, aka rectangle of a certain color.

**Note:** I am supposed to represent an object, so be sure that pass it to me via the `model:` message. If you click on me, you can inspect the content of my model.

### Example

```st
publication1 := PMPublication newWithId: 'pub001' .
publication2 := PMPublication newWithId: 'pub002'.

publication2
	type: 'journal-article' ;
	title: 'Fractal Figures' ;
	year: 2010.
	
publication2
	type: 'journal-article' ;
	title: 'Some name' ;
	year: 2011.
	
fractalPart := PMFractalPart
			               withWidth: 100
			               withHeight: 10
			               withColor: #blue.
			
fractalPart model: { publication1 . publication2 . }.
```