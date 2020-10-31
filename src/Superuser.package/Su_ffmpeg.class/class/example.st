examples
example
	<gtExample>
	| result |
	result := self new
		argumentAt: #inputFile put: self samplePNG_File;
		yourself.
	self assert: result extent equals: 342@114.
	self assert: (result string matchesRegex: 'ffmpeg -i ".*\.png" 2>&1').
	^ result