examples
exampleNoArguments
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls';
		yourself.
	result run.
	^ result