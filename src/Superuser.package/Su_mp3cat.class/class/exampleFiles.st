examples
exampleFiles
	<gtExample>
	| result |
	result := self new
		input: { FileLocator home / 'input1.mp3'. FileLocator home / 'input2.mp3' };
		yourself.
	self assert: (result output isKindOf: Tempfile).
	^ result