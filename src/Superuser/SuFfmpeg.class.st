"
Technique adapted from https://stackoverflow.com/a/7362274
"
Class {
	#name : #SuFfmpeg,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'input'
	],
	#category : 'Superuser-Core'
}

{ #category : #'instance creation' }
SuFfmpeg class >> convertingVideoToAnimatedGIF [
	^ self new
		template: 'ffmpeg -i {inputFile} -vf "fps=10,scale={gifWidth}:-1:flags=lanczos" -c:v pam -f image2pipe - | convert -delay 10 - -loop 0 -layers optimize {outputFile}'; "Adapted from *https://superuser.com/a/556031*"
		argumentAt: #outputFile put: (Tempfile withSuffix: '.gif');
		yourself.
	
]

{ #category : #examples }
SuFfmpeg class >> example [
	<gtExample>
	| result |
	result := self new
		argumentAt: #inputFile put: self samplePNG_File;
		yourself.
	self assert: result extent equals: 342@114.
	self assert: (result string matchesRegex: 'ffmpeg -i ".*\.png" 2>&1').
	^ result
]

{ #category : #accessing }
SuFfmpeg >> extent [
	| info matches |
	info := self
		redirectErrorsToOutput;
		output.
	matches := info allRegexMatches: '([1-9]\d*)x(\d+)'.
	self assert: matches size equals: 1.
	^ (matches first copyUpTo: $x) asNumber @ (matches first copyAfter: $x) asNumber.
]

{ #category : #accessing }
SuFfmpeg >> initialize [
	super initialize.
	template := 'ffmpeg -i {inputFile}'.
	^ self
]
