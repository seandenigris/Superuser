convenience
crop: inputFile to: aRectangle as: outputFile

	^ self crop
		argumentAt: #input put: inputFile;
		argumentAt: #output put: outputFile;
		argumentAt: #width put: aRectangle width;
		argumentAt: #height put: aRectangle height;
		argumentAt: #xOffset put: aRectangle left;
		argumentAt: #yOffset put: aRectangle top;
		run.