Class {
	#name : #SuHdiutil,
	#superclass : #SuGenericUnixCommand,
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuHdiutil class >> binaryName [
	^ 'hdiutil'
]

{ #category : #'instance creation' }
SuHdiutil class >> convertForOCR [

	^ self new
		template: self binary, ' -density 300 {inputFile} -depth 8 -strip -background white -alpha off {outputFile}';
		yourself.
]

{ #category : #'instance creation' }
SuHdiutil class >> mounting [

	^ self new
		template: self binary, ' attach {diskImage}';
		yourself.
]
