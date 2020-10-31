instance creation
convertForOCR

	^ self new
		template: self binary, ' -density 300 {inputFile} -depth 8 -strip -background white -alpha off {outputFile}';
		yourself.