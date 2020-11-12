instance creation
creatingPreview
	^ self new
		template: self binary, ' -dFirstPage=1 -dLastPage=1 -sDEVICE=jpeg -sOutputFile={outputFile}.jpg -dBATCH -dNOPAUSE -q  {inputFile}';
		yourself