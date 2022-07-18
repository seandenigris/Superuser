"
!Installation
On Mac, you can install via Homebrew like this:
[[[language=shell
brew install imagemagick
]]]

"
Class {
	#name : #SuImageMagick,
	#superclass : #SuGenericUnixCommand,
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuImageMagick class >> binaryName [
	^ 'magick'
]

{ #category : #'instance creation' }
SuImageMagick class >> convertForOCR [

	^ self new
		template: self binary, ' -density 300 {inputFile}{pageRange} -depth 8 -strip -background white -alpha off {outputFile}'; "Adapted from https://dfir.science/2017/04/tesseract-ocr-extract-text-from-images.html"
		yourself.
]

{ #category : #'instance creation' }
SuImageMagick class >> crop [

	^ self new
		template: self binary, ' {input} -crop {width}x{height}+{xOffset}+{yOffset} {output}' "Adapted from https://superuser.com/a/1163824"
		yourself.
]

{ #category : #convenience }
SuImageMagick class >> crop: inputFile to: aRectangle as: outputFile [

	^ self crop
		argumentAt: #input put: inputFile;
		argumentAt: #output put: outputFile;
		argumentAt: #width put: aRectangle width;
		argumentAt: #height put: aRectangle height;
		argumentAt: #xOffset put: aRectangle left;
		argumentAt: #yOffset put: aRectangle top;
		run.
]

{ #category : #accessing }
SuImageMagick >> prepareArguments: aCollection [
	| pageRangeString |
	"Page range is optional, but format: doesn't handle optional variables, so we add the right thing here either way"
	pageRangeString := aCollection
		at: #pageRange
		ifPresent: [ :int | '[' , (int first - 1) asString, '-' , (int last - 1) asString, ']' "adapted from https://stackoverflow.com/a/12614851" ]
		ifAbsent: [ '' ].
	aCollection
		at: #pageRange put: pageRangeString;
		yourself.
	super prepareArguments: aCollection
]
