as yet unclassified
test2

	| syntax completions vFlag qFlag |
	vFlag := SuFlag new
		shortForm: '-v';
		longForm: '--verbose';
		description: 'increase verbosity'.
	qFlag := SuFlag new
		shortForm: '-q';
		longForm: '--quiet';
		description: 'suppress non-error messages'.
	syntax := SuCommandSyntax new
		binary: '/usr/bin/rsync' asFileReference;
		addFlag: vFlag;
		addFlag: qFlag;
		yourself.
		
	completions := syntax completionsFor: 'rsync '.
	self assert: completions hasEqualElements: #('-v' '--verbose' '-q' '--quiet').