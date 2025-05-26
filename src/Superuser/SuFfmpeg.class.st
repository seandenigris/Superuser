"
Technique adapted from https://stackoverflow.com/a/7362274
"
Class {
	#name : #SuFfmpeg,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'input'
	],
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuFfmpeg class >> binaryName [
	^ 'ffmpeg'
]

{ #category : #'instance creation' }
SuFfmpeg class >> convertingVideoToAnimatedGIF [
	^ self new
		template: self binary, ' -i {inputFile} -vf "fps=10,scale={gifWidth}:-1:flags=lanczos" -c:v pam -f image2pipe - | convert -delay 10 - -loop 0 -layers optimize {outputFile}'; "Adapted from *https://superuser.com/a/556031*"
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
	| info matches width |
	info := self
		redirectErrorsToOutput;
		output.
	matches := info allRegexMatches: ', ([1-9]\d*)x(\d+)'.
	self assert: matches size equals: 1.
	width := ((matches first copyUpTo: $x) allButFirst: 2) asNumber.
	^ width @ (matches first copyAfter: $x) asNumber.
	
	"Implementation note: we match unrelated characters at the start and end, only to trim them again, to account for an edge case where the input filename matches the pattern"
]

{ #category : #accessing }
SuFfmpeg >> initialize [
	super initialize.
	template := self binary, ' -i {inputFile}'.
	^ self
]

{ #category : #'as yet unclassified' }
SuFfmpeg >> reencodeForQT [
	'ffmpeg -i input.mp4 -f mp4 -vcodec libx264 output.mp4'
]

{ #category : #'as yet unclassified' }
SuFfmpeg >> rotateVideo [
	"From https://stackoverflow.com/questions/3937387/rotating-videos-with-ffmpeg
	
	0 = 90CounterCLockwise and Vertical Flip (default)
1 = 90Clockwise
2 = 90CounterClockwise
3 = 90Clockwise and Vertical Flip

Use transpose=2,transpose=2 for 180 degrees."
	
	'ffmpeg -i in.mov -vf "transpose=1" out.mov'
]

{ #category : #'as yet unclassified' }
SuFfmpeg >> trim [
	"From https://stackoverflow.com/questions/18444194/cutting-the-videos-based-on-start-and-end-time-using-ffmpeg"
	
	'ffmpeg -i movie.mp4 -ss 00:00:03 -t 00:00:08 -async 1 cut.mp4
'
]
