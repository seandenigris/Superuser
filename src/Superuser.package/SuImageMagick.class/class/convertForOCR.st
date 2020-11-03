instance creation
convertForOCR

	^ self new
		template: self binary, ' -density 300 {inputFile} -depth 8 -strip -background white -alpha off {outputFile}'; "Adapted from https://dfir.science/2017/04/tesseract-ocr-extract-text-from-images.html"
		yourself.