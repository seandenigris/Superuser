accessing
initialize
	super initialize.
	template := 'ffmpeg -i {inputFile}'.
	^ self