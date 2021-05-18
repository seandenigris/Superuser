examples
exampleFolder
	<gtExample>
	| result |
	result := self new
		input: FileLocator home;
		yourself.
	self assert: (result output isKindOf: Tempfile).
	^ result