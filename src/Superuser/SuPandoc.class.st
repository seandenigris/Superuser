Class {
	#name : #SuPandoc,
	#superclass : #SuGenericUnixCommand,
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuPandoc class >> binaryName [
	^ 'pandoc'
]

{ #category : #'instance creation' }
SuPandoc class >> markdownToRTF [

	^ self new
		template: self binary, ' -f markdown -t rtf -s {inputFile} -o {outputFile}';
		yourself.
]

{ #category : #'instance creation' }
SuPandoc class >> rtfToMarkdown [

	^ self new
		template: self binary, ' -f rtf -t markdown -s {inputFile} -o {outputFile}';
		yourself.
]
