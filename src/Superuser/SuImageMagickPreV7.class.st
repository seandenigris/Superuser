Class {
	#name : #SuImageMagickPreV7,
	#superclass : #SuImageMagick,
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuImageMagickPreV7 class >> binaryName [
	^ 'convert'
]

{ #category : #'instance creation' }
SuImageMagickPreV7 class >> convertForOCR [

	^ self new
		template: self binary, ' -o {outputFile} -dSAFER -dQUIET -sDEVICE=png16m -dINTERPOLATE -dNumRenderingThreads=8 -r300 -c 30000000 setvmthreshold -f {inputFile}';
		yourself.
	
	"GS option explanations:
		-dSAFER \ # prevent unwanted file writing
		-dQUIET \ # suppress some console output
		-sDEVICE=png16m \ # Save in 24 bit color, -sDEVICE=pnggray -dTextAlphaBits=4 worked equally well; tiffg4 (from [GH](https://gist.github.com/henrik/1967035)) *is for B&W* and was awful on grayscale input, tiff12nc caused an error apparently because it's not compressed
		-dINTERPOLATE \ # Designed to improve the quality of images that have been upscaled from a smaller size
		-dNumRenderingThreads=8 \ #Gs recommends setting this option to the maximum number of available cores
		-r300 \ # Default of 72dpi is much too low for good results; 300dpi seems to be the consensus
		-c 30000000 setvmthreshold -f \ # Boost performance with 30MB extra RAM for complex PDFs"
]
