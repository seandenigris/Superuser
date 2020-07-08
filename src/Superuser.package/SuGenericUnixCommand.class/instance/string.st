as yet unclassified
string

	^ String streamContents: [ :s |
		self isRoot ifTrue: [ s nextPutAll: 'sudo ' ].
		s nextPutAll: string.
		outputRedirect ifNotNil: [ :target |
			s
				nextPutAll: ' > ';
				nextPutAll: target forCommand ].
		redirectErrorsToOutput ifTrue: [ s nextPutAll: ' 2>&1' ].
		isBackground ifTrue: [ s nextPutAll: ' &' ] ].