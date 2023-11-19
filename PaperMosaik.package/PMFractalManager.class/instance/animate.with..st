canvas drawing
animate: author with: metricsExtractor

| yearToDraw figure startYearToDraw yearLabel |
    
    startYearToDraw := metricsExtractor startingYear.
    yearToDraw := startYearToDraw.
    yearLabel := RSLabel new text: yearToDraw .
    canvas add: yearLabel.
    
    figure := PMFractal
                  draw:
                  (metricsExtractor publicationCountersByType: yearToDraw)
                  authorName: author authorName
                  canvas: canvas.
        
    RSLocation new
        bottom;
        outer;
        right;
        offset: 20;
        stick: yearLabel on: figure.
        
    canvas newAnimation repeat "TODO: delegate the animation to the PMFractal class (and also do it properly, not this hacky version)"
        duration: 1.5 seconds;
        when: RSAnimationLoopEvent do: [ :evt | 
            canvas removeShape: figure.
            yearToDraw := yearToDraw + 1.
            yearToDraw >= metricsExtractor endingYear ifTrue: [
                        yearToDraw := startYearToDraw.
                    ].
            figure := PMFractal
                draw: (metricsExtractor publicationCountersByType: yearToDraw)
                authorName: author authorName
                canvas: canvas.
            yearLabel text: yearToDraw.
            
            canvas zoomToFit.
        ].
"    canvas camera translateBy: 0 @ -100."
    canvas zoomToFit.
    canvas open.
    ^ canvas