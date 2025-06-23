"
requires `librsvg`
"
Class {
	#name : #SuRsvgConvert,
	#superclass : #SuGenericUnixCommand,
	#category : #Superuser
}

{ #category : #accessing }
SuRsvgConvert class >> binaryName [

	^ 'rsvg-convert'
]

{ #category : #accessing }
SuRsvgConvert class >> from: sourceFile to: targetFile [

	^ self new
		template: self binary, ' -o {targetFile} {sourceFile}';
		argumentAt: #sourceFile put: sourceFile;
		argumentAt: #targetFile put: targetFile;
		run
]
