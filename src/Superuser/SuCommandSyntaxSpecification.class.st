Class {
	#name : #SuCommandSyntaxSpecification,
	#superclass : #TestCase,
	#category : 'Superuser-Core'
}

{ #category : #asserting }
SuCommandSyntaxSpecification >> assert: actualCollection hasEqualElements: expectedCollection [

	self
		assert: (actualCollection hasEqualElements: expectedCollection)
		description: [ | actualDescription |
			actualDescription := actualCollection printString allButFirst: 'an OrderedCollection' size.
			'Expected ', expectedCollection printString allButFirst, ' but got ', actualDescription ].
]

{ #category : #'as yet unclassified' }
SuCommandSyntaxSpecification >> test1 [

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
]

{ #category : #'as yet unclassified' }
SuCommandSyntaxSpecification >> test2 [

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
]

{ #category : #'as yet unclassified' }
SuCommandSyntaxSpecification >> testFlagNoLongForm [

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
]
