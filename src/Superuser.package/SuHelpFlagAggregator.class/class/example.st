example
example
	<gtExample>
	| flags |
	flags := SuHelpFlagAggregator new accept: SuHelpParser exampleOptionsSection.
	self assert: flags isNotEmpty.
	^ flags