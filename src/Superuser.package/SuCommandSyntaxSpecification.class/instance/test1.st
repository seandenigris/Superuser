as yet unclassified
test1

	| flag syntax completions |
	flag := SuFlag new
		shortForm: '-v';
		longForm: '--verbose';
		description: 'increase verbosity'.
	syntax := SuCommandSyntax new
		binary: '/usr/bin/rsync' asFileReference;
		addFlag: flag;
		yourself.
		
	completions := syntax completionsFor: 'rsync '.

	self assert: completions hasEqualElements: #('-v' '--verbose').