as yet unclassified
run

	| exitCode |
	exitCode := self isRoot
		ifTrue: [ self runInTerminal ]
		ifFalse: [ self class run: self string ].
	exitCode = 0 ifFalse: [ self error: 'Exit code ', exitCode asString, ' returned from ', self string ]