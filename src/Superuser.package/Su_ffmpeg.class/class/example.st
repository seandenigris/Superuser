examples
example
	<gtExample>
	| result |
	result := self new
		argumentAt: #inputFile put: RlJpeg example asFileReference;
		yourself.
	self assert: result extent equals: 934@1700.
	self assert: (result string matchesRegex: 'ffmpeg -i ".*\.jpg" 2>&1').
	^ result