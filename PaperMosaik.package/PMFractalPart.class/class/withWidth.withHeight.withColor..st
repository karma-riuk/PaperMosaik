creating
withWidth: width withHeight: height withColor: color
	^ self new points: { 0 @ 0 . width @ 0. width @ height. 0 @ height }; color: color