I am the manager class responsable for drawing fractals

I use internally PMFractal, I hold instances of a rossal canvas and layout
the layout can be customised by the setter

- to create an instance use: PMFractalManager build
- default layout is RSFlowLayout, you can change it with setLayout.

TODO: for now the message "addPerson: withName:" accept a dictionary, it should accept a person
object directly without the "withName" and there should be an internal method to extract
the dictionary


Example for draw
```st
|manager dict dict2 dict3|

dict := Dictionary newFrom: { 'a' -> 3 . 'b' -> 5 . 'd' -> 2 }.
dict2 := Dictionary newFrom: { 'e' -> 10 . 'f' -> 5 . 'g' -> 11 }.
dict3 := Dictionary newFrom: { 'h' -> 11 . '6' -> 5 . 'l' -> 15. 'z' -> 4 }.

manager := PMFractalManager build .
manager addPerson: dict withName: 'Bob'.
manager addPerson: dict2 withName: 'Jhon'.
manager addPerson: dict3 withName: 'Joe'.

manager draw.
```

example for animate
```st
| autor MC FM|
author := PMEntryPoint getMochAuthor.
MC := PMEntryPoint getMochExtractorFromAuthor: autor.
FM := PMFractalManager build.
FM animate: author with: MC.
```


  