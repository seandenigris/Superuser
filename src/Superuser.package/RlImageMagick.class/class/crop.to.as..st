instance creation
crop: inputFile to: aRectangle as: outputFile

	^ self crop
		argumentSource: { 
			#input -> inputFile.
			#output -> outputFile.
			#width -> aRectangle width.
			#height -> aRectangle height.
			#xOffset -> aRectangle left.
			#yOffset -> aRectangle top } asDictionary;
		run.