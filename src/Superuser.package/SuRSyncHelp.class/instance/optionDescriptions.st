as yet unclassified
optionDescriptions

	| lines matcher |
	lines := self optionDescriptionLines.
	matcher := RxMatcher forString: ' -(.), --([^ ]+) +(.+)'.
	lines collect: [ :e |
		(matcher matches: e) ifFalse: [ self error: 'uh oh' ].
		{ matcher subexpression: 2. matcher subexpression: 3. matcher subexpression: 4 } ]