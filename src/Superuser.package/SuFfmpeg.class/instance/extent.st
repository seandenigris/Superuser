accessing
extent
	| info matches |
	info := self
		redirectErrorsToOutput;
		output.
	matches := info allRegexMatches: '([1-9]\d*)x(\d+)'.
	self assert: matches size equals: 1.
	^ (matches first copyUpTo: $x) asNumber @ (matches first copyAfter: $x) asNumber.