examples
exampleArgumentAutoEscaped
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls {1}';
		argumentAt: 1 put: FileLocator imageDirectory;
		yourself.
	result run.
	self assert: (result string matchesRegex: 'ls "/[^"]+"').
	^ result