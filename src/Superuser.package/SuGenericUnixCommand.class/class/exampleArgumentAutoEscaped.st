examples
exampleArgumentAutoEscaped
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls {1}';
		argumentSource: { FileLocator imageDirectory };
		yourself.
	result run.
	^ result