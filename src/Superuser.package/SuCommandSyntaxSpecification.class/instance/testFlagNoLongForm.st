as yet unclassified
testFlagNoLongForm

	| syntax completions flag |
	flag := SuFlag new
		shortForm: '-f';
		description: 'force'.
	syntax := SuCommandSyntax new
		binary: '/bin/rm' asFileReference;
		addFlag: flag;
		yourself.
		
	completions := syntax completionsFor: 'rm '.
	self assert: completions hasEqualElements: #('-f').