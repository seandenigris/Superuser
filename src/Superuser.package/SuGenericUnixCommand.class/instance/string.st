accessing
string
	^ String streamContents: [ :s |
		self isRoot ifTrue: [ s nextPutAll: 'sudo ' ].
		s nextPutAll: self basicCommandString.
		outputRedirect ifNotNil: [ :target |
			s
				nextPutAll: ' > ';
				nextPutAll: target suForCommand ].
		redirectErrorsToOutput ifTrue: [ s nextPutAll: ' 2>&1' ].
		isBackground ifTrue: [ s nextPutAll: ' &' ] ].